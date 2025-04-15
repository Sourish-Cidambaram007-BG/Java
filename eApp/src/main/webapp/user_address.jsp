<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Address</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2">
<%@include file="all_component/navbar.jsp" %>
<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h3 class="text-center text-success">Add Address</h3>
<form action="">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputAddress">Address</label>
                                    <input type="text" class="form-control" id="inputAddress" placeholder="Address" value="">
                                </div>
                                                                <div class="form-group col-md-4">
                                    <label for="inputLandmark">Landmark</label>
                                    <input type="text" class="form-control" id="inputLandmark" placeholder="Landmark" value="">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputCity">City</label>
                                    <input type="text" class="form-control" id="inputCity" placeholder="City" value="">
                                </div>
                                
                                <div class="form-group col-md-6">
                                    <label for="inputCity">State</label>
                                    <input type="text" class="form-control" id="inputCity" placeholder="City" value="">
                                </div>
                                 <div class="form-group col-md-6">
                                    <label for="inputCity">PinCode</label>
                                    <input type="text" class="form-control" id="inputCity" placeholder="City" value="">
                                </div>
                            </div>
                            
                            <div class="text-center">
                            <button class="btn btn-warning">Add Address</button>
                            </div>
</form>
</div>
</div>
</div>
</div>
</div>

<%@ include file="all_component/footer.jsp" %>
</body>
</html>