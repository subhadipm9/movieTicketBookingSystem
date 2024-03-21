<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mandal Theater | Booking</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery-2.1.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    <style>
      body {
        background-image: linear-gradient(black, rgb(87, 11, 11));
        color: #fff;
        background-attachment: fixed;
}

.navbar {
  background-color: red;
}

.navbar-brand {
  color: #fff;
}

.btn-primary {
  background-color: red;
  border-color: red;
  color: #fff;
}

.btn-outline-dark {
  color: red;
  border-color: red;
}

.accordion .card {
  background-color: #fff;
  color: #333;
  border: none;
}

.accordion .card-header {
  background-color: #fff;
  border-bottom: 1px solid #ccc;
}

.accordion .card-header button {
  color: #333;
}

.accordion .card-body {
  background-color: #f5f5f5;
  border-top: 1px solid #ccc;
}

.modal-header {
  background-color: red;
}

.modal-title {
  color: #fff;
}

.modal-content {
  background-color: #fff;
  color: #333;
}

.modal-footer {
  background-color: red;
}

.btn-secondary {
  color: #fff;
  background-color: red;
  border-color: red;
}

.form-control {
  background-color: #fff;
  color: #333;
}

.form-control:focus {
  border-color: red;
  box-shadow: 0 0 0 0.2rem rgba(255, 0, 0, 0.25);
}

.form-group label {
  color: #333;
}

.form-group input[type=number] {
  border: 1px solid red;
}

.form-group input[type=number]:focus {
  border: 1px solid red;
  box-shadow: 0 0 0 0.2rem rgba(255, 0, 0, 0.25);
}

.modal-body label {
  color: #333;
}

.modal-body input[type=number] {
  border: 1px solid red;
}

.modal-body input[type=number]:focus {
  border: 1px solid red;
  box-shadow: 0 0 0 0.2rem rgba(255, 0, 0, 0.25);
}

.modal-footer button {
  color: #fff;
  background-color: red;
  border-color: red;
}

.modal-footer button:focus {
  box-shadow: 0 0 0 0.2rem rgba(255, 0, 0, 0.25);
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
        <div class="container">
            ${theaterError}
            <c:forEach var="theater" items="${listValue}">
                <div class="accordion" id="accordionExample">
                    <div class="card">
                    <div class="card-header" id="headingOne">
                        <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse_${theater.screenId}" aria-expanded="false" aria-controls="collapse_${theater.screenId}">
                           <span style="font-size: 25px; padding-bottom: 6px; color: #333333;"> ${theater.movieDate}</span>  <span style="margin-left: 12px; font-size: 16px;">Time- ${theater.startTime}</span>
                        </button>
                        </h2>
                    </div>
                
                    <div id="collapse_${theater.screenId}" class="collapse hide" aria-labelledby="headingOne" data-parent="#accordionExample">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm">
                                        Movie Name : ${movieName}
                                        <br>
                                        Total Seats : ${theater.totalSeats}
                                        <br>
                                        Booked Seats : ${theater.bookedSeats}
                                        <br>
                                        Screen Number : ${theater.screenNo}
                                        <br>
                                        Ticket Price : ${theater.ticketPrice}
                                    </div>
                                    <div class="col-sm">
                                    <form method="post" action="/seat/book">
                                    	<div class="form-group">
				                     
				                            <input type="number" id="customerIdBooked" name="customerIdBooked" placeholder="${sessionScope.customerId}" value ="${sessionScope.customerId}" style="display:none;">
				                        
				                    
				                            <input type="number" id="screenIdBooked" name="screenIdBooked" placeholder="${theater.screenId}" value ="${theater.screenId}" style="display:none;">
				                            
				                            <br>
				                            <label class="col-form-label" for="seatNumbers">Select No of Seats : </label>
				                            <input type="number" id="seatNumbers_${theater.screenId }" name="seatsBooked" min="1" oninput="validateSeatInput(this, 1, ${theater.screenId})" required>
				                            
				                            <input type="number" id="ticketPrice_${theater.screenId }" name="ticketPrice" value="${theater.ticketPrice }" style="display:none;">
				                            <input type="number" id="totalSeats_${theater.screenId }" name="totalSeats" value="${theater.totalSeats}" style="display:none;">
											<input type="number" id="bookedSeats_${theater.screenId }" name="bookedSeats" value="${theater.bookedSeats}" style="display:none;">
				                            <br>
				                            <label class="col-form-label" for="totalPaid_${theater.screenId }" >Total Payment : </label>
				                            <input type="number" id="totalPaid_${theater.screenId }" name="totalPaid" readonly>
				                            <br>
				                            </div>
                                        <button type="submit" id ="bookNow" class="btn btn-outline-dark float-right" >Book Now</button>
                                    	<script>
                                    	
                                    	function validateSeatInput(input, min, screenId) {
                                    		  var value = parseInt(input.value);
                                    		  var availableSeats = parseInt(document.getElementById("totalSeats_"+screenId).value) - parseInt(document.getElementById("bookedSeats_"+screenId).value);
                                    		  var seatNumbers = parseInt(document.getElementById("seatNumbers_"+screenId).value);
                                    		  if (value < min) {
                                    		    input.value = min;
                                    		  } else if (value > availableSeats) {
                                    		    input.value = availableSeats;
                                    		  }


                                    		  if (seatNumbers > availableSeats) {
                                    		    document.getElementById("bookNow").disabled = true;
                                    		  } else {
                                    		    document.getElementById("bookNow").disabled = false;
                                    		  }

                                    		  calculateTotal(screenId);
                                    		}
                                    	
                                    	function calculateTotal(screenId) {
                                    	    var seatNumbers = parseInt(document.getElementById("seatNumbers_"+screenId).value);
                                    	    var ticketPrice = parseFloat(document.getElementById("ticketPrice_"+screenId).value);
                                    	    var totalPaid = seatNumbers * ticketPrice;
                                    	    document.getElementById("totalPaid_"+screenId).value = totalPaid;
                                    	}
										</script>
                                    </form>
                                </div>
                        </div>
                    </div>
                    </div>
                    <br>
                </div>
                </div>
                <br>
            </c:forEach>    
            </div>
        <script>
		
            $('#exampleModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget)
                var recipient = button.data('whatever')
                var modal = $(this)
                modal.find('.modal-title').text('New message to ' + recipient)
                modal.find('.modal-body input').val(recipient)
                })
                
    
            function paymentDetail(){
                document.getElementById("paymentDetailForm").style.display="block";
            }
            
            
            function bookDetail(theaterSeatAvl){
                if(theaterSeatAvl > 0){
                    let text = "Available Seats : "+ theaterSeatAvl;
                }
                else{
                    let text = "No available tickets.";
                    //document.getElementById("seatStatus").innerHTML = text;
                }
            }
        </script>
</body>
</html>