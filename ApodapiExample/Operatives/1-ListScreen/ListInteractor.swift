import UIKit
import Alamofire

protocol ListBusinessLogic {
    func setup(request: ListModel.Setup.Request)
}

protocol ListDataStore {
    var apodapiModels: [ApodapiModel] { get set }
}

class ListInteractor: ListBusinessLogic, ListDataStore {
    var presenter: ListPresentationLogic?

    var apodapiModels: [ApodapiModel] = []
    var downloadedImages: [UIImage?] = []

    func setup(request: ListModel.Setup.Request) {
        downloadedImages = [UIImage?](repeating: nil, count: apodapiModels.count)

        for (index, model) in apodapiModels.enumerated() {
            model.downloadImage { [weak self] image in
                guard let self = self else { return }
                self.downloadedImages[index] = image

                let response = ListModel.Setup.Response(downloadedImages: self.downloadedImages)
                self.presenter?.presentSetup(response: response)
            }
        }
    }
}
