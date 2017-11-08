import RxSwift
import RxCocoa
import ObjectMapper

class CinemaListViewModel{


    let disposeBag = DisposeBag()

    var searchText = BehaviorSubject<String>(value: "")

    var movies = [Movie]()
    var dataSource = Variable([Movie]())
    
    init(){
        let jsonRequest = searchText.map { text in
            return Network.shared.request(endpoint: CinemaService.getCinemaList(query: text)){ response in
                response.result.ifSuccess {
                    let result = Mapper<BaseResult>().map(JSONObject: response.result.value)
                    if let movies = result?.movies {
                        self.dataSource.value = movies
                    }
                }
            }
            }.subscribe()
            .addDisposableTo(disposeBag)
    }
}
