import UIKit

protocol AddRoutingLogic {
}

protocol AddDataPassing {
    var dataStore: AddDataStore? { get }
}

class AddRouter: NSObject, AddRoutingLogic, AddDataPassing {
    weak var viewController: AddViewController?
    var dataStore: AddDataStore?
}
