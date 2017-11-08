import Foundation
import ObjectMapper

class BaseDetail : Mappable {
	var adult : String?
	var backdrop_path : String?
	var belongs_to_collection : Collection?
	var budget : Int?
	var genres : [Genres]?
	var homepage : String?
	var id : Int?
	var imdb_id : String?
	var original_language : String?
	var original_title : String?
	var overview : String?
	var popularity : Double?
	var poster_path : String?
	var production_companies : [Company]?
	var production_countries : [Country]?
	var release_date : String?
	var revenue : Int?
	var runtime : Int?
	var spoken_languages : [Language]?
	var status : String?
	var tagline : String?
	var title : String?
	var video : String?
	var vote_average : Double?
	var vote_count : Int?
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        adult <- map["adult"]
        backdrop_path <- map["backdrop_path"]
        belongs_to_collection <- map["belongs_to_collection"]
        budget <- map["budget"]
        genres <- map["genres"]
        homepage <- map["homepage"]
        id <- map["id"]
        imdb_id <- map["imdb_id"]
        original_language <- map["original_language"]
        original_title <- map["original_title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        poster_path <- map["poster_path"]
        production_companies <- map["production_companies"]
        production_countries <- map["production_countries"]
        release_date <- map["release_date"]
        revenue <- map["revenue"]
        runtime <- map["runtime"]
        spoken_languages <- map["spoken_languages"]
        status <- map["status"]
        tagline <- map["tagline"]
        title <- map["title"]
        video <- map["video"]
        vote_average <- map["vote_average"]
        vote_count <- map["vote_count"]
    }

}
