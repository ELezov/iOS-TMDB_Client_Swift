import UIKit
import Kingfisher

class CinemaTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var cinemaTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let id = "CinemaTableViewCell"
    
    var cinemaTableCellViewModel: CinemaTableCellViewModel? {
        didSet{
            resetViews()
            initViews()
        }
    }
    
    func resetViews() {
        self.cinemaTitleLabel.text = ""
        self.descriptionLabel.text = ""
        self.posterImage.image = UIImage(named: "placeholder")
    }
    
    func initViews(){
        self.cinemaTitleLabel.text = cinemaTableCellViewModel?.cinemaTitle
        if let overview = cinemaTableCellViewModel?.cinemaDescription {
            self.descriptionLabel.text = overview
        }
        if let path = cinemaTableCellViewModel?.cinemaImgUrl {
            let urlString = BASE_IMG_URL + W_185 + path
            self.posterImage.kf.setImage(with: URL(string: urlString), placeholder: UIImage(named: "placeholder"), options: [], progressBlock: nil, completionHandler: nil)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
