<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>

<!-- INCLUDE HEADER -->
<%@ include file="includes/adminHeader.jsp" %>  

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
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
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block">
                            <img src="includes/assertsAdmin/img/taxilogin.jpg" width="500px" height="600px">
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Content de vous revoir ! </h1>
                                    </div>
                                    <form class="user" action="/TaxiBookingVF1-1.0-SNAPSHOT/GerantController" method="post" class="needs-validation">
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="inputlogin" name="inputlogin" value="${inputlogin}" aria-describedby="emailHelp"
                                                placeholder="Entrez-vous Email Addresse ...">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="inputpassword" name="inputpassword" value="${inputpassword}"  placeholder="Password">
                                        </div>
                                        <button class="btn btn-primary btn-user btn-block" name="login" value="login">
                                            Se Connecter
                                        </button>
                                        <hr>
                                        <a href="https://myaccount.google.com/?utm_source=OGB&tab=wk&utm_medium=app&pli=1" class="btn btn-google btn-user btn-block" target="_blank">
                                            <i class="fab fa-google fa-fw"></i> Connecter Google
                                        </a>
                                        
                                        <a href="https://fr-fr.facebook.com/" class="btn btn-facebook btn-user btn-block" target="_blank">
                                            <i class="fab fa-facebook-f fa-fw"></i> Connecter Facebook
                                        </a>
                                    </form>
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
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