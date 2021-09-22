import UIKit
import Alamofire

protocol DetailBusinessLogic {
    func setup(request: DetailModel.Setup.Request)
    func downloadData(request: DetailModel.DownloadData.Request)
    func editData(request: DetailModel.EditData.Request)
    func saveData(request: DetailModel.SaveData.Request)
}

protocol DetailDataStore {
    var indexModel: Int { get set }
    var apodapiModel: ApodapiModel { get set }
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore {
    var presenter: DetailPresentationLogic?

    var indexModel: Int = -1
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

    func editData(request: DetailModel.EditData.Request) {
        let response = DetailModel.EditData.Response()
        presenter?.presentEditData(response: response)
    }

    func saveData(request: DetailModel.SaveData.Request) {
        apodapiModel.title = request.title
        apodapiModel.description = request.description
        apodapiModel.date = request.date
        apodapiModel.copyright = request.copyright

        let response = DetailModel.SaveData.Response(index: indexModel, model: apodapiModel)
        presenter?.presentSaveData(response: response)
    }
}
