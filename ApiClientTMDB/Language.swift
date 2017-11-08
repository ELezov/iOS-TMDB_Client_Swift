import Foundation
import ObjectMapper

class Language : Mappable {
	var iso_639_1 : String?
	var name : String?

    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        iso_639_1 <- map["iso_639_1"]
        name <- map["name"]
    }

}
