import Foundation
import ObjectMapper

class Company : Mappable {
	var name : String?
	var id : Int?

    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
    }

}
