import Foundation
import RxSwift
import RxCocoa

class ViewModel{


    let disposeBag = DisposeBag()

    var searchText = PublishSubject<String?>()

    var movies = PublishSubject<[Movie]>()
}
