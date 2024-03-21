<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!--  <meta charset="utf-8">-->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
      
<title>Mandal Theater | AdminHome</title>
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
				<a class="dropdown-item" href="/movie/allmovies">Log In as User</a>
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
    <div class="container">
        <ul class="nav nav-tabs">
            <li class="nav-item">
            <a class="nav-link active" id="detail" onclick="adminDeatils()">Admin Detail</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" id="movieDetailsBtn" onclick="addMovieDetail()">Movie Details</a>
            </li>
            <li class="nav-item" >
            <a class="nav-link" id="theaterAddBtn" onclick="addTheaterDetail()">Theater Details</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" id="paymentBtn" onclick="paymentDetail()">Seat Details</a>
            </li>
        </ul>

		<h1>${theaterMessage}</h1>
        <!--Add new Movie Form-->
        
        <div name="movieDetailsEdit" id="movie" style="display: none;" id="movieDetailsEdit">
        <form  action="/movie/create" method="post">
            <div class="form-group">
            <label for="movieName">Movie Name:</label>
            <input type="text" class="form-control" id="movieName" name="movieName" placeholder="Enter Movie Name" required>
            </div>
            <div class="form-group">
                <label for="movieDescription">Movie Description:</label>
                <textarea type="text" class="form-control" id="movieDescription" name="movieDescription" placeholder="Enter Movie Description" rows="3" required></textarea>
            </div>
            <div class="form-group">
                <label for="movieLength">Movie Length:</label>
                <input type="number" class="form-control" id="movieLength" name="movieLength" placeholder="Enter Movie Length in Mintue" required>
            </div>
            <div class="form-group">
            <label for="genre">Select Genre</label>
            <select class="form-control" id="genre" name="genre" required>
                <option>seelect one</option>
                <option value="Action">Action</option>
                <option value="Comedy">Comedy</option>
                <option value="Horror">Horror</option>
                <option value="Romance">Romance</option>
                <option value="Drama">Drama</option>
                <option value="Sci-Fi">Sci-Fi</option>
                <option value="Thriller">Thriller</option>
            </select>
            </div>
            <div class="form-group">
                <label for="releaseDate">Release Date:</label>
                <input type="date" class="form-control" id="releaseDate" name="releaseDate" required>
            </div>
            <div class="form-group">
                <label for="movieDirector">Movie Director:</label>
                <input type="text" class="form-control" id="movieDirector" name="movieDirector" required>
            </div>
            <div class="form-group">
                <label for="trailerLink">Enter embeded trailer link:</label>
                <div class="container" style="display: flex; align-items: left; justify-content: center;">
                <input type="text" style="float: left;"class="form-control" id="trailerLink" name="trailerLink" placeholder="find the trailer on Youtube > Share > Embed Video > copy the link on the src tag only" required>
                <img src="${pageContext.request.contextPath}\trailerLink1.png" alt="trailer embeed link" width="256.5" height="69.5">
                </div>
                <input class="btn btn-primary" type="submit" value="Submit">
            </div>
        </form>
        <form id="movieDeleteform" action="/movie/deleteMovie" method="post">
              <label for="movieId" >Choose Movie Name(Delete Movie Before adding to theater)</label>
                <select class="form-control" id="movieId" name="movieId" required>
                  <option>seelect one</option>
                  <c:forEach var="movie" items="${optionListValue}">
                  <option value="${movie.movieId}">${movie.movieId} - ${movie.movieName}</option>
                </c:forEach>
              </select>
              <br>
              <button type="submit" id="delete-button">Delete</button>
            </form>
        </div>


        <!--Add Theater Detail Form-->
        <div name="theaterScreening" style="display: none;" id="theaterScreening">
          <form  name="theaterAddForm" action="/theater/create" method="post">
            <label for="movieIdForScreen" >Choose Your Movie</label>  
            <select class="form-control" id="movieIdForScreen" name="movieIdForScreen">
                <option>select movie</option>
                  <c:forEach var="movie" items="${optionListValue}">
                    <option value="${movie.movieId}">${movie.movieName}</option>
                  </c:forEach>
              </select>
              <div class="form-group">
                  <label for="totalSeats">Total Seats</label>
                  <input type="number" class="form-control" id="totalSeats" name="totalSeats" required>
              </div>
                <div class="form-group">
                  <label for="bookedSeats">Booked Seats</label>
                  <input type="number" class="form-control" id="bookedSeats" name="bookedSeats" required>
                </div>
                <div class="form-group">
                <label for="movieIdForScreen" >Choose Show Time</label>
                <select class="form-control" id="startTime" name="startTime" required>
                  <option>seelect one</option>
                  <option value="Morning">Morning</option>
                  <option value="Evening">Evening</option>
                  <option value="Night">Night</option>
              </select>
                </div>
              
                <div class="form-group">
                  <label for="movieDate">Screening Date</label>
                  <input type="date" class="form-control" id="movieDate" name="movieDate" required>
                </div>
                <div class="form-group">
                  <label for="ticketPrice">Single Seat Price</label>
                  <input type="number" class="form-control" id="ticketPrice" name="ticketPrice" required>
                </div>
                <div class="form-group">
                  <label for="screenNo">Screen No</label>
                  <input type="number" class="form-control" id="screenNo" name="screenNo" required>
                </div>
                <input class="btn btn-primary" type="submit" value="Submit">
            </form>
            <br>
            <form id="theaterDeleteform" action="/theater/delete" method="post">
              <label for="theaterId" >Choose Theater By date time and movieId (You have to delete theater before any seats get booked)</label>
                <select class="form-control" id="theaterId" name="theaterId" required>
                  <option>seelect one</option>
                  <c:forEach var="theater" items="${theaterListDelete}">
                  <option value="${theater.screenId}">${theater.movieDate} ${theater.startTime} ${theater.movieIdForScreen}</option>
                </c:forEach>
              </select>
              <br>
              <button type="submit" id="delete-button">Delete</button>
            </form>
            
          </div>

          <div name="seatDetails" style="display: none;" id="seatDetails">
            <table class="table">
              <thead class="thead-dark">
                <tr>
                  <th scope="col">Seat Id</th>
                  <th scope="col">Theater Id</th>
                  <th scope="col">Customer Id</th>
                  <th scope="col">Seats Booked</th>
                  <th scope="col">Total Paid</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="seat" items="${listValue}">
                  <tr>
                    <th scope="row">${seat.seatId}</th>
                    <td>${seat.screenIdBooked}</td>
                    <td>${seat.customerIdBooked}</td>
                    <td>${seat.seatsBooked}</td>
                    <td>${seat.totalPaid} Rs.</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
    </div>

 

    <!--JS Scripts-->
    <script type="text/javascript">
        
        function adminDeatils(){
            document.getElementById("movie").style.display="none";
            document.getElementById("theaterScreening").style.display="none";
            document.getElementById("seatDetails").style.display="none";

            document.getElementById("detail").classList.add("active");
            document.getElementById("movieDetailsBtn").classList.remove("active");
            document.getElementById("theaterAddBtn").classList.remove("active");
            document.getElementById("paymentBtn").classList.remove("active");
        }
        function addMovieDetail(){
            document.getElementById("movie").style.display="block";
            document.getElementById("theaterScreening").style.display="none";
            document.getElementById("seatDetails").style.display="none";

            document.getElementById("detail").classList.remove("active");
            document.getElementById("movieDetailsBtn").classList.add("active");
            document.getElementById("theaterAddBtn").classList.remove("active");
            document.getElementById("paymentBtn").classList.remove("active");
        }
        function addTheaterDetail(){
            document.getElementById("movie").style.display="none";
            document.getElementById("theaterScreening").style.display="block";
            document.getElementById("seatDetails").style.display="none";

            document.getElementById("detail").classList.remove("active");
            document.getElementById("movieDetailsBtn").classList.remove("active");
            document.getElementById("theaterAddBtn").classList.add("active");
            document.getElementById("paymentBtn").classList.remove("active");
        }
        function paymentDetail(){
            document.getElementById("movie").style.display="none";
            document.getElementById("theaterScreening").style.display="none";
            document.getElementById("seatDetails").style.display="block";

            document.getElementById("detail").classList.remove("active");
            document.getElementById("movieDetailsBtn").classList.remove("active");
            document.getElementById("theaterAddBtn").classList.remove("active");
            document.getElementById("paymentBtn").classList.add("active");
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	<script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
	<script type="text/javascript" src="Scripts/jquery-2.1.1.min.js"></script>
</body>
</html>