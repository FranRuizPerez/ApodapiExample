import UIKit

enum LoadModel {
    enum Setup {
        struct Request { }
        struct Response { }
        struct ViewModel {
            let navigationTitle: String
            let backgroundColor: UIColor
            let actionTitle: String
            let actionColor: UIColor
        }
    }

    enum DownloadData {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
}
