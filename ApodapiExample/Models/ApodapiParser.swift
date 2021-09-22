import UIKit

struct ApodapiParser {
    static func bind(json: [String: Any]) -> ApodapiModel {
        let title: String = json["title"] as? String ?? ""
        let description: String = json["description"] as? String ?? ""
        let copyright: String = json["copyright"] as? String ?? ""
        let date: String = json["date"] as? String ?? ""
        let url: String = json["url"] as? String ?? ""
        let hdurl: String = json["hdurl"] as? String ?? ""
        let mediaType: String = json["media_type"] as? String ?? ""
        let apodSite: String = json["apod_site"] as? String ?? ""

        return ApodapiModel(title: title, description: description, copyright: copyright, date: date, url: url, hdurl: hdurl, mediaType: mediaType, apodSite: apodSite)
    }
}
