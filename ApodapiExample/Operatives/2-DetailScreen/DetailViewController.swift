import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    func editPlanet(index: Int, model: ApodapiModel)
}

protocol DetailDisplayLogic: AnyObject {
    func setup()
    func displaySetup(viewModel: DetailModel.Setup.ViewModel)
    func downloadData()
    func dispayDownloadData(viewModel: DetailModel.DownloadData.ViewModel)
    func displayEditData(viewModel: DetailModel.EditData.ViewModel)
    func displaySaveData(viewModel: DetailModel.SaveData.ViewModel)
}

class DetailViewController: UIViewController {
    @IBOutlet weak var picture: UIImageView?
    @IBOutlet weak var indicatorView: UIActivityIndicatorView?
    @IBOutlet weak var titleLabel: UITextField?
    @IBOutlet weak var descriptionLabel: UITextView?
    @IBOutlet weak var dateLabel: UITextField?
    @IBOutlet weak var copyrightLabel: UITextField?

    weak var delegate: DetailViewControllerDelegate?

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

    @objc func editTapped() {
        let request = DetailModel.EditData.Request()
        interactor?.editData(request: request)
    }

    @objc func saveTapped() {
        let title = titleLabel?.text ?? ""
        let description = descriptionLabel?.text ?? ""
        let date = dateLabel?.text ?? ""
        let copyright = copyrightLabel?.text ?? ""

        let request = DetailModel.SaveData.Request(title: title, description: description, date: date, copyright: copyright)
        interactor?.saveData(request: request)
    }
}

extension DetailViewController: DetailDisplayLogic {
    func setup() {
        titleLabel?.isEnabled = false
        descriptionLabel?.isEditable = false
        dateLabel?.isEnabled = false
        copyrightLabel?.isEnabled = false

        let request = DetailModel.Setup.Request()
        interactor?.setup(request: request)
    }

    func displaySetup(viewModel: DetailModel.Setup.ViewModel) {
        title = viewModel.navigationTitle

        let edit = UIBarButtonItem(title: viewModel.navigationAction, style: .plain, target: self, action: #selector(editTapped))
        navigationItem.rightBarButtonItems = [edit]

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

    func displayEditData(viewModel: DetailModel.EditData.ViewModel) {
        titleLabel?.isEnabled = true
        descriptionLabel?.isEditable = true
        dateLabel?.isEnabled = true
        copyrightLabel?.isEnabled = true

        titleLabel?.borderStyle = .bezel
        descriptionLabel?.layer.borderWidth = 2.0
        descriptionLabel?.layer.borderColor = UIColor.gray.cgColor
        dateLabel?.borderStyle = .bezel
        copyrightLabel?.borderStyle = .bezel

        let edit = UIBarButtonItem(title: viewModel.navigationAction, style: .plain, target: self, action: #selector(saveTapped))
        navigationItem.rightBarButtonItems = [edit]
    }

    func displaySaveData(viewModel: DetailModel.SaveData.ViewModel) {
        delegate?.editPlanet(index: viewModel.index, model: viewModel.model)
        router?.routeToBack()
    }
}
