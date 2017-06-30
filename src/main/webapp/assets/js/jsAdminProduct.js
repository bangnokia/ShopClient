var urlForm;
var id_temp = '';
var categoryData;
var brandData;
var jsonShop;
function product() {
    var url = urlForm + '/admin/brand/getlist?1=1';
    brandData = getDataJson(url);
    var url = urlForm + '/admin/category/getlistCAT?1=1';
    categoryData = getDataJson(url);
    var url = urlForm + '/product/shop/getAll?1=1';
    jsonShop = getDataJson(url);

    $('#saveForm').bind('click', function () {
        $('#form_product_status').val('1');
        do_save_form(urlForm + '/product/create/save', 'form_product', 'doSuccess();');
    });

    $('#hideForm').bind('click', function () {
        $('#form_product_status').val('0');
        do_save_form(urlForm + '/product/create/save', 'form_product', 'doSuccess();');
    });

    $('#deleteFORM').bind('click', function () {
        if (!confirm('Are you sure?'))
            return;

        if ($('#form_product_id').val() == '') {
            alert('select product to delete');
            return;
        }

        do_delete_form(urlForm + '/product/create/delete?id=' + $('#form_product_id').val(), 'doSuccess();');
    });

    getlistproduct();

    $('#btnSearch').bind('click', function () {
        getlistproduct();
    });
}

function doSuccess() {
    getlistproduct();
    clear_form('form_product', 'shopId');
    tinymce.get("textarea-description").execCommand('mceSetContent', false, '');
    //$("#clearForm").click();
    var index = $('#gridProduct').jqxGrid('getrowboundindex', 1);
    $('#gridProduct').jqxGrid('unselectrow', index);
    $('.img-preview img').attr('src', '');
}

function getlistproduct() {
    var url = urlForm + '/product/create/getlist?1=1&outofstock=2&Text=' + $('#frm_search_name').val() + '&Price=&category=&status=' + $('#frm_search_status').val() + '&shopId=';
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

        $.each(jsonShop, function (index) {
            var item3 = jsonShop[index];
            if (item.shopId == item3.id) {
                item.shopStatus = item3.status;
                item.shopName = item3.name;
                if (item.shopStatus == '0') {
                    item.shopStatusName = 'Lock';
                }
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
                    {name: 'categoryId', type: 'string'},
                    {name: 'cateName', type: 'string'},
                    {name: 'property', type: 'string'},
                    {name: 'image', type: 'string'},
                    {name: 'outOfStock', type: 'string'},
                    {name: 'outOfStockName', type: 'string'},
                    {name: 'shopId', type: 'string'},
                    {name: 'shopName', type: 'string'},
                    {name: 'shopStatus', type: 'string'},
                    {name: 'shopStatusName', type: 'string'},
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
            {text: 'Shop status', datafield: 'shopStatus', width: 70, hidden: 'hidden'},
            {text: 'Shop name', datafield: 'shopName', width: 170},
            {text: 'Shop status', datafield: 'shopStatusName', width: 100},
            {text: 'Name', datafield: 'name', width: 170},
            {text: 'Price', filtertype: 'number', datafield: 'price', width: 100},
            {text: 'Date create', filtertype: 'date', datafield: 'createdAt', width: 150},
            {text: 'Brand', datafield: 'brandId', width: 70, hidden: 'hidden'},
            {text: 'Brand', datafield: 'brandName', width: 100},
            {text: 'Status', datafield: 'status', width: 70, hidden: 'hidden'},
            {text: 'Status', datafield: 'statusName', width: 100},
            {text: 'Category', datafield: 'categoryId', width: 70, hidden: 'hidden'},
            {text: 'Category', datafield: 'cateName', width: 100},
            {text: 'Out of stock', datafield: 'outOfStock', width: 100, hidden: 'hidden'},
            {text: 'Out of stock', datafield: 'outOfStockName', width: 100},
            {text: 'Image', datafield: 'image', width: 200, hidden: 'hidden'},
            {text: 'Property', datafield: 'property', width: 100, hidden: 'hidden'},
            {text: 'id', datafield: 'id', width: 100, hidden: 'hidden'},
            {text: 'Description', datafield: 'description', width: 210, hidden: 'hidden'}
        ]
    });

    $('#gridProduct').unbind('rowselect');
    $('#gridProduct').on('rowselect', function (event)
    {
        var args = event.args;
        var rowBoundIndex = args.rowindex;
        var rowData = args.row;

        console.log(rowData);
        $('.img-preview img').attr('src', rowData.image);
        bindItemDetailGrid(rowData, 'form_product');

        tinymce.get("textarea-description").execCommand('mceSetContent', false, rowData.description);
    });
}
