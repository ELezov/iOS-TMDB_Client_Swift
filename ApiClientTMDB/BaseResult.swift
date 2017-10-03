import Foundation
import ObjectMapper

class BaseResult: Mappable {
    public var page : Int?
    public var total_results : Int?
    public var total_pages : Int?
    public var movies: Array<Movie>?

    required init?(map: Map) {

    }

    public func mapping(map: Map) {
        page <- map["page"]
        total_results <- map["total_results"]
        total_pages <- map["total_pages"]
        movies <- map["results"]
    }
}
