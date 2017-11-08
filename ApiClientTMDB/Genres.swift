import Foundation
import ObjectMapper

class Genres : Mappable {
	var id : Int?
	var name : String?

    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }

}
