import UIKit

protocol LoadBusinessLogic {
    func setup(request: LoadModel.Setup.Request)
    func downloadData(request: LoadModel.DownloadData.Request)
}

protocol LoadDataStore {
}

class LoadInteractor: LoadBusinessLogic, LoadDataStore {
    var presenter: LoadPresentationLogic?

    func setup(request: LoadModel.Setup.Request) {
        let response = LoadModel.Setup.Response()
        presenter?.presentSetup(response: response)
    }

    func downloadData(request: LoadModel.DownloadData.Request) {
        let response = LoadModel.DownloadData.Response()
        presenter?.presentDownloadData(response: response)
    }
}
