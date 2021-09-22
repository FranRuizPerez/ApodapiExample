import UIKit

protocol ListDisplayLogic: AnyObject {
    func setup()
    func displaySetup(viewModel: ListModel.Setup.ViewModel)
}

class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView?

    static let sbIdentifier = "ListView"
    static let vcIdentifier = "ListViewController"
    var interactor: ListBusinessLogic?
    var router: (NSObjectProtocol & ListRoutingLogic & ListDataPassing)?

    var apodapiModels: [ApodapiModel] = []
    var downloadedImages: [UIImage?] = []

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
        let interactor = ListInteractor()
        let presenter = ListPresenter()
        let router = ListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setup()
    }

    @objc func addTapped() {
        router?.routeToAdd()
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func configureTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
        registerCells()
    }

    func registerCells() {
        tableView?.register(UINib(nibName: PlanetCell.identifier, bundle: .main), forCellReuseIdentifier: PlanetCell.identifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apodapiModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var customCell = UITableViewCell()

        if let cell = tableView.dequeueReusableCell(withIdentifier: PlanetCell.identifier) as? PlanetCell {
            cell.setup(model: apodapiModels[indexPath.row], image: downloadedImages[indexPath.row])
            customCell = cell
        }

        return customCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToDetail(model: apodapiModels[indexPath.row])
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            apodapiModels.remove(at: indexPath.row)
            downloadedImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        default: break
        }
    }
}

extension ListViewController: ListDisplayLogic {
    func setup() {
        apodapiModels = router?.dataStore?.apodapiModels ?? []
        downloadedImages = [UIImage?](repeating: nil, count: apodapiModels.count)

        let request = ListModel.Setup.Request()
        interactor?.setup(request: request)
    }

    func displaySetup(viewModel: ListModel.Setup.ViewModel) {
        title = viewModel.navigationTitle

        let add = UIBarButtonItem(title: viewModel.navigationAction, style: .plain, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItems = [add]

        downloadedImages = viewModel.downloadedImages
        tableView?.reloadData()
    }
}
