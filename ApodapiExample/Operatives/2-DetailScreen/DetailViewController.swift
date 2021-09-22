import UIKit

protocol DetailDisplayLogic: AnyObject {
}

class DetailViewController: UIViewController {

    static let sbIdentifier = "DetailView"
    static let vcIdentifier = "DetailViewController"
    var interactor: DetailBusinessLogic?
    var router: (NSObjectProtocol & DetailRoutingLogic & DetailDataPassing)?

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
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension DetailViewController: DetailDisplayLogic {
}
