import UIKit
import Alamofire

protocol LoadBusinessLogic {
    func setup(request: LoadModel.Setup.Request)
    func downloadData(request: LoadModel.DownloadData.Request)
}

protocol LoadDataStore {
    var apodapiModels: [ApodapiModel] { get set }
}

class LoadInteractor: LoadBusinessLogic, LoadDataStore {
    var presenter: LoadPresentationLogic?

    var apodapiModels: [ApodapiModel] = []

    func setup(request: LoadModel.Setup.Request) {
        let response = LoadModel.Setup.Response()
        presenter?.presentSetup(response: response)
    }

    func downloadData(request: LoadModel.DownloadData.Request) {
        AF.request("https://apodapi.herokuapp.com/search/?search_query=planets&number=100").responseJSON { [weak self] resp in
            guard let self = self else { return }

            switch resp.result {
            case .success(let json):
                if let elements = json as? [Any] {
                    elements.forEach { element in
                        if let bind = element as? [String: Any] {
                            self.apodapiModels.append(ApodapiParser.bind(json: bind))
                        }
                    }
                }

                let response = LoadModel.DownloadData.Response()
                self.presenter?.presentDownloadData(response: response)

            case .failure(_):
                self.downloadData(request: request)
            }
        }
    }
}
