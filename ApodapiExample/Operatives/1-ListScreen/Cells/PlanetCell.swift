import UIKit

class PlanetCell: UITableViewCell {
    static let identifier = "PlanetCell"

    @IBOutlet weak var picture: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    @IBOutlet weak var copyrightLabel: UILabel?

    override func prepareForReuse() {
        picture?.image = UIImage(named: "Downloading")
        titleLabel?.text = ""
        dateLabel?.text = ""
        copyrightLabel?.text = ""
    }

    func setup(model: ApodapiModel) {
        picture?.image = UIImage(named: "Downloading")
        titleLabel?.text = model.title
        dateLabel?.text = model.date
        copyrightLabel?.text = model.copyright
    }
}
