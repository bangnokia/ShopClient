/* global urlForm */
var property;
var shopIdproduct;
var categoryData;
var brandData;
function addproduct() {
    var url = urlForm + '/admin/brand/getlist?1=1';

    brandData = getDataJson(url);
    var url = urlForm + '/product/shop/getlist?1=1&userId=' + $('#dsaccsacsagsagsdwefe').val();
    var datajsonShop = getDataJson(url);

    if (datajsonShop == null) {
        if (confirm("You need to register shop first!")) {
            $('#ShopManagerBtn').click();
        } else {
            $('#ProfileSetting').click();
        }
    } else {
        $('#frm_addproduct_shopId').val(datajsonShop[0].id);
    }
    shopIdproduct = datajsonShop[0].id;
    filepicker.setKey("AM7JvJ8MRpa348OF98wKwz");

//        upload product image
    $('#frm_addproduct_image').click(function () {
        filepicker.pick(
                {
                    mimetype: 'image/*',
                    container: 'window'
                },
                function (res) {
                    $('#frm_addproduct_image').val(res.url);
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
                    tinymce.get("textarea-description").execCommand('mceInsertContent', false, img);
                },
                function (FPError) {
                }
        );
    });

    $('#saveForm').bind('click', function () {
        $('#frm_addproduct_status').val('0');
        var propObj = {};
        $('.prod-prop').each(function (index, item) {
            propObj[$(this).data('name')] = $(this).val();
        });
        $('#frm_addproduct_property').val(JSON.stringify(propObj));

        do_save_form(urlForm + '/product/create/save', 'frm_addproduct', 'doSuccess();');
    });

    $('#clearForm').bind('click', function () {
        clear_form('frm_addproduct', 'shopId');
        tinymce.get("textarea-description").execCommand('mceSetContent', false, '');
    });

    $('#Search').bind('click', function () {
        getlistProduct();
    });

    $('#deleteForm').bind('click', function () {
        if (!confirm('Are you sure?'))
            return;

        if ($('#frm_addproduct_id').val() == '') {
            alert('select product to delete');
            return;
        }
        do_delete_form(urlForm + '/product/create/delete?id=' + $('#frm_addproduct_id').val(), 'doSuccess();');
    });

    var url = urlForm + '/admin/brand/getlist?1=1';
    var datajson = getDataJson(url);
    bindingcombo('frm_addproduct_brandId', '', datajson, 'id,name');
    // tree dropdow 
    getTreeCate();
    getlistProduct();
}

function doSuccess() {
    getlistProduct();
    $("#clearForm").click();
    var index = $('#gridProduct').jqxGrid('getrowboundindex', 1);
    $('#gridProduct').jqxGrid('unselectrow', index);
    $('.img-preview img').attr('src', '');
}

function getCatProp(idcat) {
    var url = urlForm + '/category/getCatProp?1=1&idcat=' + idcat;
    var datajsonShop = getDataJson(url);
    $('#prop-list').html('');
    var html = '';
    $.each(datajsonShop, function (index, item) {
        if (item.status != '2') {
            html += '<label>' + item.name + '</label>';
            html += '<input data-name="' + item.name + '" type="text" name="prop_' + item.id + '" class="form-control prod-prop"  />';
        }
    });
    $('#prop-list').append(html); //apend new value

//    $.ajax({
//        url: urlForm + '/category/getCatProp/' + idcat,
//        type: 'GET',
//        dataType: 'json',
//        success: function (res) {
////                console.log(res);
//            $('#prop-list').html(''); //reload;
//            var html = '';
//            $.each(res, function (index, item) {
//                html += '<label>' + item.name + '</label>';
//                html += '<input data-name="' + item.name + '" type="text" name="prop_' + item.id + '" class="form-control prod-prop"  />';
//            });
//            $('#prop-list').append(html); //apend new value
//        }
//    });
}

function getTreeCate() {
    $("#dropDownButton").jqxDropDownButton({width: 230, height: 20, theme: 'bootstrap'});
    $('#jqxTreeCategory').on('select', function (event) {
        var args = event.args;
        var item = $('#jqxTreeCategory').jqxTree('getItem', args.element);
        var dropDownContent = '<div style="position: relative; margin-left: 3px; margin-top: 5px;">' + item.label + '</div>';
        $("#dropDownButton").jqxDropDownButton('setContent', dropDownContent);
        $('#frm_addproduct_categoryId').val(item.id);

        getCatProp(item.id);
    });

    var url = urlForm + '/admin/category/getlistCAT?1=1';

    categoryData = getDataJson(url);

    if (categoryData == null)
        return;

    var arr = new Array();
    if (categoryData != null) {
        $.each(categoryData, function (index) {
            var item = categoryData[index];
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

function getlistProduct() {
    var url = urlForm + '/product/create/getlist?1=1&outofstock=2&Text=' + $('#searchvalue').val() + '&Price=&category=&status=&shopId=' + shopIdproduct;
    var datajson = getDataJson(url);

    if (datajson == null)
        return;

    var array = new Array();
    $.each(datajson, function (index) {
        var item = datajson[index];

        $.each(categoryData, function (index1) {
            var item1 = categoryData[index1];
            if (item.categoryId == item1.id) {
                item.cateName = item1.name;
            }
        });

        $.each(brandData, function (index2) {
            var item2 = brandData[index2];
            if (item.brandId == item2.id) {
                item.brandName = item2.name;
            }
        });

        if (item.status == '1') {
            item.statusName = 'Approved';
        } else {
            item.statusName = 'Pending';
        }

        if (item.outOfStock) {
            item.outOfStock = '0';
            item.outOfStockName = 'YES';
        } else {
            item.outOfStock = '1';
            item.outOfStockName = 'NO';
        }

        array.push(item);
    });

    datajson = JSON.parse(JSON.stringify(array));

    var source =
            {
                localdata: datajson,
                datatype: "json",
                datafields: [
                    {name: 'id', type: 'string'},
                    {name: 'name', type: 'string'},
                    {name: 'price', type: 'string'},
                    {name: 'createdAt', type: 'string'},
                    {name: 'brandId', type: 'string'},
                    {name: 'brandName', type: 'string'},
                    {name: 'status', type: 'string'},
                    {name: 'statusName', type: 'string'},
                    {name: 'outOfStock', type: 'string'},
                    {name: 'outOfStockName', type: 'string'},
                    {name: 'categoryId', type: 'string'},
                    {name: 'cateName', type: 'string'},
                    {name: 'image', type: 'string'},
                    {name: 'shopId', type: 'string'},
                    {name: 'property', type: 'string'},
                    {name: 'description', type: 'string'}
                ],
                id: 'id'
            };
    var dataAdapter = new $.jqx.dataAdapter(source);
    $("#gridProduct").jqxGrid({
        width: '100%',
        source: dataAdapter,
        pageable: true,
        autoheight: true,
        sortable: true,
        altrows: true,
        showfilterrow: true,
        theme: 'bootstrap',
        filterable: true,
        enabletooltips: true,
        // editable: true,
        selectionmode: 'singlerow',
        columns: [
            {text: 'shopId', datafield: 'shopId', width: 70, hidden: 'hidden'},
            {text: 'Name', datafield: 'name', width: 220},
            {text: 'Price', filtertype: 'number', datafield: 'price', width: 100},
            {text: 'Date Create', filtertype: 'date', datafield: 'createdAt', width: 170},
            {text: 'Brand', datafield: 'brandId', width: 70, hidden: 'hidden'},
            {text: 'Brand', datafield: 'brandName', width: 70},
            {text: 'Out of stock', datafield: 'outOfStock', width: 70, hidden: 'hidden'},
            {text: 'Out of stock', datafield: 'outOfStockName', width: 70},
            {text: 'Status', datafield: 'status', width: 120, hidden: 'hidden'},
            {text: 'Status', datafield: 'statusName', width: 80},
            {text: 'Category', datafield: 'categoryId', width: 70, hidden: 'hidden'},
            {text: 'Category', datafield: 'cateName', width: 80},
            {text: 'Image', datafield: 'image', width: 125, hidden: 'hidden'},
            {text: 'id', datafield: 'id', width: 100, hidden: 'hidden'},
            {text: 'Property', datafield: 'property', width: 100, hidden: 'hidden'},
            {text: 'Description', datafield: 'description', width: 100, hidden: 'hidden'}
        ]
    });

    $('#gridProduct').unbind('rowselect');
    $('#gridProduct').on('rowselect', function (event)
    {
        var args = event.args;
        var rowBoundIndex = args.rowindex;
        var rowData = args.row;

        bindItemDetailGrid(rowData, 'frm_addproduct');
        $('#frm_addproduct_shopId').val(shopIdproduct);
        getCatProp(rowData.categoryId);

        $('#dropDownButton').jqxDropDownButton('setContent', rowData.cateName);

        if (rowData.property != null && rowData.property != '') {
            property = JSON.parse(rowData.property);

            $('#prop-list').find(':input').each(function (index) {
                var name = $(this).attr('data-name');
                $(this).val(eval('property["' + name + '"]'));
            });
        }

        tinymce.get("textarea-description").execCommand('mceSetContent', false, rowData.description);

        $('.img-preview img').attr('src', rowData.image);
    });
}