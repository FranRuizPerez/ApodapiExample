import UIKit

protocol AddPresentationLogic {
    func presentSetup(response: AddModel.Setup.Response)
}

class AddPresenter: AddPresentationLogic {
    weak var viewController: AddDisplayLogic?

    func presentSetup(response: AddModel.Setup.Response) {
        let viewModel = AddModel.Setup.ViewModel()
        viewController?.displaySetup(viewModel: viewModel)
    }
}
