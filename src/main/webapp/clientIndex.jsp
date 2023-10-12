<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<!-- basic -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<!-- site metas -->
<title>MIOLA M1</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">	
<!-- bootstrap css -->
<link rel="stylesheet" type="text/css" href="includes/asserts/css/bootstrap.min.css"/>
<!-- style css -->
<link rel="stylesheet" type="text/css" href="includes/asserts/css/style.css"/>
<!-- Responsive-->
<link rel="stylesheet" href="includes/asserts/css/responsive.css"/>
<!-- fevicon -->
<link rel="icon" href="includes/asserts/images/fevicon.png" type="image/gif" />
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="includes/asserts/css/jquery.mCustomScrollbar.min.css"/>
<!-- Tweaks for older IEs-->
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<!-- owl stylesheets --> 
<link rel="stylesheet" href="includes/asserts/css/owl.carousel.min.css">
<link rel="stylesheet" href="includes/asserts/css/owl.theme.default.min.css">
<!--<link rel="stylesheet" href="includes/asserts/css/owl.theme.default.min.css"/>--> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen"/>

</head>
<body>
<!-- Alter START -->

<!-- Alter Fin -->
	<!--header section start -->
    <div id="index.html" class="header_section">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-lg-2">
                    <div class="logo"><a href="#"><span style="font-size: 25px;color: white;font-family: monospace;font-weight: bold;">Booking<span style="color: #f4db31;">TAXI</span></span></a></div>
                </div>
                <div class="col-sm-6 col-lg-10">
                    <div class="menu_text">
                        <ul>
                            <li><a href="#">Accueil</a></li>
                            <c:if test="${!empty taxis}"><li><a href="#taxis">Taxi</a></li></c:if>
                            <li><a href="#booking">Services</a></li>
                            <li>
                            <c:if test="${empty client}">
                            <a data-toggle="modal" data-target="#exampleModal" >Se connecter</a>
                            </c:if>
                            <c:if test="${!empty client}">
                            <a data-toggle="modal" data-target="#reservationModal" >
                            <span>Mes Réservations</span>
                            </a>
                            &nbsp;&nbsp;
                            <a href="/TaxiBookingVF1-1.0-SNAPSHOT/Controller?singup=true" >
                            <span>Bienvenue ${client.nom }</span>
                            </a>
                            
                            
                            </c:if>
                            </li>
                            <li><a href="#">
                            <img src="includes/asserts/images/search-icon.png"></a></li>
                            <div id="myNav" class="overlay">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <div class="overlay-content">
                  <a href="#">Accueil</a>
                  <c:if test="${!empty taxis}"><a href="#taxis">Taxi</a></c:if>
                  <a href="#booking">Services</a>
                 <c:if test="${empty client}">
                            <a data-toggle="modal" data-target="#exampleModal" >Se connecter</a>
                            </c:if>
                            <c:if test="${!empty client}">
                            <a data-toggle="modal" data-target="#reservationModal" >
                            <span>Mes Réservations</span>
                            </a>
                            &nbsp;&nbsp;
                            <a href="/TaxiBookingVF1-1.0-SNAPSHOT/Controller?singup=true" >
                            <span>Bienvenue ${client.nom }</span>
                            </a>
                            
                            </c:if>
                  
                </div>
                </div>
                <span  style="font-size:33px;cursor:pointer; color: #ffffff;" onclick="openNav()">
                <img src="includes/asserts/images/toggle-menu.png" class="toggle_menu"></span>
                </div>  
                </li>
                        </ul>
            </div>
            </div>

	            <div class="row">
	            <div class="col-12">
	            <c:if test="${!empty dangerMsg}">
	            <div class="alert alert-danger msgAlert"  role="alert">
				  ${dangerMsg}
				</div>
				</c:if>
				<c:if test="${!empty successMsg}">
	            <div class="alert alert-success msgAlert"  role="alert">
				  ${successMsg}
				</div>
				</c:if>
				</div>
	            </div>

        </div>
    </div>
    <!-- header section end -->
    <!-- Modal start-->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		   	<form action="/TaxiBookingVF1-1.0-SNAPSHOT/Controller" method="post" class="needs-validation" novalidate>
		   	       <input type="hidden" name="inputDateReservation" value="${inputDateReservation}"/>
			       <input type="hidden" name="inputHeureDebut" value="${inputHeureDebut}"/>
			       <input type="hidden" name="inputMinDebut" value="${inputMinDebut}"/>
			       <input type="hidden" name="inputHeureFin" value="${inputHeureFin}"/>
			       <input type="hidden" name="inputMinFin" value="${inputMinFin}"/>
			       <input type="hidden" name="inputTaxiId"  value="${taxi.texi_ID}"/>
			       <c:if test="${!empty client}">
			       <input type="hidden" name="inputClientid" value="${client.client_id}"/>
			       </c:if>
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Authentication ...</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
					<div class="form-group">
				    <label for="exampleInputEmail1">Adresse Email</label>
				    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="inputlogin"  required>
				    <div class="valid-feedback">Looks good!</div>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">Mot de passe</label>
				    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="inputpassword" required>
				  </div>
				  

				    <a data-toggle="modal" data-target="#clientModal" >Créer un Compte Client</a>    
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
		        <button type="submit" class="btn" name="connexion" value="connexion" style="color: #f4db31 !important;background: black !important;">Se Connectez</button>
		      </div>
		      
		    </div>
		    </form>
		  </div>
		</div>
<!-- Modal end-->


    <!-- Modal start Create Client-->
		<div class="modal fade" id="clientModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		   	<form action="/TaxiBookingVF1-1.0-SNAPSHOT/Controller" method="post" class="needs-validation" novalidate>

		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Création Compte Utilisateur</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
					<div class="form-group">
				    <label for="inputNomClient">Nom</label>
				    <input type="text" class="form-control" id="inputNomClient" aria-describedby="emailHelp" name="inputNomClient" placeholder="Entrez Votre Nom" required>
				  </div>
				  <div class="form-group">
				    <label for="inputPrenomClient">Prénom</label>
				    <input type="text" class="form-control" id="inputPrenomClient" aria-describedby="emailHelp" name="inputPrenomClient" placeholder="Entrez Votre Prénom" required>
				  </div>
				  <div class="form-group">
				    <label for="inputEmailClient">Date Naissance</label>
				    <input type="date"  class="form-control" id="inputDateNaisClient" " name="inputDateNaisClient" required>
				  </div>
				   <div class="form-group">
				    <label for="inputAdresseClient">Adresse</label>
				    <input type="text"  class="form-control" id="inputAdresseClient" placeholder="Entrez Votre Adresse" name="inputAdresseClient" required>
				  </div>
				  <div class="form-group">
				    <label for="inputEmailClient">Email</label>
				    <input type="email"  class="form-control" id="inputEmailClient" placeholder="email@email.com" name="inputEmailClient" required>
				  </div> 
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
		        <button type="submit" class="btn" name="saveClient" value="saveClient" style="color: #f4db31 !important;background: black !important;">Enregister</button>
		      </div>
		      
		    </div>
		    </form>
		  </div>
		</div>
<!-- Modal end-->


    <!-- Modal reservation-->
			<div class="modal fade " id="reservationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" data-target=".bd-example-modal-lg" aria-hidden="true">
			  <div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Mes Réservations</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			                              <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Client</th>
                                            <th>Taxi</th>
                                            <th>Matricule</th>
                                            <th>Date Reservation</th>
                                            <th>DU</th>
                                            <th>Au</th>
                                            <th>avis</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Client</th>
                                            <th>Taxi</th>
                                            <th>Matricule</th>
                                            <th>Date Reservation</th>
                                            <th>Du</th>
                                            <th>Au</th>
                                            <th>avis</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                     <c:forEach items="${reservations}" var="reservation">
                                     <!--  TEST DE VALIDATION DE RESERVATION 
                                     SI NULL AFFICHER LA LIGNE EN ORANGE =====> PAS EN COURS DECIDER
                                     SI TRUE AFFICHER LA LIGNE EN VERT =====> FAVORABLE
                                      SI FALSE AFFICHER LA LIGNE EN ROUGE =====>DEFAVORABLE
                                     -->
	                                     <c:set value="table-warning" var="cssAvisClass"></c:set>
	                                     <c:set value="EN COURS" var="varAvis"></c:set>

											<c:if test='${reservation.isValidate==1 }'> 
											  <c:set value="table-success" var="cssAvisClass"></c:set>
											  <c:set value="FABORABLE" var="varAvis"></c:set>
											</c:if> 
											<c:if test='${reservation.isValidate==0 }'> 
											  <c:set value="table-danger" var="cssAvisClass"></c:set>
											  <c:set value="DEFABORABLE" var="varAvis"></c:set>
											</c:if> 
                                     
                                        <tr class="${cssAvisClass}">
                                            <td>${reservation.client.nom}&nbsp;${reservation.client.prenom}</td>
                                            <td>${reservation.taxi.marque}&nbsp;${reservation.taxi.version}</td>
                                            <td>${reservation.taxi.matricule}</td>
                                            <td>${reservation.date_reservation}</td>
                                            <td>${reservation.heureDebut_reservation}<span>:</span>${reservation.minDebut_reservation}</td>
                                            <td>${reservation.heureFin_reservation}<span>:</span>${reservation.minFin_reservation}</td>
                                            <td>
                                            <c:if test='${reservation.isValidate==1 }'>
                                            FABORABLE
                                            </c:if>
                                            <c:if test='${reservation.isValidate==0 }'>
                                            DEFABORABLE
                                            </c:if>
                                            <c:if test='${reservation.isValidate==2 }'>
	                                      <div class="dropdown mb-4">
		                                        <button class="btn btn-primary dropdown-toggle" type="button"
		                                            id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
		                                            aria-expanded="false">
		                                            EN COURS
		                                        </button>
		                                        <div class="dropdown-menu animated--fade-in"
		                                            aria-labelledby="dropdownMenuButton">
		                                            <a class="dropdown-item"  href="/TaxiBookingVF1-1.0-SNAPSHOT/GerantController?id=${reservation.res_id}&FABORABLE=true">FABORABLE</a>
		                                            <a class="dropdown-item"  href="/TaxiBookingVF1-1.0-SNAPSHOT/GerantController?id=${reservation.res_id}&FABORABLE=false">DEFABORABLE</a>
		                                        </div>
                                    		</div>
                                    		</c:if>
                                            </td>
                                        </tr>
                                       </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div>
<!-- Modal end reservation-->
    <!-- banner section start -->
    <div class="banner_section">
      <div class="container-fluid">
        <div id="main_slider" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <div class="row">
          <div class="col-md-6">
            
            <div class="image_1"><img src="includes/asserts/images/img-1.png"></div>
          </div>
          <div class="col-md-6">
            <h1 class="booking_text"></h1>
            <div class="contact_bg">
            <div class="input_main">
              <div class="container">
                <h2 class="request_text">Trouver rapidement votre taxi</h2>
                <form action="/TaxiBookingVF1-1.0-SNAPSHOT/Controller" method="post" novalidate>
                <div class="form-group">
                	<label for="inputDate">Date Réservation</label>
                  <input type="date" class="form-control" placeholder="DATE RESERVATION" value="${inputDateReservation}" name="inputDateReservation" style="background: #e1e1e1;" required>
                </div>
                <div class="form-group" >
                <label for="heureDebut">Du</label>
                <div class="form-row">
             	<input type="number" id="inputHeureDebut" placeholder="Entrez Heure Debut" class="form-control" min="00" max="23" value="${inputHeureDebut}" name="inputHeureDebut" onchange="document.getElementById('inputHeureFin').min=this.value;document.getElementById('inputHeureFin').value=this.value;" style="background: #e1e1e1; width:50%" required/>
                <select class="form-control" id="selectMinFin" name="inputMinDebut" value="${inputMinDebut}" style="background: #e1e1e1;" required >
			      <option>00</option>
			      <option>15</option>
			      <option>30</option>
			      <option>45</option>
			    </select>
			    </div>
                </div>
                <div class="form-group" >
                <label for="heureFin">Au</label>
                <div class="form-row">
             	<input type="number" class="form-control" max="23" placeholder="Entrez Heure Fin" name="inputHeureFin" value="${inputHeureFin}" id="inputHeureFin"  style="background: #e1e1e1; width:50%" required/>
                <select class="form-control" id="selectMinFin" name="inputMinFin"  value="${inputMinFin}" style="background: #e1e1e1; width:50%" required>
			      <option>00</option>
			      <option>15</option>
			      <option>30</option>
			      <option>45</option>
			    </select>
			    </div>
                </div>
                <button type="submit" class="btn" name="SearcheavailibleTaxi" value="SearcheavailibleTaxi" style="color: #f4db31 !important;background: black !important;">Rechercher</button>
                  </form>
                  </div> 
                  </div>
                    
          </div>
          </div>
        </div>
    </div>


  </div>

</div>
        
      </div>
    </div>
    <!-- banner section end -->
    <!-- our taxis section start -->
    
    <c:if test="${!empty taxis}">
    <div id="taxis" class="taxis_section layout_padding">
      <div class="container">
      <h1 class="our_text"><span style="color: #f4db31;">Taxi</span> DISPONIBLE</h1>
        <div class="taxis_section_2" >
  <div class="owl-carousel">
 <c:forEach items="${taxis}" var="taxi" varStatus="loop"> 
    <div class="carousel-item active" >
       
          <div class="row">
           <form action="/TaxiBookingVF1-1.0-SNAPSHOT/Controller" method="post">
       <input type="hidden" name="inputDateReservation" value="${inputDateReservation}">
       <input type="hidden" name="inputHeureDebut" value="${inputHeureDebut}">
       <input type="hidden" name="inputMinDebut" value="${inputMinDebut}">
       <input type="hidden" name="inputHeureFin" value="${inputHeureFin}">
       <input type="hidden" name="inputMinFin" value="${inputMinFin}">
       <input type="hidden" name="taxiId"  value="${taxi.texi_ID}">
       
       <c:if test="${!empty client}">
       <input type="hidden" name="clientid" value="${client.client_id}">
       </c:if>
          
            <div class="col-md-10">
              <div class="taxi_main">
                <div class="round_1">${loop.index+1}</div>
                <h2 class="carol_text">${taxi.marque}</h2>
                <p class="reader_text">${taxi.version}</p>
                <div class="images_2"><img src="includes/asserts/images/img-2.png">
                 <c:if test="${!empty client}">
                <button type="submit" class="btn btn-block rounded-0" name="save_reservation" value="save_reservation" style="color: #f4db31 !important;background: black !important;">Reserver</button>
                </c:if>
                 <c:if test="${empty client}">
                <a class="btn  btn-block  rounded-0"  style="color: #f4db31 !important;background: black !important;" data-toggle="modal" data-target="#exampleModal">Reserver</a>
                </c:if>
                </div>
              </div>
                    
            </div>
       </form>

          </div>

    </div>
</c:forEach>
  </div>


</div>
      </div>
    </div>
    </c:if>
    <!-- our taxis section end -->
    <!-- why ride section start -->
    <div id="booking" class="ride_section layout_padding">
      <div class="container">
        <div class="ride_main">
          <h1 class="ride_text">Pourquoi rouler avec <span style="color: #f4db31;">Booking TAXI</span></h1>
      </div>
        </div>
    </div>
    <div class="ride_section_2 layout_padding">
      <div class="container">
        <div class="row">
          <div class="col-sm-4">
            <div class="image_3"><img src="includes/asserts/images/img-3.png"></div>
          </div>
          <div class="col-sm-8">
            <h1 class="cabe_text">Meilleur Tarif </h1>
            <p class="long_text">La Où vous êtes, vous pouvez réserver votre taxi à un tarif raisonnable </p>
            <div class="book_bt"><a href="#">RESERVEZ</a></div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-sm-8">
            <h1 class="secure_text">Des trajets sûrs et sécurisés</h1>
            <p class="long_text_2">Nos chauffeurs confirmés vous permet de vous y rendre en toute sécurité </p>
            <div class="book_bt_2"><a href="#">RESERVEZ</a></div>
          </div>
          <div class="col-sm-4">
            <div class="image_3"><img src="includes/asserts/images/img-4.png"></div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-sm-4">
            <div class="image_3"><img src="includes/asserts/images/img-5.png"></div>
          </div>
          <div class="col-sm-8">
            <h1 class="cabe_text">Nos taxis sont plus proche à vous</h1>
            <p class="long_text">Reservez maintenant, et vous trouvez votre taxi à coté de vous avec un délai de 5 min au maximum </p>
            <div class="book_bt"><a href="#">RESERVEZ</a></div>
          </div>
        </div>
      </div>
    </div>
    <!-- why ride section end -->
    <!-- location section start -->
    <div id="contact" class="location_sectin layout_padding">
      <div class="container-fluid">
        <div class="location_main">
          <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-5">
              <div class="download_text">application mobile plus tôt disponible  <br></div>
            </div>
            <div class="col-sm-3">
              <div class="image_7"><img src="includes/asserts/images/img-7.png"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- download section end -->
  <!-- section footer start -->
    <div class="section_footer ">
      <div class="container"> 
          <div class="footer_section_2">
            <div class="row">
                <div class="col-sm-6 col-md-6 col-lg-3">
                  <h2 class="account_text">Adresse</h2>
                  <p class="ipsum_text">CENTRE VILLE, RABAT,MAROC</p>
                </div>                          
                
                <div class="col-sm-6 col-md-6 col-lg-3">
                  <h2 class="account_text">Liens</h2>
                  <div class="image-icon"><img src="includes/asserts/images/bulit-icon.png"><span class="fb_text"><a href="#">Accueil</span></a></div>
                <div class="image-icon"><img src="includes/asserts/images/bulit-icon.png"><span class="fb_text"><a href="#booking">Services</span></a></div>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-3">
                <h2 class="account_text">Follow Us</h2>
                <div class="image-icon"><img src="includes/asserts/images/fb-icon.png"><span class="fb_text"><a href="https://fr-fr.facebook.com/">Facebook</a></span></div>
                <div class="image-icon"><img src="includes/asserts/images/youtube-icon.png"><span class="fb_text"><a href="https://www.youtube.com/watch?v=C6115xklPDQ">Youtube</a></span></div>            
                <div class="image-icon"><img src="includes/asserts/images/instagram-icon.png"><span class="fb_text"><a href="https://www.instagram.com/?hl=fr">Instagram</a></span></div>
                </div>
          <div class="col-sm-6 col-md-6 col-lg-3">
          </div>
          </div>
          </div>
          </div>
    </div>
    
  <!-- section footer end -->
  <!-- copyright section start -->
  <div class="copyright_section">
    <div class="container">
      <p class="copyright">2021 All Rights Reserved. <a href="http://ensias.um5.ac.ma/">MIOLA M1</a></p>
    </div>
  </div>

    <!-- Javascript files-->
    <script src="includes/asserts/js/jquery.min.js"></script>
    <script src="includes/asserts/js/popper.min.js"></script>
    <script src="includes/asserts/js/bootstrap.bundle.min.js"></script>
    <script src="includes/asserts/js/jquery-3.0.0.min.js"></script>
    <script src="includes/asserts/js/plugin.js"></script>
    <!-- sidebar -->
    <script src="includes/asserts/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="includes/asserts/js/custom.js"></script>
    <!-- javascript  
    <script src="includes/asserts/js/owl.carousel.js"></script>-->
    <script src="includes/asserts/js/owl.carousel.min.js"></script>
    
    <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
    <script>
    $(document).ready(function(){
    $(".fancybox").fancybox({
    openEffect: "none",
    closeEffect: "none"
    });
       
    $(".zoom").hover(function(){
         
    $(this).addClass('transition');
    }, function(){
         
    $(this).removeClass('transition');
    });
    
    
    });
    
    setTimeout(function() {
        $('.msgAlert').fadeOut('fast');
    }, 1500); 
    </script> 
    <script type="text/javascript">
    $(document).ready(function(){
    	  $(".owl-carousel").owlCarousel();
    	});
    </script>
    <script>
    function openNav() {
    document.getElementById("myNav").style.width = "100%";
    }

    function closeNav() {
   document.getElementById("myNav").style.width = "0%";
   }
</script>   
</body>
</html>