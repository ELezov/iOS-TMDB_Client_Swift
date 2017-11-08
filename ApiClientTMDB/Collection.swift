import Foundation
import ObjectMapper

class Collection : Mappable {
	var id : Int?
	var name : String?
	var poster_path : String?
	var backdrop_path : String?

    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        poster_path <- map["poster_path"]
        backdrop_path <- map["backdrop_path"]
    }

}
