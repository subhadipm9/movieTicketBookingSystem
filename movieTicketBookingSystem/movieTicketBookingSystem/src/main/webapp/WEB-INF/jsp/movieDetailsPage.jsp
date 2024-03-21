<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
 
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<style>
	* {
  box-sizing: border-box;
}
/* for Search bar */
.search{
       position: relative;
       box-shadow: 0 0 40px rgba(51, 51, 51, .1);
         
       }

       .search input{

        height: 60px;
        text-indent: 25px;
        border: 2px solid #d6d4d4;


       }


       .search input:focus{

        box-shadow: none;
        border: 2px solid blue;


       }

       .search .fa-search{

        position: absolute;
        top: 20px;
        left: 16px;

       }

       .search button{

        position: absolute;
        top: 5px;
        right: 5px;
        height: 50px;
        width: 110px;
        background: rgb(137, 1, 1);
		
       }

body {

        background-image: linear-gradient(black, rgb(87, 11, 11));
        color: #fff;
        background-attachment: fixed;
}

.moviecard {
  font-family: "Helvetica", sans-serif, "Ariel";
  position: relative;
  background: #ffffff;
  color: #555555;
  margin: 50px auto;
  width: 850px;
  max-width: 900px;
  min-height: 300px;
  padding: 30px 290px 30px 30px;
  -moz-box-shadow: -5px 5px 15px;
  -webkit-box-shadow: -5px 5px 15px;
  box-shadow: -5px 5px 15px;
  border-radius: 5px;
}
.moviecard #movie-content {
  opacity: 1;
  width: 100%;
  display: table;
  transition: all 500ms ease-out;
  position: relative;
}
.moviecard .movie-title {
  font-size: 36px;
  padding-bottom: 6px;
  color: #333333;
}
.moviecard .movie-title .movie-year {
  margin-left: 12px;
  font-size: 16px;
}
.moviecard .movie-title a {
  color: #333333;
  text-decoration: none;
}
.moviecard .movie-title a:hover {
  color: #858585;
}
.moviecard .movie-details {
  font-size: 12px;
  padding-bottom: 24px;
  margin-bottom: 12px;
  border-bottom: 1px solid #dbdbdb;
}
.moviecard .movie-details span {
  padding: 0px 6px;
  border-right: 1px solid #dbdbdb;
}
.moviecard .movie-details span:last-child {
  border: none;
}
.moviecard .movie-castcrew {
  padding-top: 12px;
  width: 100%;
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
}
.moviecard .movie-castcrew span.title {
  color: #333333;
  display: inline-block;
  width: 80px;
  font-weight: 600;
}
.moviecard .movie-synopsis {
  margin: 24px 0px;
  padding-top: 24px;
  border-top: 1px solid #dbdbdb;
  max-height: 130px;
  height: 130px;
  overflow-y: scroll;
  width: 100%;
}
.moviecard .movie-ratings {
  position: absolute;
  right: 0px;
}
.moviecard .movie-ratings span.star {
  display: inline-block;
  margin-right: 12px;
  color: #F0DE00;
  font-size: 24px;
}
.moviecard .movie-ratings span.score {
  font-size: 30px;
  color: #333333;
}
.moviecard .movie-trailer-btn {
  text-transform: uppercase;
  outline: none;
  padding: 15px 50px;
  position: relative;
  background: none;
  border: none;
  cursor: pointer;
  font-size: 16px;
  font-weight: 600;
}
.moviecard .movie-trailer-btn:hover {
  text-decoration: underline;
}
.moviecard .movie-trailer-btn:hover:before {
  color: #333333;
}
.moviecard .movie-trailer-btn:hover:after {
  border-color: #333333;
}
.moviecard .movie-trailer-btn:before {
  font-size: 30px;
  color: #333333;
  position: absolute;
  top: 2px;
  left: 18px;
  width: 22px;
}
.moviecard .movie-trailer-btn:after {
  width: 20px;
  height: 20px;
  border: 1px solid #333333;
  border-radius: 50%;
  position: absolute;
  left: 18px;
  top: 12px;
}
.moviecard .movie-trailer {
  width: 0px;
  opacity: 0;
  overflow: hidden;
  position: absolute;
  right: 0px;
  height: 100%;
  transition: all 500ms;
  top: 0px;
  background: #ffffff;
  z-index: 1;
  padding: 60px 40px 60px 60px;
  border-radius: 5px;
}
.moviecard .movie-trailer a.back-btn {
  color: #333333;
  text-decoration: none;
  font-weight: 600;
  padding: 6px 12px 6px 18px;
  position: absolute;
  top: 12px;
  left: 300px;
  text-transform: uppercase;
  font-size: 12px;
  cursor: pointer;
}
.moviecard .movie-trailer a.back-btn:before {
  position: absolute;
  left: 5px;
  top: -2px;
  transform: rotate(-45deg);
  font-size: 20px;
  width: 26px;
  height: 26px;
}
.moviecard .movie-trailer a.back-btn:hover {
  color: #333;
}
.moviecard .movie-trailer iframe {
  width: 100%;
  height: 100%;
}
.moviecard .movie-poster {
  position: absolute;
  background: url("https://images.unsplash.com/photo-1575466548534-f630ec656227?q=80&w=1937&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
  background-color: #dbdbdb;
  background-size: 360px 540px;
  background-repeat: no-repeat;
  height: 0;
  width: 360px;
  height: 500px;
  right: -100px;
  top: -20px;
  -moz-box-shadow: -2px 2px 7px rgba(0, 0, 0, 0.6);
  -webkit-box-shadow: -2px 2px 7px rgba(0, 0, 0, 0.6);
  box-shadow: -2px 2px 7px rgba(0, 0, 0, 0.6);
  cursor: pointer;
  transition: all 500ms ease-out;
  z-index: 10;
}
.moviecard .movie-poster:before {
  content: "Watch Trailer";
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 100px;
  color: rgba(255, 255, 255, 0.4);
}
.moviecard .movie-poster:hover:before {
  color: rgba(255, 255, 255, 0.8);
}
.moviecard.movie-view-trailer .movie-poster {
  right: 600px;
}
.moviecard.movie-view-trailer #movie-content {
  opacity: 0;
  width: 0px;
}
.moviecard.movie-view-trailer .movie-trailer {
  width: 100%;
  opacity: 1;
  padding-left: 300px;
}
.moviecard.movie-view-trailer .movie-trailer #youvideo {
  height: 100%;
}
#filterBtn{
        
        height: 50px;
        width: 110px;
        background: rgb(86, 86, 86);
}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="Scripts/jquery-2.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>

<title>Mandal Theater | Movies</title>
</head>
<body>
	<nav class="navbar rounded" style="background-color: black; ">
		<h1 class="navbar-brand" style="font-size: large; color:white" ><a href="/user/logout" style="font-size: large; color:white">Mandal Theater</a></h1>
		<div class="form-inline">
		<div class="btn-group  dropleft">
			<button type="button" class="btn btn-light dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-expanded="false" id="userName" value="userName">
				${sessionScope.userName}
			</button>
			<div class="dropdown-menu">
			<p class="dropdown-item" id="customerId" name="customerId">Customer Id: ${sessionScope.customerId}</p>
				<a class="dropdown-item" href="/seat/bookingHistory">Booking History</a>
				<a class="dropdown-item" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Change Password</a>
				
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="/user/logout">Log Out</a>
			  </div>
		</div>
		</div>
		</nav>
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
			  <div class="modal-content">
				<div class="modal-header">
				  <h5 class="modal-title" id="exampleModalLabel">Change Password</h5>
				  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				  </button>
				</div>
				<form action="/user/changePassword" method="post">
				<div class="modal-body">
					<div class="form-group row">
						<label for="oldPassword" class="col-sm-2 col-form-label">Old Password</label>
						<div class="col-sm-10">
						  <input type="password" class="form-control" id="oldPassword" name="oldPassword">
						</div>
					</div>
					<div class="form-group row">
						<label for="newPassword" class="col-sm-2 col-form-label">New Password</label>
						<div class="col-sm-10">
						  <input type="password" class="form-control" id="newPassword" name="newPassword">
						</div>
					</div>
				</div>
				<div class="modal-footer">
				  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				  <button type="submit" class="btn btn-primary">Save changes</button>
				</div>
				</form>
			  </div>
			</div>
		  </div>
		<br>
		<div class="container">

			<div class="row height d-flex justify-content-center align-items-center">

			  <div class="col-md-8">
				<form id="movieName" action="/movie/searchMovie" method="post">
            	<div class="form-group">
				<div class="search">
				  <i class="fa fa-search"></i>
				  <input type="text" class="form-control" placeholder="Search Movies" id="name" name="name" style="opacity: 0.5;">
				  <button class="btn btn-primary" type="submit" onclick="/movie/searchMovie">Search</button>
				</div>
				
			  </div>
			  </form>
      </div>
      <div class="col-sm-1">
        <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" id="filterBtn">
          Filter
        </button>
      
      
			  
			</div>
		</div>
		<div class="collapse " id="collapseExample">
        <div class="card card-body justify-content-center" style="padding: 2px 5px 5px 2px; width: 110px;">
          <form action="/movie/getMovie/filter" method="post">
          
          <div class="form-check form-check-inline">
          <input class="form-check-input" type="radio" name="genre" id="genre_action" value="Action">
          <label class="form-check-label" for="genre_action">
            Action
          </label>
        </div>
            <div class="form-check- form-check-inline">
                <input class="form-check-input" type="radio" name="genre" id="genre_comedy" value="Comedy">
                <label class="form-check-label" for="genre_comedy">
                    Comedy
                </label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="genre" id="genre_horror" value="Horror">
                <label class="form-check-label" for="genre_horror">
                    Horror
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="genre" id="genre_romance" value="Romance">
                <label class="form-check-label" for="genre_romance">
                    Romance
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="genre" id="genre_drama" value="Drama">
                <label class="form-check-label" for="genre_drama">
                    Drama
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="genre" id="genre_sci-fi" value="Sci-Fi">
                <label class="form-check-label" for="genre_sci-fi">
                    Sci-Fi
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="genre" id="genre_thriller" value="Thriller">
                <label class="form-check-label" for="genre_thriller">
                    Thriller
                </label>
            </div>
            <button type="submit" class="btn btn-dark">Filter</button>
			  
			    </form>
        </div>
      </div>
		<c:forEach var="movie" items="${listValue}" varStatus="loop">
			<div class="moviecard">
				<div class="movie-poster play-trailer"></div>
				<div id="movie-content" >
				
				<div class="movie-title">${movie.movieName}<span class="movie-year">${movie.releaseDate}</span></div>
				<div class="movie-details"><span class="movie-duration">${movie.movieLength} Mins</span><span class="movie-genre">${movie.genre}</span></div>
				<div class="movie-castcrew"><span class="title">Director</span><span class="name">${movie.movieDirector}</span></div>
				<div class="movie-synopsis">${movie.movieDescription}</div>
				<form method="post" action="/theater/theaterDetail">
					<input type="number" value="${movie.movieId}" id="movieId" name="movieId" style="display:none;">
					<input type="text" value="${movie.movieName}" id="movieName" name="movieName" style="display:none;">
					<button type ="submit" class="movie-trailer-btn" type="button" onclick="/theater/theaterDetail">Book Now</button>
				</form>
				</div>
				<div class="movie-trailer"><a class="back-btn"> < back</a>
				<div id="youvideo">
					<iframe src="${movie.trailerLink}" frameborder="0" allowfullscreen="allowfullscreen" allowScriptAccess="always"></iframe>
				</div>
				</div>
			</div>
			<br>
		</c:forEach>
		</div>
	  <script>
				$(document).ready(function(){
			$(".play-trailer").click(function(){
				toggleVideo('show');
				$(".moviecard").addClass("movie-view-trailer");
			});

			$(".back-btn").click(function(){
				$(".moviecard").removeClass("movie-view-trailer");
				toggleVideo('hide');
			});	
			});

			function toggleVideo(state) {
				// if state == 'hide', hide. Else: show video
				var div = document.getElementById("youvideo");
				var iframe = div.getElementsByTagName("iframe")[0].contentWindow;
				div.style.display = state == 'hide' ? 'none' : '';
				func = state == 'hide' ? 'pauseVideo' : 'playVideo';
				iframe.postMessage('{"event":"command","func":"' + func + '","args":""}', '*');
			}
	  </script>
</body>
</html>