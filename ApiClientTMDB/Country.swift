import Foundation
import ObjectMapper

class Country : Mappable {
	var iso_3166_1 : String?
	var name : String?

    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        iso_3166_1 <- map["iso_3166_1"]
        name <- map["name"]
    }
}
