<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">BOOKING <sup>TAXI</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="/TaxiBookingVF1-1.0-SNAPSHOT/GerantController?dashboard=true">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Tableau de bord</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">


            <!-- Heading -->
            <div class="sidebar-heading">
                Options
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
                        <li class="nav-item">
                <a class="nav-link" href="/TaxiBookingVF1-1.0-SNAPSHOT/GerantController?taxis=true">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Taxis</span></a>
            </li>

            <!-- Nav Item - Clients -->
            <li class="nav-item">
                <a class="nav-link" href="/TaxiBookingVF1-1.0-SNAPSHOT/GerantController?clients=true">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Clients</span></a>
            </li>

            <!-- Nav Item - Réservations -->
            <li class="nav-item">
                <a class="nav-link" href="/TaxiBookingVF1-1.0-SNAPSHOT/GerantController?reservation=true">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Réservations</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->