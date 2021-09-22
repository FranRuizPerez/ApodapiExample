import UIKit

protocol ListRoutingLogic {
    func routeToDetail(model: ApodapiModel)
    func routeToAdd()
}

protocol ListDataPassing {
    var dataStore: ListDataStore? { get }
}

class ListRouter: NSObject, ListRoutingLogic, ListDataPassing {
    weak var viewController: ListViewController?
    var dataStore: ListDataStore?

    func routeToDetail(model: ApodapiModel) {
        let sb = UIStoryboard(name: DetailViewController.sbIdentifier, bundle: .main)
        if let vc = sb.instantiateViewController(identifier: DetailViewController.vcIdentifier) as? DetailViewController, var ds = vc.router?.dataStore {
            passDataToDetail(source: model, destination: &ds)
            navigateToDetail(source: viewController!, destination: vc)
        }
    }

    func routeToAdd() {
        let sb = UIStoryboard(name: AddViewController.sbIdentifier, bundle: .main)
        if let vc = sb.instantiateViewController(identifier: AddViewController.vcIdentifier) as? AddViewController {
            vc.delegate = viewController
            navigateToAdd(source: viewController!, destination: vc)
        }
    }

    func passDataToDetail(source: ApodapiModel, destination: inout DetailDataStore) {
        destination.apodapiModel = source
    }

    func navigateToDetail(source: ListViewController, destination: DetailViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }

    func navigateToAdd(source: ListViewController, destination: AddViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
}
