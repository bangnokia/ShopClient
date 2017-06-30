<%-- 
    Document   : login
    Created on : Sep 5, 2016, 12:08:35 PM
    Author     : daudau
--%>

<%@ include file="../_partial/_header.jsp" %>
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
                        <p class="text-danger">${registerNotice}</p>
                        <p>Please fill fields to create an account.</p>                                                
                        <form action="${root}/auth/register" method="post" name="auth_register">
                            <label for="fullname_register">Full name</label>
                            <input id="fullname_register" type="text" class="form-control" required name="name">

                            <label for="username_register">Username</label>
                            <input id="username_register" type="text" class="form-control" required name="username">

                            <label for="emmail_register">Email address</label>
                            <input id="emmail_register" type="text" class="form-control" type="email" required name="email">

                            <label for="password_register">Password</label>
                            <input id="password_register" type="password" class="form-control" required name="password">

                            <label for="address_register">Address</label>
                            <input id="address_resgister" type="text" class="form-control" required name="address">

                            <button class="button" type="submit"><i class="fa fa-user"></i> Create an account</button>

                        </form>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="box-authentication">
                        <h3>Already registered?</h3>
                        <form action="${root}/auth/login" method="post" name="auth_login">
                            <input id="backurl"  type="hidden"  name="backurl" value="1234444">
                            <p class="text-danger">${loginError}</p>
                            <label for="userLogin">Username</label>
                            <input id="usernameLogin" type="text" class="form-control" name="usernameLogin" required>

                            <label for="password_login">Password</label>
                            <input id="passwordLogin" type="password" class="form-control" name="passwordLogin" required="">

                            <p class="forgot-pass"><a href="#">Forgot your password?</a></p>
                            <button class="button" type="submit"><i class="fa fa-lock"></i> Sign in</button>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ./page wapper-->

<jsp:include page="../_partial/_footer.jsp" />
