import UIKit

protocol DetailPresentationLogic {
    func presentSetup(response: DetailModel.Setup.Response)
    func presentDownloadData(response: DetailModel.DownloadData.Response)
    func presentEditData(response: DetailModel.EditData.Response)
    func presentSaveData(response: DetailModel.SaveData.Response)
}

class DetailPresenter: DetailPresentationLogic {
    weak var viewController: DetailDisplayLogic?

    func presentSetup(response: DetailModel.Setup.Response) {
        let viewModel = DetailModel.Setup.ViewModel(navigationTitle: response.model.title,
                                                    navigationAction: "Editar",
                                                    titleLabel: response.model.title,
                                                    descriptionLabel: response.model.description,
                                                    dateLabel: response.model.date,
                                                    copyrightLabel: response.model.copyright)
        viewController?.displaySetup(viewModel: viewModel)
    }

    func presentDownloadData(response: DetailModel.DownloadData.Response) {
        let viewModel = DetailModel.DownloadData.ViewModel(downloadedImage: response.downloadedImage)
        viewController?.dispayDownloadData(viewModel: viewModel)
    }

    func presentEditData(response: DetailModel.EditData.Response) {
        let viewModel = DetailModel.EditData.ViewModel(navigationAction: "Guardar")
        viewController?.displayEditData(viewModel: viewModel)
    }

    func presentSaveData(response: DetailModel.SaveData.Response) {
        let viewModel = DetailModel.SaveData.ViewModel(index: response.index, model: response.model)
        viewController?.displaySaveData(viewModel: viewModel)
    }
}
