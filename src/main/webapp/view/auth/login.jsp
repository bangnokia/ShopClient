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
                        <form action="/auth/register" method="post" name="auth_register">
                            <label for="username_register">Username</label>
                            <input id="username_register" type="text" class="form-control" required>

                            <label for="emmail_register">Email address</label>
                            <input id="emmail_register" type="text" class="form-control" type="email" required>

                            <label for="password_register">Password</label>
                            <input id="password_register" type="password" class="form-control" required>

                            <button class="button"><i class="fa fa-user"></i> Create an account</button>
                        </form>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="box-authentication">
                        <h3>Already registered?</h3>
                        <form action="${root}/auth/login" method="post" name="auth_login">
                            <label for="userLogin">Username</label>
                            <input id="usernameLogin" type="text" class="form-control" name="usernameLogin">

                            <label for="password_login">Password</label>
                            <input id="passwordLogin" type="password" class="form-control" name="passwordLogin">

                            <p class="forgot-pass"><a href="#">Forgot your password?</a></p>
                            <button class="button"><i class="fa fa-lock"></i> Sign in</button>
                            ${mess}
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ./page wapper-->

<jsp:include page="../_partial/_footer.jsp" />
