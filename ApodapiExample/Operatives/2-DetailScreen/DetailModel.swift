import UIKit

enum DetailModel {
    enum Setup {
        struct Request { }
        struct Response {
            let model: ApodapiModel
        }
        struct ViewModel {
            let navigationTitle: String
            let titleLabel: String
            let descriptionLabel: String
            let dateLabel: String
            let copyrightLabel: String
        }
    }

    enum DownloadData {
        struct Request { }
        struct Response {
            let downloadedImage: UIImage?
        }
        struct ViewModel {
            let downloadedImage: UIImage?
        }
    }
}
