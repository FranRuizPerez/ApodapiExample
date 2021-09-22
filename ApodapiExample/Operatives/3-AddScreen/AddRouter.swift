import UIKit

protocol AddRoutingLogic {
    func routeToBack()
}

protocol AddDataPassing {
    var dataStore: AddDataStore? { get }
}

class AddRouter: NSObject, AddRoutingLogic, AddDataPassing {
    weak var viewController: AddViewController?
    var dataStore: AddDataStore?

    func routeToBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
