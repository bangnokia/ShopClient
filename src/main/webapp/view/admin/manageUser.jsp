<%-- 
    Document   : home
    Created on : Sep 19, 2016, 3:35:24 AM
    Author     : daudau
--%>
<%@include file="_header.jsp" %>
<!-- BEGIN CONTAINER -->
<%@include file="_sidebar.jsp" %>
<!-- BEGIN PAGE CONTAINER-->
<style>
    .search {
        margin-top: -25%;
    }
    .search .form-section{
        background:#f6f7f8;
        border-radius: 5px;
        padding: 10px;
    }
</style>  
<div class="page-content">
    <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
    <div id="portlet-config" class="modal hide">
        <div class="modal-header">
            <button data-dismiss="modal" class="close" type="button"></button>
            <h3>Widget Settings</h3>
        </div>
        <div class="modal-body"> Widget settings form goes here </div>
    </div>
    <div class="clearfix"></div>
    <div class="content sm-gutter" style="padding-top: 20px;">
        <div class="page-title">
            Manager user
        </div>
        <div class="col-md-6" style="width: 900px">
            <div class="grid simple" style="">
                <div class="grid-title no-border">
                    <h4><span class="semi-bold">User manager</span></h4>
                    <div class="tools"> <a href="javascript:;" class="collapse"></a> <a href="#grid-config" data-toggle="modal" class="config"></a> <a href="javascript:;" class="reload"></a> <a href="javascript:;" class="remove"></a> </div>
                </div>
                <div class="grid-body no-border">
                    <div class="search" style="margin-top: auto">
                        <div class="row">
                            <div class="col-md-10 col-md-offset-1">
                                <div class="form-section">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="serchtile">Name</div>
                                            <input class="form-control" id="frm_search_name">
                                        </div>
                                        <div class="col-md-2">
                                            <div class="serchtile">Status</div>
                                            <select id="frm_search_status" class="form-control">
                                                <option value="">All</option>
                                                <option value="1">Show</option>
                                                <option value="0">Lock</option>
                                            </select>  
                                        </div>
                                        <div class="col-md-2">
                                            <div class="serchtile">Shop</div>
                                            <select id="frm_search_statusShop" class="form-control">
                                                <option value="">All</option>
                                                <option value="1">Yes</option>
                                                <option value="0">No</option>
                                                <option value="2">Lock</option>
                                            </select>  
                                        </div>
                                        <div class="col-md-2">
                                            <br>
                                            <button type="button" id="btnSearch" class="btn btn-default btn-primary">Search</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <form id="form_product" method="post" name="" novalidate="novalidate">
                        <div class="form-actions">  
                            <input type="hidden" id="form_product_id" name="id">
                            <input type="hidden" id="form_product_type" name="type">
                            <input type="hidden" id="form_product_status" name="status">
                            <div class="pull-left">
                                <button type="button" id="btnLockUser" value="" class="btn btn-danger btn-cons"><i class="icon-ok"></i>Lock/unlock User</button>
                                <button type="button" id="btnLockShop" value="" class="btn btn-danger btn-cons"><i class="icon-ok"></i>Lock/unlock Shop</button>
                            </div>
                        </div>
                        <div id="gridProduct" style="margin-top: 40px">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="_footer.jsp" %>
<script src="${adminRoot}/assets/js/jsManageUser.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {

        urlForm = '${adminRoot}';
        manageUser();
    });
</script>