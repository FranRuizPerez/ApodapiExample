import UIKit
import Alamofire

protocol DetailBusinessLogic {
    func setup(request: DetailModel.Setup.Request)
    func downloadData(request: DetailModel.DownloadData.Request)
}

protocol DetailDataStore {
    var apodapiModel: ApodapiModel { get set }
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore {
    var presenter: DetailPresentationLogic?

    var apodapiModel: ApodapiModel = ApodapiModel()

    func setup(request: DetailModel.Setup.Request) {
        let response = DetailModel.Setup.Response(model: apodapiModel)
        presenter?.presentSetup(response: response)
    }

    func downloadData(request: DetailModel.DownloadData.Request) {
        apodapiModel.downloadHDImage { [weak self] image in
            guard let self = self else { return }

            let response = DetailModel.DownloadData.Response(downloadedImage: image)
            self.presenter?.presentDownloadData(response: response)
        }
    }
}
