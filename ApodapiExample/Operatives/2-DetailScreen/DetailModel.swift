import UIKit

enum DetailModel {
    enum Setup {
        struct Request { }
        struct Response {
            let model: ApodapiModel
        }
        struct ViewModel {
            let navigationTitle: String
            let navigationAction: String
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

    enum EditData {
        struct Request { }
        struct Response { }
        struct ViewModel {
            let navigationAction: String
        }
    }

    enum SaveData {
        struct Request {
            let title: String
            let description: String
            let date: String
            let copyright: String
        }
        struct Response {
            let index: Int
            let model: ApodapiModel
        }
        struct ViewModel {
            let index: Int
            let model: ApodapiModel
        }
    }
}
