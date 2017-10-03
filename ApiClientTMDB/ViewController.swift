//
//  ViewController.swift
//  ApiClientTMDB
//
//  Created by KODE_H6 on 29.09.17.
//  Copyright © 2017 KODE. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var shownMovis = [String]()
    var movies = ["Иван Васильевич", "Грозный", "Всегда говори Да!"]
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    func  setup() {
        tableView.dataSource = self
        searchBar
            .rx.text.orEmpty
            .debounce(1, scheduler: MainScheduler.instance) // Wait 0.5 for changes.
            .distinctUntilChanged() // If they didn't occur, check if the new value is the same as old.
            .filter { !$0.isEmpty } // If the new value is really new, filter for non-empty query.
            .subscribe(onNext: { [unowned self] query in
                let parameters: Parameters = ["api_key": API_KEY,
                                              "page": 1,
                                              "query": query,
                                              "language": "ru"]
                Alamofire.request(BASE_URL, parameters: parameters).validate().responseObject{
                    (response: DataResponse<BaseResult>) in
                    print("URL",response.response)
                    switch response.result{
                    case .success(let value):
                        let resultObject = response.result.value
                        let resultMovies = resultObject?.movies
                        print("Size Movies", resultMovies?.count)
                        var resultStringArray = [String]()
                        for movie in resultMovies!{
                            print(movie.title, movie.vote_average, movie.release_date)
                            resultStringArray.append(movie.title!)
                        }
                        self.shownMovis = resultStringArray//self.movies.filter { $0.hasPrefix(query) } // We now do our "API Request" to find cities.
                        self.tableView.reloadData()
                    case .failure(let error):
                        print(error)
                        
                    }
                    
                    
                }
                // Here we subscribe to every new value, that is not empty (thanks to filter above).
                 // And reload table view data.
            })
            .addDisposableTo(disposeBag) // Don't forget to add this to disposeBag. We want to dispose it on deinit.

    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownMovis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityPrototypeCell", for: indexPath)
        cell.textLabel?.text = shownMovis[indexPath.row]
        
        return cell
    }
}

