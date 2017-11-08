class CinemaTableCellViewModel {
    var cinemaImgUrl: String?
    var cinemaTitle: String?
    var cinemaDescription: String?
    var releaseDate: String?
    
    required init(movie: Movie){
        self.cinemaImgUrl = movie.poster_path
        self.cinemaTitle = movie.title
        self.cinemaDescription = movie.overview
        self.releaseDate = movie.release_date
    }
}
