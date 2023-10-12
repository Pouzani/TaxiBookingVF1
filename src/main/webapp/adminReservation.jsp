<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- INCLUDE HEADER -->
<%@ include file="includes/adminHeader.jsp" %>  

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <!-- INCLUDE  Sidebar -->
        	<%@ include file="includes/adminSidebar.jsp" %>  
		 <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <!-- INCLUDE  Topbar -->
                 <%@ include file="includes/adminTopbar.jsp" %>  
				<!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">RESERVATION </h1>
                    <p class="mb-4">Liste des réservations où vous pouvez consulter l'ensemble des demandes des clients, et de confirmer ou d'annuler une réservation<br/> les indices ci-dessous représente l'état de chaque ligne de réservation</p>
                    <ul>
                    	<li><span class="bg-warning text-dark">&nbsp;</span>&nbsp;&nbsp; En cours</li>
                    	<li><span class="bg-success  text-white">&nbsp;</span>&nbsp;&nbsp;FAVORABLE</li>
                    	<li><span class="bg-danger text-white">&nbsp;</span>&nbsp;&nbsp;DEFAVORABLE</li>
                    </ul>
                     <!-- RESERVATION -->
                                         <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Réservation</h6>
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
                                            <th>Du</th>
                                            <th>AU</th>
                                            <th>Avis</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Client</th>
                                            <th>Taxi</th>
                                            <th>Matricule</th>
                                            <th>Date Reservation</th>
                                            <th>Du</th>
                                            <th>AU</th>
                                            <th>Avis</th>
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
                    </div>
                     <!-- END RESERVATION -->

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            
            	<%@ include file="includes/adminFooter.jsp" %>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

<%@ include file="includes/adminScriptes.jsp" %>

</body>

</html>