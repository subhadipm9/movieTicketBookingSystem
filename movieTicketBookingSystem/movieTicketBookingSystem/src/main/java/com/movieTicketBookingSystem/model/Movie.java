package com.movieTicketBookingSystem.model;


import java.sql.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="MOVIE_DETAILS")
public class Movie {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY )
	private int  movieId;
	
    private String movieName;
    private String movieDescription;
    private int movieLength;
    private String genre;
    private Date releaseDate; //FORMAT-(YYYY-MM-DD)
    private String movieDirector;
    private String trailerLink;
    
    public Movie() {}
    
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getMovieDescription() {
		return movieDescription;
	}
	public void setMovieDescription(String movieDescription) {
		this.movieDescription = movieDescription;
	}
	public int getMovieLength() {
		return movieLength;
	}
	public void setMovieLength(int movieLength) {
		this.movieLength = movieLength;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getMovieDirector() {
		return movieDirector;
	}
	public void setMovieDirector(String movieDirector) {
		this.movieDirector = movieDirector;
	}
	
	@Override
	public String toString() {
		return "Movie [movieId=" + movieId + ", movieName=" + movieName + ", movieDescription=" + movieDescription
				+ ", movieLength=" + movieLength + ", genre=" + genre + ", releaseDate=" + releaseDate
				+ ", movieDirector=" + movieDirector + "]";
	}
	public Movie(int movieId, String movieName, String movieDescription, int movieLength, String genre,
			Date releaseDate, String movieDirector,String trailerLink) {
		super();
		this.movieId = movieId;
		this.movieName = movieName;
		this.movieDescription = movieDescription;
		this.movieLength = movieLength;
		this.genre = genre;
		this.releaseDate = releaseDate;
		this.movieDirector = movieDirector;
		this.trailerLink = trailerLink;
	}

	public String getTrailerLink() {
		return trailerLink;
	}

	public void setTrailerLink(String trailerLink) {
		this.trailerLink = trailerLink;
	}
	
    
    
	
}
