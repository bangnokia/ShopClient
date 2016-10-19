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
                    <span class="page-heading-title2">Add new product</span>
                </h2>
                <!-- Content page -->
                <div class="content-text clearfix">
                    <div class="box-authentication">
                        <form action="" method="post" class="product-form">
                            <label>Name</label>
                            <input type="text" name="name" class="form-control" />

                            <label>Image</label>
                            <input type="text" name="image" id="product-image" class="form-control" placeholder="Image"/>

                            <label>Price</label>
                            <input type="number" name="price" class="form-control" />

                            <label>Category</label>
                            <input style="width: 50px" type="number" id="categoryId" name="categoryId" class="form-control" />

                            <div class="form-control" id="dropDownButton">
                                <div style="border: none;" id='jqxTreeCategory'>
                                </div>
                            </div>

                            <label>Brand</label>
                            <select class="form-control" name="brandId">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                            </select>

                            <label>Description</label> <br/>
                            <button class="button" type="button" id="description-img-upload">Upload Image</button>
                            <textarea class="form-control" id="product-description"></textarea>


                            <div class="img-preview">
                                <img src="" />
                            </div>
                            <button class="button btn-danger" type="submit"><i class="fa fa-save"></i> Create</button>
                            <button class="button" type="reset"><i class="fa fa-times"></i> Reset</button>
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
<script type="text/javascript" src="//api.filestackapi.com/filestack.js"></script>            
<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>

<%@ include file="../_partial/_footer.jsp" %>

<script>
    function getTreeCate() {
        $("#dropDownButton").jqxDropDownButton({width: 200, height: 25, theme: 'bootstrap'});
        $('#jqxTreeCategory').on('select', function (event) {
            var args = event.args;
            var item = $('#jqxTreeCategory').jqxTree('getItem', args.element);
            var dropDownContent = '<div style="position: relative; margin-left: 3px; margin-top: 5px;">' + item.label + '</div>';
            $("#dropDownButton").jqxDropDownButton('setContent', dropDownContent);
            $('#categoryId').val(item.id);
        });

        var url = '${root}/admin/category/getlistCAT?1=1';

        var datajson = getDataJson(url);

        if (datajson == null)
            return;

        var arr = new Array();
        if (datajson != null) {
            $.each(datajson, function (index) {
                var item = datajson[index];
                var object = new Object();
                object.id = item.id;
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

        $('#jqxTreeCategory').jqxTree({source: records, width: 200, theme: 'bootstrap'});
    }

    tinymce.init({
        selector: 'textarea',
        fontsize_formats: "12pt 26pt 36pt"
    });

    jQuery(document).ready(function () {
        filepicker.setKey("AM7JvJ8MRpa348OF98wKwz");

//        upload product image
        $('#product-image').click(function () {
            filepicker.pick(
                    {
                        mimetype: 'image/*',
                        container: 'window'
                    },
                    function (res) {
                        $('#product-image').val(res.url);
                        $('.img-preview img').attr('src', res.url);
                    }
            );
        });

        //upload for content
        $('#description-img-upload').click(function () {
            filepicker.pick(
                    {
                        mimetype: 'image/*',
                        container: 'window'
                    },
                    function (res) {
                        var img = '<img src="' + res.url + '" />';
                        tinymce.get("product-description").execCommand('mceInsertContent', false, img);
                    },
                    function (FPError) {
                    }
            );
        });

        // tree dropdow 
        getTreeCate();

    });
</script>


