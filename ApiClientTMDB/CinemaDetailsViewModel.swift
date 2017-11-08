import Foundation

class CinemaDetailsViewModel {
    
    var cinemaTitle: String?
    var cinemaOverview: String?
    
    required init(movie: Movie){
        self.cinemaTitle = movie.title
        self.cinemaOverview = movie.overview
    }
    
}
