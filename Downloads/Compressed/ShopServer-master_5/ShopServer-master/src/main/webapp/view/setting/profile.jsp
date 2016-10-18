<%-- 
    Document   : profile
    Created on : Oct 17, 2016, 12:10:09 AM
    Author     : daudau
--%>

<%@ include file="../_partial/_header.jsp" %>

<div class="columns-container">
    <div class="container" id="columns">
        <!-- breadcrumb -->
        <div class="breadcrumb clearfix">
            <a class="home" href="#" title="Return to Home">Home</a>
            <span class="navigation-pipe">&nbsp;</span>
            <span class="navigation_page">Setting</span>
        </div>
        <!-- ./breadcrumb -->
        <!-- row -->
        <div class="row"> 
            <%@ include file="sidebar.jsp" %>
            <!-- Center colunm-->
            <div class="center_column col-xs-12 col-sm-9" id="center_column">
                <!-- page heading-->
                <h2 class="page-heading">
                    <span class="page-heading-title2">Account information</span>
                </h2>
                <!-- Content page -->
                <div class="content-text clearfix">
                    <div class="box-authentication">                                           
                        <form action="${root}/setting/profile" method="post" name="profile_setting">
                            <label for="fullname_register">Full name</label>
                            <input value="${user.getName()}" id="fullname_register" type="text" class="form-control" required name="name">    

                            <label for="emmail_register">Email address</label>
                            <input value="${user.getEmail()}" id="emmail_register" type="text" class="form-control" type="email" required name="email">
                            
                            <label for="address_register">Address</label>
                            <input value="${user.getAddress()}" id="address_resgister" type="text" class="form-control" required name="address">
                            
                            <label for="address_register">Phone</label>
                            <input value="${user.getPhone()}" id="address_resgister" type="text" class="form-control" required name="phone">
                            
                            <label for="old_password">Old password</label>
                            <input type="password" class="form-control" name="oldPassword" />
                            
                            <label for="new_password">New password</label>                            
                            <input type="password" class="form-control" name="newPassword" id="new_password" />
                            <div class="text-info">Enter both old and new password to change password</div>

                            <button class="button" type="submit"><i class="fa fa-user"></i> Save</button>
                            <button class="button" type="reset"><i class="fa fa-times"></i> Reset</button>
                            <p class="text-danger"></p>
                        </form>
                    </div>

                </div>
                <!-- ./Content page -->
            </div>
            <!-- ./ Center colum -->
        </div>
        <!-- ./row-->
    </div>
</div>

<%@ include file="../_partial/_footer.jsp" %>