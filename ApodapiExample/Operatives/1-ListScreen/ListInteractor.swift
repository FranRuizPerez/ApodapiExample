import UIKit
import Alamofire

protocol ListBusinessLogic {
}

protocol ListDataStore {
    var apodapiModels: [ApodapiModel] { get set }
}

class ListInteractor: ListBusinessLogic, ListDataStore {
    var presenter: ListPresentationLogic?

    var apodapiModels: [ApodapiModel] = []
}
