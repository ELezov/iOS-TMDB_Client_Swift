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
    
    var cinemaListViewModel: ViewModel?
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        initTable()
        initBindingViews()
        
        
    }
    
    func initViewModel(){
        self.cinemaListViewModel = ViewModel()
    }
    
    func initTable(){
        tableView.estimatedRowHeight = 180
        let nib = UINib(nibName: "CinemaTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CinemaTableViewCell.id)
    }
    
    func initBindingViews(){
        self.searchBar.rx.text.subscribe (onNext: { text in
            self.cinemaListViewModel?.searchText.onNext(text!)
        })
        
        self.cinemaListViewModel?.dataSource.asObservable().bind(to: tableView.rx.items(cellIdentifier: CinemaTableViewCell.id, cellType: CinemaTableViewCell.self)) {
            (index, movie, cell: CinemaTableViewCell) in
            cell.cinemaTitleLabel.text = movie.title
            cell.descriptionLabel.text = movie.overview
            if let path = movie.poster_path {
                let urlString = BASE_IMG_URL + W_185 + path
                //cell.posterImage.kf.setImage(with: URL(string: urlString))
                cell.posterImage.kf.setImage(with: URL(string: urlString), placeholder: UIImage(named: "placeholder"), options: [], progressBlock: nil, completionHandler: nil)
            }
        }
    }
}

