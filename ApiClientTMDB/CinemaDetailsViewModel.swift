import ObjectMapper
import RxSwift
import RxCocoa

class CinemaDetailsViewModel {
    
    let cinemaTitle = BehaviorSubject<String>(value: "")
    let cinemaOverview = BehaviorSubject<String>(value: "")
    var id: String?
    
    required init(id: Int){
        //self.cinemaTitle = movie.title
        //self.cinemaOverview = movie.overview
        
        Network.shared.request(endpoint: CinemaService.getDetailInfo(id: String(describing: id))) { response in
                response.result.ifSuccess {
                    let result = Mapper<BaseDetail>().map(JSONObject: response.result.value)
                    if let title = result?.title {
                        DispatchQueue.main.async {
                            self.cinemaTitle.onNext(title)
                        }
                    }
                    if let overview = result?.overview {
                        DispatchQueue.main.async {
                            self.cinemaOverview.onNext(overview)
                        }
                    }
                    //self.cinemaTitle = result?.title
                    //self.cinemaOverview = result?.overview
                    //if let movies = result?.movies {
                      //  self.dataSource.value = movies
                    //}
                }
        }
    }
    
}
