import UIKit

protocol ListPresentationLogic {
    func presentSetup(response: ListModel.Setup.Response)
}

class ListPresenter: ListPresentationLogic {
    weak var viewController: ListDisplayLogic?

    func presentSetup(response: ListModel.Setup.Response) {
        let viewModel = ListModel.Setup.ViewModel(navigationTitle: "Listado",
                                                  navigationAction: "Añadir",
                                                  downloadedImages: response.downloadedImages)
        viewController?.displaySetup(viewModel: viewModel)
    }
}
