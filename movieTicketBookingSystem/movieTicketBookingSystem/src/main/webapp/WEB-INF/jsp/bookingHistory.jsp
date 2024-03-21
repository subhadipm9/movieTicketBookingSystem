<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mandal Theater | Booking History</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="Scripts/jquery-2.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
<style>
.cardWrap {
  width: 27em;
  margin: 1em auto;
  color: #fff;
  font-family: sans-serif;
}

.card {
  background: linear-gradient(to bottom, #e84c3d 0%, #bc544b 26%, #ecedef 26%, #ecedef 100%);
  height: 15em;
  float: left;
  position: relative;
  padding: 1em;
  margin-top: 100px;
}

.cardLeft {
  border-top-left-radius: 8px;
  border-bottom-left-radius: 8px;
  width: 16em;
}

.cardRight {
  width: 6.5em;
  border-left: 0.18em dashed #fff;
  border-top-right-radius: 8px;
  border-bottom-right-radius: 8px;
}
.cardRight:before, .cardRight:after {
  content: "";
  position: absolute;
  display: block;
  width: 0.9em;
  height: 0.9em;
  background: #fff;
  border-radius: 50%;
  left: -0.5em;
}
.cardRight:before {
  top: -0.4em;
}
.cardRight:after {
  bottom: -0.4em;
}

h1 {
  font-size: 1.1em;
  margin-top: 0;
}
h1 span {
  font-weight: normal;
}

.title, .name, .seat, .time ,.seatNumber{
  text-transform: uppercase;
  font-weight: normal;
}
.title h2, .name h2, .seat h2, .time h2 ,.seatNumber h2{
  font-size: 0.9em;
  color: #525252;
  margin: 0;
}
.title span, .name span, .seat span, .time span ,.seatNumber span{
  font-size: 0.7em;
  color: #a2aeae;
}

.title {
  margin: 1em 0 0 0;
}

.name, .seat ,.seatNumber{
  margin: 0.4em 0 0 0;
}

.time {
  margin: 0.5em 0 0 1em;
}

.seat, .time , .seatNumber{
  float: left;
}

.eye {
  position: relative;
  width: 2em;
  height: 1.5em;
  background: #fff;
  margin: 0 auto;
  border-radius: 1em/0.6em;
  z-index: 1;
}
.eye:before, .eye:after {
  content: "";
  display: block;
  position: absolute;
  border-radius: 50%;
}
.eye:before {
  width: 1em;
  height: 1em;
  background: #e84c3d;
  z-index: 2;
  left: 8px;
  top: 4px;
}
.eye:after {
  width: 0.5em;
  height: 0.5em;
  background: #fff;
  z-index: 3;
  left: 12px;
  top: 8px;
}

.number {
  text-align: center;
  text-transform: uppercase;
}
.number h3 {
  color: #e84c3d;
  margin: 0.9em 0 0 0;
  font-size: 2.5em;
}
.number span {
  display: block;
  color: #a2aeae;
}

</style>
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
			  <h1>${notFound}</h1>
        <button id="cancelTicket" class="btn btn-primary float-right" data-toggle="modal" data-target="#exampleModalCancel" data-whatever="@mdo">Cancel Ticket</button>
        <div class="modal fade" id="exampleModalCancel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel" style="color: black;">Select Seat Details</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form method="post" action="/seat/cancelSeat">
                <div class="form-group">
                  <select class="form-control" id="seatId" name="seatId" required>
                      <option>select seat</option>
                      <c:forEach var="bookingHistory" items="${CancelationListValue}">
                          <option value="${bookingHistory.seatId}">${bookingHistory.seatId} - ${bookingHistory.movieName} ${bookingHistory.startDate} ${bookingHistory.startTime}</option>
                      </c:forEach>
                  </select>
              </div>
              <button type="submit" class="btn btn-primary" >Cancel</button>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              
            </div>
            </div>
            </div>
            </div>
			 <div class="container row">
                <c:forEach var="bookingHistory" items="${listValue}">
                <div class="col-sm-6">
                    <div class="cardWrap">
                        <div class="card cardLeft">
                        <h1>Mandal <span>Theater</span></h1>
                        <div class="title">
                            <h2>${bookingHistory.movieName}</h2>
                            <span>movie</span>
                        </div>
                        <div class="name">
                            <h2>${bookingHistory.directorName }</h2>
                            <span>director name</span>
                        </div>
                        <div class="row">
                            <div class="col-sm">
                                <div class="seat">
                                    <h2>${bookingHistory.noOfSeats}</h2>
                                    <span>seats</span>
                                </div>
                                <div class="row seatNumber" style="color:black; padding-botton:1px;">
                                    <h2>${bookingHistory.bookedSeats}</h2>
                                    <span>Seat No</span>
                                </div>
                            </div>
                            <div class="col-sm">
                                <div class="time">
                                    <h2>${bookingHistory.startDate} ${bookingHistory.startTime}</h2>
                                    <span>time</span>
                                </div>
                            </div>
                        </div>
                        
                        	
                        
                        </div>
                        
                        </div>
                        <div class="card cardRight">
                        <div class="eye"></div>
                        <div class="number">
                            <h3>S${bookingHistory.seatId}</h3>
                            <span>seat id</span>
                        </div>
                        <div class="row seatNumber" style="color:black; padding-botton:1px;">
                        	${bookingHistory.bookedSeats}
                        </div>
                        </div>
                        </div>
                    <br>
                </c:forEach>
            </div>


			 
</body>
</html>