<%-- 
    Document   : login
    Created on : Sep 5, 2016, 12:08:35 PM
    Author     : daudau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../_partial/_header.jsp" />

<!-- page wapper-->
<div class="columns-container">
    <div class="container" id="columns">
        <!-- breadcrumb -->
        <div class="breadcrumb clearfix">
            <a class="home" href="#" title="Return to Home">Home</a>
            <span class="navigation-pipe">&nbsp;</span>
            <span class="navigation_page">Authentication</span>
        </div>
        <!-- ./breadcrumb -->
        <!-- page heading-->
        <h2 class="page-heading">
            <span class="page-heading-title2">Authentication</span>
        </h2>
        <!-- ../page heading-->
        <div class="page-content">
            <div class="row">
                <div class="col-sm-6">
                    <div class="box-authentication">
                        <h3>Create an account</h3>
                        <p>Please fill fields to create an account.</p>
                        <label for="emmail_register">Email address</label>
                        <input id="emmail_register" type="text" class="form-control" type="email" required>
                        
                        <label for="username_register">Username</label>
                        <input id="username_register" type="text" class="form-control" required>
                        
                        <label for="password_register">Password</label>
                        <input id="password_register" type="password" class="form-control" required>
                        
                        <button class="button"><i class="fa fa-user"></i> Create an account</button>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="box-authentication">
                        <h3>Already registered?</h3>
                        <label for="emmail_login">Email address</label>
                        <input id="emmail_login" type="text" class="form-control">
                        <label for="password_login">Password</label>
                        <input id="password_login" type="password" class="form-control">
                        <p class="forgot-pass"><a href="#">Forgot your password?</a></p>
                        <button class="button"><i class="fa fa-lock"></i> Sign in</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ./page wapper-->

<jsp:include page="../_partial/_footer.jsp" />
