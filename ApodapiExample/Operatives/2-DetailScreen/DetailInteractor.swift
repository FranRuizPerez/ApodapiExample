import UIKit
import Alamofire

protocol DetailBusinessLogic {
}

protocol DetailDataStore {
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore {
    var presenter: DetailPresentationLogic?
}
