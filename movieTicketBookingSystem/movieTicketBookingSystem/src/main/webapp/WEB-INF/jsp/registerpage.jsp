<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
        <style>
        form {
                font-size: 20px;
                position: relative;
                text-align: left;
                position: absolute;
                top: 40px;
                right: 100px;
              }
            * {
                 box-sizing: border-box;
              }


            .column {
              float: left;
              width: 50%;
              padding: 1px;
              /*height: 300px;  Should be removed. Only for demonstration */
            }


            .row:after {
              content: "";
              display: table;
              clear: both;
            }   
            .container {
                            font-size: 40px;
                            position: relative;
                            text-align: center;
                            color: white;
              }
              input {
  					opacity:0.6;
				}
              
        </style>
        <title>Mandal Theater | Register</title>
    </head>
    <body style="background-color:black;">
        <div class="container">
        <div class="row">
      <div class="column">
        <img src="${pageContext.request.contextPath}\register-background.jpg" class="img-fluid" alt="not available" alt="theater" style="object-fit: fill;">
        <div style="position: absolute; top: 80px; left: 50px;text-align: left;">
        <h2 style="font-size:80px;">Welcome,</h2>
        <h2>New User</h2>
        <p style="font-size:medium;">Please fill the details</p>
      </div>
      </div>
      <div class="column" style="background-color:black;">
        <form class="float-right" id="register" action="/user/register" method="post">
            <div class="form-group">
                <label for="customerName">Name</label>
                <input type="text" class="form-control" id="customerName"name="customerName" placeholder="First Last Name" required>
              </div>
              <div class="form-group">
                <label for="customerEmail ">Email</label>
                <input type="email" class="form-control" id="customerEmail" name="customerEmail" placeholder="ex@email.com" required>
              </div>
              <div class="form-group">
                <label for="customerPassword">Password</label>
                <input type="password" class="form-control" id="customerPassword" name="customerPassword" required>
              </div>
            <div class="form-group">
              <label for="customerAddress">Address</label>
              <input type="text" class="form-control" id="customerAddress" name ="customerAddress" placeholder="Localy,Road,Pin" required>
            </div>
            
            <div class="form-group">
                <span class="input-group-text" id="basic-addon1">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
                    <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z"></path>
                  </svg>
                </span>
                <input type="number" min="1" class="form-control" placeholder="Enter Your Phone Number" aria-label="Input group example" aria-describedby="basic-addon1" id="customerPhone" name="customerPhone" required>
            </div>
            <script>
            	function validatePhoneNumber(phoneNumber) {
            	  	return phoneNumber.toString().length === 10;
            	}
            	const form = document.querySelector('form');
            	form.addEventListener('submit', function(event) {
            	  const phoneNumberInput = document.getElementById('customerPhone');
            	  const phoneNumber = phoneNumberInput.value;

            	  if (!validatePhoneNumber(phoneNumber)) {
            	    event.preventDefault();
            	    phoneNumberInput.classList.add('is-invalid');
            	    phoneNumberInput.nextElementSibling.innerText = 'Phone number must be 10 digits long.';
            	  } else {
            	    phoneNumberInput.classList.remove('is-invalid');
            	    phoneNumberInput.nextElementSibling.innerText = '';
            	  }
            	});
            </script>
            <br>
            <p style="color:white; font-size:15px">${errorMsg}</p>
            <div class="form-group">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" id="gridCheck" required>
                <label class="form-check-label" for="gridCheck">
                  Accept <a class="button" data-toggle="modal" data-target="#staticBackdrop">Terms & Condition</a>
                </label>
              </div>
            </div>
            <div class="justify-content-center row">
            <button type="submit" class="btn btn-outline-primary" onclick="/user/register">Sign Up
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z"/>
                  </svg>
            </button>
            </div>
          </form>
          </div>
          <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="staticBackdropLabel" style="color:black;">Terms And Condition</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body" style="color:black; font-size: 15px; text-align: left;">
                  Please read the following terms and conditions carefully before providing your information:
                  <br>
                    1. Customer Name: [Customer Name]<br>
                      - By providing your name, you agree to accurately represent your identity.<br>

                    2. Customer Email: [Customer Email]<br>
                      - By providing your email address, you consent to receive communication from us regarding your account and our services.
                      <br>
                    3. Customer Password: [Customer Password]<br>
                      - By creating a password, you are responsible for maintaining the confidentiality of your account information and ensuring its security.
                      <br>
                    4. Customer Address: [Customer Address]
                      - By providing your address, you confirm that it is accurate and complete for the purpose of order delivery and communication.
                      <br>
                    5. Customer Phone: [Customer Phone]<br>
                      - By providing your phone number, you authorize us to contact you regarding your orders and account-related matters.
                      <br>
                    6. Data Privacy and Security:<br>
                      - We are committed to protecting your personal information and maintaining its confidentiality. We will not sell, distribute, or lease your information to third parties unless required by law.
                      <br>
                      - We employ industry-standard security measures to safeguard your data. However, please be aware that no method of transmission over the internet or electronic storage is 100% secure.
                      <br>
                      - You are responsible for keeping your account credentials safe and secure. Do not share your password or login information with others.
                      <br>
                      - For more information on how we collect, use, and store your data, please refer to our Privacy Policy.
                      <br>
                    By providing your information, you acknowledge that you have read, understood, and agreed to the above terms and conditions.
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  
                </div>
              </div>
            </div>
          </div>
          </div>
        </div>
    </body>