import UIKit
import Alamofire

protocol AddBusinessLogic {
    func setup(request: AddModel.Setup.Request)
    func addMercury(request: AddModel.AddMercury.Request)
    func addVenus(request: AddModel.AddVenus.Request)
    func addEarth(request: AddModel.AddEarth.Request)
    func addMars(request: AddModel.AddMars.Request)
    func addJupiter(request: AddModel.AddJupiter.Request)
    func addSaturn(request: AddModel.AddSaturn.Request)
    func addUranus(request: AddModel.AddUranus.Request)
    func addNeptune(request: AddModel.AddNeptune.Request)
    func addPluto(request: AddModel.AddPluto.Request)
}

protocol AddDataStore {
}

class AddInteractor: AddBusinessLogic, AddDataStore {
    var presenter: AddPresentationLogic?

    var apodapiModel: ApodapiModel = ApodapiModel()

    func setup(request: AddModel.Setup.Request) {
        let response = AddModel.Setup.Response()
        presenter?.presentSetup(response: response)
    }

    func addMercury(request: AddModel.AddMercury.Request) {
        let model = ApodapiModel(title: "Mercurio", description: "Mercurio Creado", copyright: "Fran Ruiz", date: "\(Date())", url: "", hdurl: "", mediaType: "", apodSite: "")
        let response = AddModel.AddMercury.Response(model: model)
        presenter?.presentAddMercury(response: response)
    }

    func addVenus(request: AddModel.AddVenus.Request) {
        let model = ApodapiModel(title: "Venus", description: "Venus Creado", copyright: "Fran Ruiz", date: "\(Date())", url: "", hdurl: "", mediaType: "", apodSite: "")
        let response = AddModel.AddVenus.Response(model: model)
        presenter?.presentAddVenus(response: response)
    }

    func addEarth(request: AddModel.AddEarth.Request) {
        let model = ApodapiModel(title: "Tierra", description: "Tierra Creado", copyright: "Fran Ruiz", date: "\(Date())", url: "", hdurl: "", mediaType: "", apodSite: "")
        let response = AddModel.AddEarth.Response(model: model)
        presenter?.presentAddEarth(response: response)
    }

    func addMars(request: AddModel.AddMars.Request) {
        let model = ApodapiModel(title: "Marte", description: "Marte Creado", copyright: "Fran Ruiz", date: "\(Date())", url: "", hdurl: "", mediaType: "", apodSite: "")
        let response = AddModel.AddMars.Response(model: model)
        presenter?.presentAddMars(response: response)
    }

    func addJupiter(request: AddModel.AddJupiter.Request) {
        let model = ApodapiModel(title: "Jupiter", description: "Jupiter Creado", copyright: "Fran Ruiz", date: "\(Date())", url: "", hdurl: "", mediaType: "", apodSite: "")
        let response = AddModel.AddJupiter.Response(model: model)
        presenter?.presentAddJupiter(response: response)
    }

    func addSaturn(request: AddModel.AddSaturn.Request) {
        let model = ApodapiModel(title: "Saturno", description: "Saturno Creado", copyright: "Fran Ruiz", date: "\(Date())", url: "", hdurl: "", mediaType: "", apodSite: "")
        let response = AddModel.AddSaturn.Response(model: model)
        presenter?.presentAddSaturn(response: response)
    }

    func addUranus(request: AddModel.AddUranus.Request) {
        let model = ApodapiModel(title: "Urano", description: "Urano Creado", copyright: "Fran Ruiz", date: "\(Date())", url: "", hdurl: "", mediaType: "", apodSite: "")
        let response = AddModel.AddUranus.Response(model: model)
        presenter?.presentAddUranus(response: response)
    }

    func addNeptune(request: AddModel.AddNeptune.Request) {
        let model = ApodapiModel(title: "Neptuno", description: "Neptuno Creado", copyright: "Fran Ruiz", date: "\(Date())", url: "", hdurl: "", mediaType: "", apodSite: "")
        let response = AddModel.AddNeptune.Response(model: model)
        presenter?.presentAddNeptune(response: response)
    }

    func addPluto(request: AddModel.AddPluto.Request) {
        let model = ApodapiModel(title: "Pluton", description: "Pluton Creado", copyright: "Fran Ruiz", date: "\(Date())", url: "", hdurl: "", mediaType: "", apodSite: "")
        let response = AddModel.AddPluto.Response(model: model)
        presenter?.presentAddPluto(response: response)
    }
}
