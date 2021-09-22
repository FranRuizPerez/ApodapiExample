import UIKit

protocol ListDisplayLogic: AnyObject {
}

class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView?

    var interactor: ListBusinessLogic?
    var router: (NSObjectProtocol & ListRoutingLogic & ListDataPassing)?

    var apodapiModels: [ApodapiModel] { router?.dataStore?.apodapiModels ?? [] }

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
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

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
            cell.setup(model: apodapiModels[indexPath.row])
            customCell = cell
        }

        return customCell
    }
}

extension ListViewController: ListDisplayLogic {
}
