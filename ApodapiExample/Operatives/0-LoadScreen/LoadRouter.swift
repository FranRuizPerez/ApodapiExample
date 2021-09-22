import UIKit

protocol LoadRoutingLogic {
    func routeToList()
}

protocol LoadDataPassing {
    var dataStore: LoadDataStore? { get }
}

class LoadRouter: NSObject, LoadRoutingLogic, LoadDataPassing {
    weak var viewController: LoadViewController?
    var dataStore: LoadDataStore?

    func routeToList() {
        let sb = UIStoryboard(name: ListViewController.sbIdentifier, bundle: .main)
        if let vc = sb.instantiateViewController(identifier: ListViewController.vcIdentifier) as? ListViewController, var ds = vc.router?.dataStore {
            passDataToList(source: dataStore!, destination: &ds)
            navigateToList(source: viewController!, destination: vc)
        }
    }

    func passDataToList(source: LoadDataStore, destination: inout ListDataStore) {
        destination.apodapiModels = source.apodapiModels
    }

    func navigateToList(source: LoadViewController, destination: ListViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
}
