<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid p-3 bg-light">
    <div class="row">
        <div class="col-md-3">
            <h3>Ebooks</h3>
        </div>
        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
        

            <div class="col-md-3">
            <a href="../login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
            <a href="../register.jsp" class="btn btn-primary text-white"><i class="fa-solid fa-user-plus"></i> Register</a>
             </div>
            <a href="javascript:void(0);" class="btn btn-danger" data-toggle="modal" data-target="#logoutModal">
                <i class="fa-solid fa-right-from-bracket"></i> Logout
            </a>
       
    </div>
</div>

<!-- Logout Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="logoutModalLabel">Confirm Logout</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-center">
                <h4>Are you sure you want to logout?</h4>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
<a href="<%= request.getContextPath() %>/logout" class="btn btn-primary text-white">Logout</a>
            </div>
        </div>
    </div>
</div>
<!-- End Logout Modal -->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" 
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#"><i class="fa-solid fa-book-open"></i> Recent Book</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#"><i class="fa-solid fa-book-open"></i> New Book</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#"><i class="fa-solid fa-book-open"></i> Old Book</a>
            </li>
        </ul>
        <form class="d-flex my-2 my-lg-0">
            <button class="btn btn-light mx-2" type="submit">
                <i class="fa-solid fa-gear"></i> Settings
            </button>
            <button class="btn btn-light mx-2" type="submit">
                <i class="fa-solid fa-address-card"></i> Contact Us
            </button>
        </form>
    </div>
</nav>
