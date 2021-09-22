import UIKit

protocol DetailPresentationLogic {
    func presentSetup(response: DetailModel.Setup.Response)
    func presentDownloadData(response: DetailModel.DownloadData.Response)
}

class DetailPresenter: DetailPresentationLogic {
    weak var viewController: DetailDisplayLogic?

    func presentSetup(response: DetailModel.Setup.Response) {
        let viewModel = DetailModel.Setup.ViewModel(navigationTitle: response.model.title,
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
}
