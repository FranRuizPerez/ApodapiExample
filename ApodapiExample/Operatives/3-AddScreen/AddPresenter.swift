import UIKit

protocol AddPresentationLogic {
    func presentSetup(response: AddModel.Setup.Response)
    func presentAddMercury(response: AddModel.AddMercury.Response)
    func presentAddVenus(response: AddModel.AddVenus.Response)
    func presentAddEarth(response: AddModel.AddEarth.Response)
    func presentAddMars(response: AddModel.AddMars.Response)
    func presentAddJupiter(response: AddModel.AddJupiter.Response)
    func presentAddSaturn(response: AddModel.AddSaturn.Response)
    func presentAddUranus(response: AddModel.AddUranus.Response)
    func presentAddNeptune(response: AddModel.AddNeptune.Response)
    func presentAddPluto(response: AddModel.AddPluto.Response)
}

class AddPresenter: AddPresentationLogic {
    weak var viewController: AddDisplayLogic?

    func presentSetup(response: AddModel.Setup.Response) {
        let viewModel = AddModel.Setup.ViewModel(navigationTitle: "Añadir",
                                                 mercuryLabel: "Mercurio",
                                                 venusLabel: "Venus",
                                                 earthLabel: "Tierra",
                                                 marsLabel: "Marte",
                                                 jupiterLabel: "Jupiter",
                                                 saturnLabel: "Saturno",
                                                 uranusLabel: "Urano",
                                                 neptuneLabel: "Neptuno",
                                                 plutoLabel: "Pluton")
        viewController?.displaySetup(viewModel: viewModel)
    }

    func presentAddMercury(response: AddModel.AddMercury.Response) {
        let viewModel = AddModel.AddMercury.ViewModel(model: response.model)
        viewController?.displayAddMercury(viewModel: viewModel)
    }

    func presentAddVenus(response: AddModel.AddVenus.Response) {
        let viewModel = AddModel.AddVenus.ViewModel(model: response.model)
        viewController?.displayAddVenus(viewModel: viewModel)
    }

    func presentAddEarth(response: AddModel.AddEarth.Response) {
        let viewModel = AddModel.AddEarth.ViewModel(model: response.model)
        viewController?.displayAddEarth(viewModel: viewModel)
    }

    func presentAddMars(response: AddModel.AddMars.Response) {
        let viewModel = AddModel.AddMars.ViewModel(model: response.model)
        viewController?.displayAddMars(viewModel: viewModel)
    }

    func presentAddJupiter(response: AddModel.AddJupiter.Response) {
        let viewModel = AddModel.AddJupiter.ViewModel(model: response.model)
        viewController?.displayAddJupiter(viewModel: viewModel)
    }

    func presentAddSaturn(response: AddModel.AddSaturn.Response) {
        let viewModel = AddModel.AddSaturn.ViewModel(model: response.model)
        viewController?.displayAddSaturn(viewModel: viewModel)
    }

    func presentAddUranus(response: AddModel.AddUranus.Response) {
        let viewModel = AddModel.AddUranus.ViewModel(model: response.model)
        viewController?.displayAddUranus(viewModel: viewModel)
    }

    func presentAddNeptune(response: AddModel.AddNeptune.Response) {
        let viewModel = AddModel.AddNeptune.ViewModel(model: response.model)
        viewController?.displayAddNeptune(viewModel: viewModel)
    }

    func presentAddPluto(response: AddModel.AddPluto.Response) {
        let viewModel = AddModel.AddPluto.ViewModel(model: response.model)
        viewController?.displayAddPluto(viewModel: viewModel)
    }
}
