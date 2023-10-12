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
                    <h1 class="h3 mb-4 text-gray-800">TAXI </h1>
                    
                                                <!-- Collapsable Card Example -->
                            <div class="card shadow mb-4">
                             <!-- ERROR PAGES -->
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
						<!-- / ERROR PAGES -->
                                <!-- Card Header - Accordion -->
                                <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse"
                                    role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                    <h6 class="m-0 font-weight-bold text-primary">Gestion Taxi</h6>
                                </a>
                                <!-- Card Content - Collapse -->
                                <div class="collapse show" id="collapseCardExample">
                                    <div class="card-body">
                                       <form class="user" action="/TaxiBookingVF1-1.0-SNAPSHOT/GerantController" method="post" class="needs-validation">
                                       <input type="hidden" name="idTaxi" value="${idTaxi}"/>
	                                        <div class="form-group">
	                                            <input type="text" class="form-control form-control-user"
	                                                id="inputmarque" name="inputmarque" value="${inputmarque}" aria-describedby="MARQUE"
	                                                placeholder="Entrez-vous la marque du taxi">
	                                        </div>
	                                        <div class="form-group">
	                                            <input type="text" class="form-control form-control-user"
	                                                id="inputversion" name="inputversion" value="${inputversion}" placeholder="Entrez-vous la version du taxi">
	                                        </div>
	                                        <div class="form-group">
	                                            <input type="text" class="form-control form-control-user"
	                                                id="inputmatricule" name="inputmatricule" value="${inputmatricule}" placeholder="Entrez-vous le matricule du taxi">
	                                        </div>
	                                        <div class="form-group">
	                                                 <select class="form-control" id="selectcouleur" name="selectcouleur"  value="${selectcouleur}" selected="${selectcouleur}">
												      <option value="Bleu" ${selectcouleur == 'Bleu' ? 'selected' : ''} >Bleu</option>
												      <option value="Blanc" ${selectcouleur == 'Blanc' ? 'selected' : ''} >Blanc</option>
												      <option value="Jaune" ${selectcouleur == 'Jaune' ? 'selected' : ''}>Jaune</option>
												      <option value="Gris" ${selectcouleur == 'Gris' ? 'selected' : ''}>Gris</option>
												      <option value="Noir" ${selectcouleur == 'Noir' ? 'selected' : ''}>Noir</option>
												      <option value="Orange" ${selectcouleur == 'Orange' ? 'selected' : ''} >Orange</option>
												      <option value="Rose"  ${selectcouleur == 'Rose' ? 'selected' : ''}>Rose</option>
												      <option value="Rouge" ${selectcouleur == 'Rouge' ? 'selected' : ''}>Rouge</option>
												      <option value="Vert" ${selectcouleur == 'Vert' ? 'selected' : ''}>Vert</option>
												      <option value="Violet" ${selectcouleur == 'Violet' ? 'selected' : ''}>Violet</option>
												    </select>
	                                        </div>
	                                        <c:if test="${empty idTaxi }">
	                                        <button type="submit" class="btn btn-info btn-user btn-block" name="saveTaxi" value="saveTaxi">
	                                            Enregister
	                                        </button>
	                                        </c:if>
	                                        <c:if test="${!empty idTaxi }">
	                                        <button type="submit" class="btn btn-warning btn-user btn-block" name="updateTaxi" value="updateTaxi">
	                                            Modifier
	                                        </button>
	                                        </c:if>
	                                        
	                                        <hr>

                                    </form>
                                    </div>
                                </div>
                            </div>

                     <!-- Clients -->
                                         <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Liste des taxis</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Marque</th>
                                            <th>Version</th>
                                            <th>Matricule</th>
                                            <th>Couleur</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Marque</th>
                                            <th>Version</th>
                                            <th>Matricule</th>
                                            <th>Couleur</th>
                                            <th>Actions</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                     <c:forEach items="${taxis}" var="taxi">
                                     
                                        <tr>
                                            <td>${taxi.marque}</td>
                                            <td>${taxi.version}</td>
                                            <td>${taxi.matricule}</td>
                                            <td>${taxi.couleur}</td>
                                            <td><a href="/TaxiBookingVF1-1.0-SNAPSHOT/GerantController?modifierTaxi=${taxi.texi_ID}">Modifier</a></td>
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
 <script> 
    setTimeout(function() {
        $('.msgAlert').fadeOut('fast');
    }, 1500); 
    </script> 
</body>

</html>