<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- INCLUDE HEADER -->
<%@ include file="includes/adminHeader.jsp" %>  
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
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
                
                
                <!-- statistique Reservation -->

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">TABLEAU DE BORD</h1>
                    
                    <!-- sTATISTIC -->
                      <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Nombre des Réservations en Cours</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${count_Reservation_encours}</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Annual) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Nombre des Réservations Favorable</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${count_Reservation_favorable}</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-bell fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Annual) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Nombre des Réservations défavorable</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${count_Reservation_defavorable}</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-bell fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                Nombre total des Réservations</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${count_Reservation}</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                  <!-- fin sTATISTIC -->
                  <!-- Statistique 2 -->
                  <form action="">
                  
					<input type="hidden" name="chart_Reservation_mois1" id="chart_Reservation_mois1" value="${chart_Reservation_mois1}" />
					<input type="hidden" name="chart_Reservation_mois2" id="chart_Reservation_mois2" value="${chart_Reservation_mois2}" />
					<input type="hidden" name="chart_Reservation_mois3" id="chart_Reservation_mois3" value="${chart_Reservation_mois3}" />
					<input type="hidden" name="chart_Reservation_mois4" id="chart_Reservation_mois4" value="${chart_Reservation_mois4}" />
					<input type="hidden" name="chart_Reservation_mois5" id="chart_Reservation_mois5" value="${chart_Reservation_mois5}" />
					<input type="hidden" name="chart_Reservation_mois6" id="chart_Reservation_mois6" value="${chart_Reservation_mois6}" />
					<input type="hidden" name="chart_Reservation_mois7" id="chart_Reservation_mois7" value="${chart_Reservation_mois7}" />
					<input type="hidden" name="chart_Reservation_mois8" id="chart_Reservation_mois8" value="${chart_Reservation_mois8}" />
					<input type="hidden" name="chart_Reservation_mois9" id="chart_Reservation_mois9" value="${chart_Reservation_mois9}" />
					<input type="hidden" name="chart_Reservation_mois10" id="chart_Reservation_mois10" value="${chart_Reservation_mois10}" />
					<input type="hidden" name="chart_Reservation_mois11" id="chart_Reservation_mois11" value="${chart_Reservation_mois11}" />
					<input type="hidden" name="chart_Reservation_mois12" id="chart_Reservation_mois12" value="${chart_Reservation_mois12}" />
					
					<input type="hidden" name="chart_Reservation_mois1" id="chart_Reservation_mois1" value="${chart_Reservation_mois1}" />
					
					<input type="hidden" name="chart_Reservation_count" id="chart_Reservation_count" value="${chart_Reservation_count}" />
					
					</form>
					                  
                  
                  
                                      <!-- Content Row -->
                    <div class="row">

                        <div class="col-xl-12 col-lg-12">

                            <!-- Area Chart -->
                            <div class="card shadow ">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Réservation PAR Mois</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                        <script type="text/javascript">
                                        var mois1 = document.getElementById("chart_Reservation_mois1").value;
                                        var mois2 = document.getElementById("chart_Reservation_mois2").value;
                                        var mois3 = document.getElementById("chart_Reservation_mois3").value;
                                        var mois4 = document.getElementById("chart_Reservation_mois4").value;
                                        var mois5 = document.getElementById("chart_Reservation_mois5").value;
                                        var mois6 = document.getElementById("chart_Reservation_mois6").value;
                                        var mois7 = document.getElementById("chart_Reservation_mois7").value;
                                        var mois8 = document.getElementById("chart_Reservation_mois8").value;
                                        var mois9 = document.getElementById("chart_Reservation_mois9").value;
                                        var mois10 = document.getElementById("chart_Reservation_mois10").value;
                                        var mois11 = document.getElementById("chart_Reservation_mois11").value;
                                        var mois12 = document.getElementById("chart_Reservation_mois12").value;
                                        
                                        var nbReservation = document.getElementById("chart_Reservation_count").value;
                                        
                                        var v = [];
                                        var mois=[];
                                        if(mois1!=null){v.push(mois1);mois.push("Janvier")}
                                        if(mois2!=null){v.push(mois2);mois.push("Fevrier")}
                                        if(mois3!=null){v.push(mois3);mois.push("Mars")}
                                        if(mois4!=null){v.push(mois4);mois.push("Avril")}
                                        if(mois5!=null){v.push(mois5);mois.push("Mai")}
                                        if(mois6!=null){v.push(mois6);mois.push("Juin")}
                                        if(mois7!=null){v.push(mois7);mois.push("Juillet")}
                                        if(mois8!=null){v.push(mois8);mois.push("Aout")}
                                        if(mois9!=null){v.push(mois9);mois.push("Septembre")}
                                        if(mois10!=null){v.push(mois10);mois.push("Octobre")}
                                        if(mois11!=null){v.push(mois11);mois.push("Novembre")}
                                        if(mois12!=null){v.push(mois12);mois.push("Decembre")}
                                        
                                        
                                        var ctx = document.getElementById("myAreaChart");
                                        var myChart = new Chart(ctx, {
                                            type: 'line',
                                            data: {
                                                labels: mois,
                                                datasets: [{
                                                    label: 'Nombre de Réservations',
                                                    data: v,
                                                    backgroundColor: [
                                                        'rgba(54, 162, 235, 0.2)',
                                                        'rgba(54, 162, 235, 0.2)',
                                                        'rgba(54, 162, 235, 0.2)',
                                                        'rgba(54, 162, 235, 0.2)',
                                                        'rgba(54, 162, 235, 0.2)',
                                                        'rgba(54, 162, 235, 0.2)'
                                                    ],
                                                    borderColor: [
                                                        'rgba(54, 162, 235, 0.2)',
                                                        'rgba(54, 162, 235, 0.2',
                                                        'rgba(54, 162, 235, 0.2)',
                                                        'rgba(54, 162, 235, 0.2)',
                                                        'rgba(54, 162, 235, 0.2)',
                                                        'rgba(54, 162, 235, 0.2)'
                                                    ],
                                                    borderWidth: 1
                                                }]
                                            },
                                            options: {
                                                scales: {
                                                    yAxes: [{
                                                        ticks: {
                                                            beginAtZero:true
                                                        }
                                                    }]
                                                }
                                            }
                                        });
</script>
                                    </div>
                                    <hr>

                                </div>
                            </div>


                            </div>

                        </div>
                  <!-- Fin statistique 2 -->
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