<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="adminRoot" value="${pageContext.request.contextPath}" scope="session" />
<c:set var="root" value="${pageContext.request.contextPath}" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
        <meta charset="utf-8" />
        <title>Webarch - Responsive Admin Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="" name="description" />
        <meta content="" name="author" />

        <link href="${adminRoot}/assets/admin/assets/plugins/jquery-metrojs/MetroJs.min.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="${adminRoot}/assets/admin/assets/plugins/shape-hover/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="${adminRoot}/assets/admin/assets/plugins/shape-hover/css/component.css" />
        <link rel="stylesheet" type="text/css" href="${adminRoot}/assets/admin/assets/plugins/owl-carousel/owl.carousel.css" />
        <link rel="stylesheet" type="text/css" href="${adminRoot}/assets/admin/assets/plugins/owl-carousel/owl.theme.css" />
        <link href="${adminRoot}/assets/admin/assets/plugins/pace/pace-theme-flash.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="${adminRoot}/assets/admin/assets/plugins/jquery-slider/css/jquery.sidr.light.css" rel="stylesheet" type="text/css" media="screen"/>
        <link rel="stylesheet" href="${adminRoot}/assets/admin/assets/plugins/jquery-ricksaw-chart/css/rickshaw.css" type="text/css" media="screen" >
        <link rel="stylesheet" href="${adminRoot}/assets/admin/assets/plugins/Mapplic/mapplic/mapplic.css" type="text/css" media="screen" >
        <!-- BEGIN CORE CSS FRAMEWORK -->
        <link href="${adminRoot}/assets/admin/assets/plugins/boostrapv3/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${adminRoot}/assets/admin/assets/plugins/boostrapv3/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="${adminRoot}/assets/admin/assets/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="${adminRoot}/assets/admin/assets/css/animate.min.css" rel="stylesheet" type="text/css"/>
        <link href="${adminRoot}/assets/admin/assets/plugins/jquery-scrollbar/jquery.scrollbar.css" rel="stylesheet" type="text/css"/>
        <!-- END CORE CSS FRAMEWORK -->

        <!-- BEGIN CSS TEMPLATE -->
        <link href="${adminRoot}/assets/admin/assets/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="${adminRoot}/assets/admin/assets/css/responsive.css" rel="stylesheet" type="text/css"/>
        <link href="${adminRoot}/assets/admin/assets/css/custom-icon-set.css" rel="stylesheet" type="text/css"/>
        <link href="${adminRoot}/assets/admin/assets/css/magic_space.css" rel="stylesheet" type="text/css"/>
        <!-- END CSS TEMPLATE -->

        <link rel="stylesheet" href="${adminRoot}/assets/js/jqwidgets/styles/jqx.base.css" type="text/css" />
        <link rel="stylesheet" href="${adminRoot}/assets/js/jqwidgets/styles/jqx.bootstrap.css" type="text/css" />
    </head>
    <!-- END HEAD -->
    <!-- BEGIN BODY -->
    <body class="">
        <!-- BEGIN HEADER -->
        <div class="header navbar navbar-inverse ">
            <!-- BEGIN TOP NAVIGATION BAR -->
            <div class="navbar-inner">
                <div class="header-seperation">
                    <ul class="nav pull-left notifcation-center" id="main-menu-toggle-wrapper" style="display:none">
                        <li class="dropdown"> <a id="main-menu-toggle" href="#main-menu"  class="" >
                                <div class="iconset top-menu-toggle-white"></div>
                            </a> </li>
                    </ul>
                    <!-- BEGIN LOGO -->
                    <a href="#"><img src="http://www.shopsmart.org/images/shopsmart-logo.png" class="logo" alt=""  
                                     data-src="http://www.shopsmart.org/images/shopsmart-logo.png" 
                                     data-src-retina="http://www.shopsmart.org/images/shopsmart-logo.png" width="106" height="21"/></a>
                    <!-- END LOGO -->
                    <ul class="nav pull-right notifcation-center">
                        <li class="dropdown" id="header_task_bar"> <a href="#" class="dropdown-toggle active" data-toggle="">
                                <div class="iconset top-home"></div>
                            </a> </li>
                        <li class="dropdown" id="header_inbox_bar" > <a href="#" class="dropdown-toggle" >
                                <div class="iconset top-messages"></div>
                                <span class="badge" id="msgs-badge">0</span> </a></li>
                        <li class="dropdown" id="portrait-chat-toggler" style="display:none"> <a href="#sidr" class="chat-menu-toggle">
                                <div class="iconset top-chat-white "></div>
                            </a> </li>
                    </ul>
                </div>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <!--<div class="header-quick-nav" >
                    <h3>đây là admin của page, ghi cái gì ra đây giờ ??????????????</h3>
                </div>-->
                <!-- END TOP NAVIGATION MENU -->
            </div>
            <!-- END TOP NAVIGATION BAR -->
        </div>
        <!-- END HEADER -->
        <div class="page-container row-fluid">