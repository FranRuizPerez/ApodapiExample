import UIKit
import Alamofire

protocol DetailBusinessLogic {
}

protocol DetailDataStore {
    var apodapiModel: ApodapiModel { get set }
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore {
    var presenter: DetailPresentationLogic?

    var apodapiModel: ApodapiModel = ApodapiModel()
}
