<%-- 
    Document   : home
    Created on : Sep 19, 2016, 3:35:24 AM
    Author     : daudau
--%>
<%@page import="entity.Category"%>
<%@include file="_header.jsp" %>
<!-- BEGIN CONTAINER -->
<%@include file="_sidebar.jsp" %>
<!-- BEGIN PAGE CONTAINER-->
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
    <div class="content sm-gutter">
        <div class="page-title">
            ADD category
        </div>
        <div class="col-md-6" style="width: 300px">
            <div class="grid simple" style="height: 500px">
                <div id='jqxTreeCategory'>
                </div>
            </div>

        </div>
        <div class="col-md-6">
            <div class="grid simple" style="">
                <div class="grid-title no-border">
                    <h4>Icon <span class="semi-bold">Validation</span></h4>
                    <div class="tools"> <a href="javascript:;" class="collapse"></a> <a href="#grid-config" data-toggle="modal" class="config"></a> <a href="javascript:;" class="reload"></a> <a href="javascript:;" class="remove"></a> </div>
                </div>
                <div class="grid-body no-border"> <br>
                    <form id="form_iconic_validation" action="${adminRoot}/admin/category" method="post" name="" novalidate="novalidate">
                        <div class="form-group">
                            <label class="form-label">idCat</label>
                            <span class="help">e.g. "Jonh Smith"</span>
                            <div class="input-with-icon  right">                                       
                                <i class=""></i>
                                <input type="text" name="idCat" id="idCat" class="form-control">                                 
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">name</label>
                            <span class="help">e.g. "john@examp.com"</span>
                            <div class="input-with-icon  right">                                       
                                <i class=""></i>
                                <input type="text" name="name" id="name" class="form-control">                                 
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">icon</label>
                            <span class="help">e.g. "john@examp.com"</span>
                            <div class="input-with-icon  right">                                       
                                <i class=""></i>
                                <input type="text" name="icon" id="icon" class="form-control">                                 
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">parentID</label>
                            <span class="help">e.g. "http://www.webarc.com"</span>
                            <div class="input-with-icon  right">                                       
                                <i class=""></i>
                                <input type="text" name="parentID" id="parentID" class="form-control">                                 
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Status</label>
                            <span class="help">e.g. "Select one"</span>
                            <div class="input-with-icon  right">                                       
                                <i class=""></i>
                                <select name="status" id="status">
                                    <option value="1">Show</option>
                                    <option value="2">Hide</option>
                                </select>
                            </div>
                        </div>                
                        <div class="form-actions">  
                            <div class="pull-right">
                                <button type="button" class="btn btn-danger btn-cons"><i class="icon-ok"></i>New</button>
                                <button type="submit" class="btn btn-danger btn-cons"><i class="icon-ok"></i>Save</button>
                                <button type="button" class="btn btn-danger btn-cons"><i class="icon-ok"></i>Delete</button>
                                <button type="button" class="btn btn-white btn-cons">Cancel</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="_footer.jsp" %>
<script type="text/javascript">
    $(document).ready(function () {
        var source = [
            {
                icon: "${adminRoot}/assets/admin/assets/img/notification-alert.png", label: "Mail", expanded: true, items: [
                    {icon: "${adminRoot}/assets/admin/assets/img/notification-alert.png", label: "Calendar"},
                    {icon: "${adminRoot}/assets/admin/assets/img/notification-alert.png", label: "Contacts", selected: true}
                ]
            },
            {
                icon: "${adminRoot}/assets/admin/assets/img/notification-alert.png", label: "Inbox", expanded: true, items: [
                    {icon: "${adminRoot}/assets/admin/assets/img/notification-alert.png", label: "Admin"},
                    {icon: "${adminRoot}/assets/admin/assets/img/notification-alert.png", label: "Corporate"},
                    {icon: "${adminRoot}/assets/admin/assets/img/notification-alert.png", label: "Finance"},
                    {icon: "${adminRoot}/assets/admin/assets/img/notification-alert.png", label: "Other"},
                ]
            },
            {icon: "${adminRoot}/assets/admin/assets/img/notification-alert.png", label: "Deleted Items"},
            {icon: "${adminRoot}/assets/admin/assets/img/notification-alert.png", label: "Notes"},
            {iconsize: 14, icon: "${adminRoot}/assets/admin/assets/img/notification-alert.png", label: "Settings"},
            {icon: "${adminRoot}/assets/admin/assets/img/notification-alert.png", label: "Favorites"}
        ];
        $('#jqxTreeCategory').jqxTree({source: source, width: '100%', height: '100%'});

        $('#button123').click(function () {
            $.ajax({
                type: "POST",
                timeout: 30000,
                url: "${adminRoot}/admin/category/delete",
                data: "{ 'name' : '123'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    alert('ok');
                }
            });
        });
    });
</script>