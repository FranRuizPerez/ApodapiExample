import UIKit
import Alamofire

struct ApodapiModel {
    var title: String = ""
    var description: String = ""
    var copyright: String = ""
    var date: String = ""
    var url: String = ""
    var hdurl: String = ""
    var mediaType: String = ""
    var apodSite: String = ""

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

    func downloadHDImage(completion: @escaping (UIImage?) -> Void) {
        AF.request(hdurl).responseData { resp in
            switch resp.result {
            case .success(let data):
                completion(UIImage(data: data))
            case .failure(_):
                completion(nil)
            }
        }
    }
}
