import UIKit

protocol AddDisplayLogic: AnyObject {
    func setup()
    func displaySetup(viewModel: AddModel.Setup.ViewModel)
}

class AddViewController: UIViewController {

    static let sbIdentifier = "AddView"
    static let vcIdentifier = "AddViewController"
    var interactor: AddBusinessLogic?
    var router: (NSObjectProtocol & AddRoutingLogic & AddDataPassing)?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupArch()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupArch()
    }

    private func setupArch() {
        let viewController = self
        let interactor = AddInteractor()
        let presenter = AddPresenter()
        let router = AddRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension AddViewController: AddDisplayLogic {
    func setup() {
        let request = AddModel.Setup.Request()
        interactor?.setup(request: request)
    }

    func displaySetup(viewModel: AddModel.Setup.ViewModel) {
    }
}
