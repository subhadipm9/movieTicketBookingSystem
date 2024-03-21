<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <title>Mandal Theater | Home</title>
        <style>
           .container {
                font-size: 40px;
                position: relative; 
                text-align: center;
                color: white;
            }

        /* Bottom right text */
        .text-block {
            
            position: absolute;
            top: 8px;
            left: 25px;
        }
        .card{
            position: absolute;
            top: 10px;
            right: 28px;
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 2px;
            transition: grid-template-columns .3s;
            object-fit:fill;
            background-color: transparent;
            
        }
        .card:has(.left:hover){
            grid-template-columns: 2fr .5fr .5fr;
        }
        .card:has(.center:hover){
            grid-template-columns: .5fr 2fr .5fr;
        }
        .card:has(.right:hover){
            grid-template-columns: .5fr .5fr 2fr;
        }
        .card-img-top {
            height: 100%;
            /* width: 15vw;  */
            object-fit: cover;
        }
        .rounded{
        	border-radiur:50px;
        }
        </style>
</head>
<body style="background-image: linear-gradient(rgb(177, 166, 166),rgb(187, 26, 26));">

        <div class="container">
        <div class="row">
                <div class="col">
                    <h1 style="color: black;" class="rounded float-left"><img src="${pageContext.request.contextPath}\movies-app.png" width="50" height="50">Mandal Theater</h1>
                </div>
                <div class="col-md-auto">
                    <h3 style="color: black;"><img src="${pageContext.request.contextPath}\location.png" width="25" height="25">Hyderabad</h3>
                </div>
                <div class="col col-lg-2">
                    <a href="login"><h3 class="rounded float-right" style="color: rgb(0, 0, 32);">Sign In<img src="${pageContext.request.contextPath}\log-in.png" width="25" height="25"></h3></a>
                </div>
            </div>
        </div>
            <div class="container">
                <img src="${pageContext.request.contextPath}\landingPageProjector.jpg" class="img-fluid" alt="not available" alt="projector" style="width:100%; border-radius: 50px;">
                <div class="text-block">
                  <h2 style="font-size: 60px;">Welcome To,</h2>
                  <p>Mandal Theater</p>
                </div>
                <div class="card" style="overflow: hidden; width: 35vw; height: 30vw; border-radius: 50px;">
                    <div class="text-block" style="border-color: white;opacity: 0.9; outline:1cm;">We Offer</div>
                    <div class="left">
                        <img src="${pageContext.request.contextPath}\seats1.jpg" class="card-img-top img-fluid" alt="comfortableseats">
                        
                    </div>
                    <div class="center" >
                        <img src="${pageContext.request.contextPath}\popcorn1.jpg" class="card-img-top img-fluid" alt="popcorn">
                        
                    </div>
                    <div class="right" >
                        <img src="${pageContext.request.contextPath}\dolby1.jpg" class="card-img-top img-fluid" alt="dolby">
                    </div>
                    
                </div>
            </div>
            <br>
            <div class="container">
                <div class="row">
                  <div class="col-sm">
                    <iframe class="rounded float-left" width="336" height="189" src="${trailerOne}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                  </div>
                  <div class="col-sm">
                    <iframe class="rounded" width="336" height="189" src="${trailerTwo}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                  </div>
                  <div class="col-sm">
                    <iframe class="rounded float-right" width="336" height="189" src="${trailerThree}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                  </div>
                </div>
              </div>
        
</body>
</html>