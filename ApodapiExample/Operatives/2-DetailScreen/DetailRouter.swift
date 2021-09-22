import UIKit

protocol DetailRoutingLogic {
    func routeToBack()
}

protocol DetailDataPassing {
    var dataStore: DetailDataStore? { get }
}

class DetailRouter: NSObject, DetailRoutingLogic, DetailDataPassing {
    weak var viewController: DetailViewController?
    var dataStore: DetailDataStore?

    func routeToBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
