import UIKit

enum ListModel {
    enum Setup {
        struct Request { }
        struct Response {
            let downloadedImages: [UIImage?]
        }
        struct ViewModel {
            let navigationTitle: String
            let downloadedImages: [UIImage?]
        }
    }
}
