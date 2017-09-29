import Foundation
import ObjectMapper

class Movie: Mappable {
    public var vote_count : Int?
    public var id : Int?
    public var video : String?
    public var vote_average : Int?
    public var title : String?
    public var popularity : Double?
    public var poster_path : String?
    public var original_language : String?
    public var original_title : String?
    public var genre_ids : Array<Int>?
    public var backdrop_path : String?
    public var adult : String?
    public var overview : String?
    public var release_date : String?

    required init?(map: Map) {

    }

    public func mapping(map: Map) {
        vote_count <- map["vote_count"]
        id <- map["id"]
        video <- map["video"]
        vote_average <- map["vote_average"]
        title <- map["title"]
        popularity <- map["popularity"]
        poster_path <- map["poster_path"]
        original_language <- map["original_language"]
        original_title <- map["original_titile"]
        genre_ids <- map["ganre_ids"]
        backdrop_path <- map["backdrop_path"]
        adult <- map["adult"]
        overview <- map["overview"]
        release_date <- map["release_date"]
    }


}
