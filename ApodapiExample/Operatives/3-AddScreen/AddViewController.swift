import UIKit

protocol AddViewControllerDelegate: AnyObject {
    func addPlanet(model: ApodapiModel)
}

protocol AddDisplayLogic: AnyObject {
    func setup()
    func displaySetup(viewModel: AddModel.Setup.ViewModel)
    func displayAddMercury(viewModel: AddModel.AddMercury.ViewModel)
    func displayAddVenus(viewModel: AddModel.AddVenus.ViewModel)
    func displayAddEarth(viewModel: AddModel.AddEarth.ViewModel)
    func displayAddMars(viewModel: AddModel.AddMars.ViewModel)
    func displayAddJupiter(viewModel: AddModel.AddJupiter.ViewModel)
    func displayAddSaturn(viewModel: AddModel.AddSaturn.ViewModel)
    func displayAddUranus(viewModel: AddModel.AddUranus.ViewModel)
    func displayAddNeptune(viewModel: AddModel.AddNeptune.ViewModel)
    func displayAddPluto(viewModel: AddModel.AddPluto.ViewModel)
}

class AddViewController: UIViewController {
    @IBOutlet weak var mercuryButton: UIButton?
    @IBOutlet weak var venusButton: UIButton?
    @IBOutlet weak var earthButton: UIButton?
    @IBOutlet weak var marsButton: UIButton?
    @IBOutlet weak var jupiterButton: UIButton?
    @IBOutlet weak var saturnButton: UIButton?
    @IBOutlet weak var uranusButton: UIButton?
    @IBOutlet weak var neptuneButton: UIButton?
    @IBOutlet weak var plutoButton: UIButton?

    weak var delegate: AddViewControllerDelegate?

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

    @IBAction func mercuryClick(_ sender: Any) {
        let request = AddModel.AddMercury.Request()
        interactor?.addMercury(request: request)
    }

    @IBAction func venusClick(_ sender: Any) {
        let request = AddModel.AddVenus.Request()
        interactor?.addVenus(request: request)
    }

    @IBAction func earthClick(_ sender: Any) {
        let request = AddModel.AddEarth.Request()
        interactor?.addEarth(request: request)
    }

    @IBAction func marsClick(_ sender: Any) {
        let request = AddModel.AddMars.Request()
        interactor?.addMars(request: request)
    }

    @IBAction func jupiterClick(_ sender: Any) {
        let request = AddModel.AddJupiter.Request()
        interactor?.addJupiter(request: request)
    }

    @IBAction func saturnClick(_ sender: Any) {
        let request = AddModel.AddSaturn.Request()
        interactor?.addSaturn(request: request)
    }

    @IBAction func uranusClick(_ sender: Any) {
        let request = AddModel.AddUranus.Request()
        interactor?.addUranus(request: request)
    }

    @IBAction func neptuneClick(_ sender: Any) {
        let request = AddModel.AddNeptune.Request()
        interactor?.addNeptune(request: request)
    }

    @IBAction func plutoClick(_ sender: Any) {
        let request = AddModel.AddPluto.Request()
        interactor?.addPluto(request: request)
    }
}

extension AddViewController: AddDisplayLogic {
    func setup() {
        let request = AddModel.Setup.Request()
        interactor?.setup(request: request)
    }

    func displaySetup(viewModel: AddModel.Setup.ViewModel) {
        title = viewModel.navigationTitle
        mercuryButton?.setTitle(viewModel.mercuryLabel, for: .normal)
        venusButton?.setTitle(viewModel.venusLabel, for: .normal)
        earthButton?.setTitle(viewModel.earthLabel, for: .normal)
        marsButton?.setTitle(viewModel.marsLabel, for: .normal)
        jupiterButton?.setTitle(viewModel.jupiterLabel, for: .normal)
        saturnButton?.setTitle(viewModel.saturnLabel, for: .normal)
        uranusButton?.setTitle(viewModel.uranusLabel, for: .normal)
        neptuneButton?.setTitle(viewModel.neptuneLabel, for: .normal)
        plutoButton?.setTitle(viewModel.plutoLabel, for: .normal)
    }

    func displayAddMercury(viewModel: AddModel.AddMercury.ViewModel) {
        displayGenericPlanet(viewModel.model)
    }

    func displayAddVenus(viewModel: AddModel.AddVenus.ViewModel) {
        displayGenericPlanet(viewModel.model)
    }

    func displayAddEarth(viewModel: AddModel.AddEarth.ViewModel) {
        displayGenericPlanet(viewModel.model)
    }

    func displayAddMars(viewModel: AddModel.AddMars.ViewModel) {
        displayGenericPlanet(viewModel.model)
    }

    func displayAddJupiter(viewModel: AddModel.AddJupiter.ViewModel) {
        displayGenericPlanet(viewModel.model)
    }

    func displayAddSaturn(viewModel: AddModel.AddSaturn.ViewModel) {
        displayGenericPlanet(viewModel.model)
    }

    func displayAddUranus(viewModel: AddModel.AddUranus.ViewModel) {
        displayGenericPlanet(viewModel.model)
    }

    func displayAddNeptune(viewModel: AddModel.AddNeptune.ViewModel) {
        displayGenericPlanet(viewModel.model)
    }

    func displayAddPluto(viewModel: AddModel.AddPluto.ViewModel) {
        displayGenericPlanet(viewModel.model)
    }

    private func displayGenericPlanet(_ model: ApodapiModel) {
        delegate?.addPlanet(model: model)
        router?.routeToBack()
    }
}
