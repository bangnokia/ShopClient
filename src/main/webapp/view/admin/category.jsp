<%-- 
    Document   : home
    Created on : Sep 19, 2016, 3:35:24 AM
    Author     : daudau
--%>
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
        <div class="row">
            <div class="col-md-12">
                <div class="grid simple ">
                    <div class="grid-title no-border">
                        <h4>Table  <span class="semi-bold">Styles</span></h4>
                        <div class="tools">	<a href="javascript:;" class="collapse"></a>
                            <a href="#grid-config" data-toggle="modal" class="config"></a>
                            <a href="javascript:;" class="reload"></a>
                            <a href="javascript:;" class="remove"></a>
                        </div>
                    </div>
                    <div class="grid-body no-border">
                        <form action="${adminRoot}/admin/category/getlistCAT" method="post">
                            <input type="hidden" id="url" name="url" value="/admin/category/">
                            <h3>Basic  <span class="semi-bold">Table</span></h3>
                            <div class="form-group">
                                <label class="form-label">Text</label>
                                <span class="help">name....</span>
                                <div class="input-with-icon  right">                                       
                                    <i class=""></i>
                                    <input type="text" name="text" id="text" style="width: 200px; float: left" class="form-control"> 
                                    <button type="submit" class="btn btn-danger btn-cons" style="float: left"><i class="icon-ok"></i>Search</button>
                                </div>   
                            </div>
                        </form>
                        <table class="table table-hover no-more-tables">
                            <thead>
                                <tr>
                                    <th>id cat</th>
                                    <th>parent id</th>
                                    <th>name</th>
                                    <th>icon</th>
                                    <th>status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listCAT}" var="current">
                                    <tr>
                                        <td><c:out value="${current.idCat}" /></td>
                                        <td><c:out value="${current.parentId}" /></td>
                                        <td><c:out value="${current.name}" /></td>
                                        <td><c:out value="${current.icon}" /></td>
                                        <td><c:out value="${current.status}" /></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div id='jqxWidget'>
                        </div>
                    </div>
                </div>
            </div>
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
                    <form id="form_iconic_validation" action="${adminRoot}/admin/category/save" method="post" name="" novalidate="novalidate">
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
                                <select name="parentID" id="parentID">
                                    <option value="123">--chon--</option>
                                    <c:forEach items="${listCAT}" var="current1">
                                        <option value="<c:out value="${current1.idCat}" />"><c:out value="${current1.name}" /></option>
                                    </c:forEach>
                                </select>
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
                                <button type="submit" value="" class="btn btn-danger btn-cons"><i class="icon-ok"></i>Save</button>
                                <button type="button" id="deleteFORM" value="" class="btn btn-white btn-cons"><i class="icon-ok"></i>delete</button>
                                <a href="${adminRoot}/admin/category/delete/123" class="btn btn-danger btn-cons"><i class="icon-ok"></i>Delete</a>
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

        var data = [
    <c:forEach items="${listCAT}" var="categoryTree">

            {"id": ${categoryTree.idCat},
                "parentid": ${categoryTree.parentId},
                "text": "${categoryTree.name}",
                "value"
                        : "${categoryTree.name}"
            },
    </c:forEach>
        ];
        // data = eval(data);
        var source =
                {
                    datatype: "json",
                    datafields: [
                        {name: 'id'},
                        {name: 'parentid'},
                        {name: 'text'},
                        {name: 'value'}
                    ],
                    id: 'id',
                    localdata: data
                };
        var dataAdapter = new $.jqx.dataAdapter(source);
        dataAdapter.dataBind();
        var records = dataAdapter.getRecordsHierarchy('id', 'parentid', 'items', [{name: 'text', map: 'label'}]);
        $('#jqxWidget').jqxTree({source: records, width: '300px'});

        $('#jqxTreeCategory').jqxTree({source: source, width: '100%', height: '100%'});

        $('.dddddddf').bind('click', function () {
            alert($(this).html());
        });

        function ganabc(ssssss) {
            alert(ssssss);
        }
        $('#deleteFORM').bind('click', function () {
            $.ajax({
                url: '${adminRoot}/admin/category/delete/', // Your Servlet mapping or JSP(not suggested)
                data: {id: 12},
                type: 'POST',
                //dataType: 'html', // Returns HTML as plain text; included script tags are evaluated when inserted in the DOM.
                success: function (response) {
                    alert('OK');
                    // create an empty div in your page with some id
                },
                error: function (request, textStatus, errorThrown) {
                    alert('faile');
                  //  alert(errorThrown);
                }
            });
        });
    });
</script>