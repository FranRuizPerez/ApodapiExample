import UIKit

protocol DetailDisplayLogic: AnyObject {
    func setup()
    func displaySetup(viewModel: DetailModel.Setup.ViewModel)
    func downloadData()
    func dispayDownloadData(viewModel: DetailModel.DownloadData.ViewModel)
}

class DetailViewController: UIViewController {
    @IBOutlet weak var picture: UIImageView?
    @IBOutlet weak var indicatorView: UIActivityIndicatorView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    @IBOutlet weak var copyrightLabel: UILabel?

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

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension DetailViewController: DetailDisplayLogic {
    func setup() {
        let request = DetailModel.Setup.Request()
        interactor?.setup(request: request)
    }

    func displaySetup(viewModel: DetailModel.Setup.ViewModel) {
        title = viewModel.navigationTitle
        picture?.image = UIImage(named: "Downloading")
        indicatorView?.isHidden = false
        indicatorView?.startAnimating()
        titleLabel?.text = viewModel.titleLabel
        descriptionLabel?.text = viewModel.descriptionLabel
        dateLabel?.text = viewModel.dateLabel
        copyrightLabel?.text = viewModel.copyrightLabel
        downloadData()
    }

    func downloadData() {
        let request = DetailModel.DownloadData.Request()
        interactor?.downloadData(request: request)
    }

    func dispayDownloadData(viewModel: DetailModel.DownloadData.ViewModel) {
        indicatorView?.stopAnimating()
        indicatorView?.isHidden = true
        picture?.image = viewModel.downloadedImage
    }
}
