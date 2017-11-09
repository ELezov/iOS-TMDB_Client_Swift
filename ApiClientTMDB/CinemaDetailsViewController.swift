import UIKit
import RxSwift
import RxCocoa


class CinemaDetailsViewController: UIViewController {
    
    @IBOutlet weak var cinemaTitle: UILabel!
    @IBOutlet weak var cinemaOverview: UILabel!
    
    
    static let id = "CinemaDetailsViewController"
    var cinemaDetailsViewModel: CinemaDetailsViewModel?
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        initBindingViews()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initBindingViews(){
        cinemaDetailsViewModel?.cinemaTitle.bind(to: cinemaTitle.rx.text)
        .addDisposableTo(disposeBag)
        
        cinemaDetailsViewModel?.cinemaOverview.bind(to: cinemaOverview.rx.text)
        .addDisposableTo(disposeBag)
    }
}
