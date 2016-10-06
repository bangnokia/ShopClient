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
                    <form id="form_category" action="${adminRoot}/admin/category/save" method="post" name="" novalidate="novalidate">
                        <div class="form-group">
                            <label class="form-label">idCat</label>
                            <span class="help">id category</span>
                            <div class="input-with-icon  right">                                       
                                <i class=""></i>
                                <input type="text" name="idCat" id="form_category_idCat" disabled="disabled" class="form-control">                                 
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">name</label>
                            <span class="help">Name of category</span>
                            <div class="input-with-icon  right">                                       
                                <i class=""></i>
                                <input type="text" name="name" id="form_category_name" class="form-control">                                 
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">icon</label>
                            <span class="help">name icon "icon.png"</span>
                            <div class="input-with-icon  right">                                       
                                <i class=""></i>
                                <input type="text" name="icon" id="form_category_icon" class="form-control">                                 
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">parentID</label>
                            <span class="help">Parent category</span>
                            <div class="input-with-icon  right">                                       
                                <i class=""></i>
                                <select name="parentId" id="form_category_parentId">
                                    <option value="123">--chon--</option>
                                    <c:forEach items="${listCAT}" var="current1">
                                        <option value="<c:out value="${current1.idCat}" />"><c:out value="${current1.name}" /></option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Status</label>
                            <span class="help">Show / hide</span>
                            <div class="input-with-icon  right">                                       
                                <i class=""></i>
                                <select name="status" id="form_category_status">
                                    <option value="1">Show</option>
                                    <option value="2">Hide</option>
                                </select>
                            </div>
                        </div>                
                        <div class="form-actions">  
                            <div class="pull-right">
                                <button type="button" class="btn btn-white btn-cons"><i class="icon-ok"></i>New</button>
                                <button type="button" id="saveForm" value="" class="btn btn-white btn-cons"><i class="icon-ok"></i>Save</button>
                                <button type="button" id="deleteFORM" value="" class="btn btn-danger btn-cons"><i class="icon-ok"></i>delete</button>
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
        function getlistCat() {
            var url = '${adminRoot}/admin/category/getlistCAT';

            var datajson = getDataJson(url);

            if (datajson == null)
                return;

            var arr = new Array();
            if (datajson != null) {
                $.each(datajson, function (index) {
                    var item = datajson[index];
                    var object = new Object();
                    object.id = item.idCat;
                    object.parentId = item.parentId;
                    object.text = item.name;
                    object.value = item.idCat;
                    arr.push(object);
                });
            }
            datajsonTree = JSON.parse(JSON.stringify(arr));

            var source =
                    {
                        datatype: "json",
                        datafields: [
                            {name: 'id'},
                            {name: 'parentId'},
                            {name: 'text'},
                            {name: 'value'}
                        ],
                        id: 'id',
                        localdata: datajsonTree
                    };
            var dataAdapter = new $.jqx.dataAdapter(source);
            dataAdapter.dataBind();
            var records = dataAdapter.getRecordsHierarchy('id', 'parentId', 'items', [{name: 'text', map: 'label'}]);

            $('#jqxTreeCategory').jqxTree({source: records, width: '100%', height: '100%'});

            bindingcombo('form_category_parentId', '', datajson, 'idCat,name');
        }

        $('#jqxTreeCategory').on('itemClick', function (event)
        {
            var args = event.args;
            var item = $('#jqxTreeCategory').jqxTree('getItem', args.element);
            var label = item.label;
            var id = item.id;
            var parentid = item.parentId;

            var url = '${adminRoot}/admin/category/getitemdetail?catID=' + id;

            var datajson = getDataJson(url);

            if (datajson == null)
                return;
            else {
                bindItemDetail(datajson, 'form_category');
            }
        });

        $('#saveForm').bind('click', function () {
            do_save_form('${adminRoot}/admin/category/save', 'form_category', 'getlistCat();');
        });

        $('#deleteFORM').bind('click', function () {
            if ($('#form_category_idCat').val() == '') {
                alert('select category to delete');
                return;
            }

            $.ajax({
                url: '${adminRoot}/admin/category/delete?idCat=' + $('#form_category_idCat').val(), // Your Servlet mapping or JSP(not suggested)
                //   data: {idCat: },
                type: 'POST',
                //dataType: 'html', // Returns HTML as plain text; included script tags are evaluated when inserted in the DOM.
                success: function (response) {
                    alert('OK');
                    getlistCat();
                    // create an empty div in your page with some id
                },
                error: function (request, textStatus, errorThrown) {
                    alert('faile');
                    getlistCat();
                    alert(errorThrown);
                }
            });
        });

        getlistCat();
    });
</script>