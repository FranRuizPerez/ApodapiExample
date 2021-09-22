import UIKit
import Alamofire

protocol AddBusinessLogic {
    func setup(request: AddModel.Setup.Request)
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
}
