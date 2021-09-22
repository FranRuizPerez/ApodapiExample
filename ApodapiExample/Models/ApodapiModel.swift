import UIKit
import Alamofire

struct ApodapiModel {
    let title: String
    let description: String
    let copyright: String
    let date: String
    let url: String
    let hdurl: String
    let mediaType: String
    let apodSite: String

    func downloadImage(completion: @escaping (UIImage?) -> Void) {
        AF.request(url).responseData { resp in
            switch resp.result {
            case .success(let data):
                completion(UIImage(data: data))
            case .failure(_):
                completion(nil)
            }
        }
    }
}
