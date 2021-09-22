import UIKit

protocol LoadDisplayLogic: AnyObject {
    func setup()
    func displaySetup(viewModel: LoadModel.Setup.ViewModel)
    func downloadData()
    func displayDownloadData(viewModel: LoadModel.DownloadData.ViewModel)
}

class LoadViewController: UIViewController {
    @IBOutlet weak var actionLabel: UILabel?
    @IBOutlet weak var indicatorView: UIActivityIndicatorView?

    var interactor: LoadBusinessLogic?
    var router: (NSObjectProtocol & LoadRoutingLogic & LoadDataPassing)?

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
        let interactor = LoadInteractor()
        let presenter = LoadPresenter()
        let router = LoadRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
}

extension LoadViewController: LoadDisplayLogic {
    func setup() {
        let request = LoadModel.Setup.Request()
        interactor?.setup(request: request)
    }

    func displaySetup(viewModel: LoadModel.Setup.ViewModel) {
        title = viewModel.navigationTitle
        view.backgroundColor = viewModel.backgroundColor
        actionLabel?.text = viewModel.actionTitle
        actionLabel?.textColor = viewModel.actionColor
        indicatorView?.startAnimating()
        downloadData()
    }

    func downloadData() {
        let request = LoadModel.DownloadData.Request()
        interactor?.downloadData(request: request)
    }

    func displayDownloadData(viewModel: LoadModel.DownloadData.ViewModel) {
        router?.routeToList()
    }
}
