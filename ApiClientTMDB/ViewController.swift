import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var cinemaListViewModel: CinemaListViewModel?
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        initTable()
        initBindingViews()
    }
    
    func initViewModel(){
        self.cinemaListViewModel = CinemaListViewModel()
    }
    
    func initTable(){
        tableView.estimatedRowHeight = 180
        let nib = UINib(nibName: "CinemaTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CinemaTableViewCell.id)
    }
    
    func initBindingViews(){
        self.searchBar.rx.text.subscribe(onNext: { text in
            self.cinemaListViewModel?.searchText.onNext(text!)
        })
        
        self.cinemaListViewModel?.dataSource.asObservable().bind(to: tableView.rx.items(cellIdentifier: CinemaTableViewCell.id, cellType: CinemaTableViewCell.self)) {
            (index, movie, cell: CinemaTableViewCell) in
            cell.selectionStyle = .none
            cell.cinemaTableCellViewModel = CinemaTableCellViewModel(movie: movie)
        }
        
        self.tableView.rx.itemSelected.subscribe(onNext: {
            [weak self] indexPath in
            if let cell = self?.tableView.cellForRow(at: indexPath) as? CinemaTableViewCell {
                print("Select", cell.cinemaTitleLabel.text)
            }
        })
    }
}

