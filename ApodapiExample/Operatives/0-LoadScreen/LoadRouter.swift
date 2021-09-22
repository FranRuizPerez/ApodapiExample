import UIKit

@objc protocol LoadRoutingLogic {
    func routeToList()
}

protocol LoadDataPassing {
    var dataStore: LoadDataStore? { get }
}

class LoadRouter: NSObject, LoadRoutingLogic, LoadDataPassing {
    weak var viewController: LoadViewController?
    var dataStore: LoadDataStore?

    func routeToList() {
        //passDataToListOrders(source: dataStore!, destination: &destinationDS)
        //navigateToListOrders(source: viewController!, destination: destinationVC)
    }
    /*
    func passDataToList(source: LoadDataStore, destination: inout ListDataStore) {
    }

    func navigateToList(source: LoadViewController, destination: ListViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
    */
}
