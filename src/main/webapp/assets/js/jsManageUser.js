var urlForm;
var id_temp = '';

var jsonUser;
var jsonShop;

var UserID = '';
var ShopID = '';
var statusUser = '';
var statusShop = '';

function manageUser() {
    $('#btnLockUser').bind('click', function () {
        if (UserID == '') {
            alert('Please choise User!');
            return;
        }
        $('#form_product_id').val(UserID);
        $('#form_product_type').val('user');
        $('#form_product_status').val(statusUser);
        do_save_form(urlForm + '/admin/user/manageUser', 'form_product', 'doSuccess();');
    });

    $('#btnLockShop').bind('click', function () {
        if (ShopID == '') {
            alert('Please choise Shop!');
            return;
        }
        $('#form_product_id').val(ShopID);
        $('#form_product_type').val('shop');
        $('#form_product_status').val(statusShop);
        do_save_form(urlForm + '/admin/user/manageUser', 'form_product', 'doSuccess();');
    });

    getlistuser();

    $('#btnSearch').bind('click', function () {
        getlistuser();
    });
}

function doSuccess() {
    getlistuser();
    clear_form('form_product', '');
    var index = $('#gridProduct').jqxGrid('getrowboundindex', 1);
    $('#gridProduct').jqxGrid('unselectrow', index);
}

function getlistuser() {
    var url = urlForm + '/admin/user/getlist?1=1&Text=' + $('#frm_search_name').val();
    jsonUser = getDataJson(url);
    var url = urlForm + '/product/shop/getAll?1=1';
    jsonShop = getDataJson(url);

    if (jsonUser == null)
        return;

    var array = new Array();
    $.each(jsonUser, function (index) {
        var item = jsonUser[index];
        item.shopId = '';
        $.each(jsonShop, function (index) {
            var item1 = jsonShop[index];
            if (item.id == item1.userId) {
                item.shopId = item1.id;
                item.statusShop = item1.status;
                item.nameShop = item1.name;
                item.addressShop = item1.address;
                if (item.statusShop == '0') {
                    item.statusShopName = 'Lock';
                }
            }
        });


        if (item.status == '0') {
            item.statusName = 'Lock';
        }

        if (item.userGroup == '0') {
            item.userGroupName = 'ADMIN';
        }

        if ($('#frm_search_status').val() == '' || $('#frm_search_status').val() == item.status) {
            if ($('#frm_search_statusShop').val() == '') {
                array.push(item);
            } else {
                if ($('#frm_search_statusShop').val() == '1' && item.shopId != '') {
                    array.push(item);
                } else if ($('#frm_search_statusShop').val() == '0' && item.shopId == '') {
                    array.push(item);
                } else if ($('#frm_search_statusShop').val() == '2' && item.statusShop == '0') {
                    array.push(item);
                }
            }
        }
    });

    datajson = JSON.parse(JSON.stringify(array));

    var source =
            {
                localdata: datajson,
                datatype: "json",
                datafields: [
                    {name: 'id', type: 'string'},
                    {name: 'name', type: 'string'},
                    {name: 'username', type: 'string'},
                    {name: 'password', type: 'string'},
                    {name: 'address', type: 'string'},
                    {name: 'phone', type: 'string'},
                    {name: 'email', type: 'string'},
                    {name: 'status', type: 'string'},
                    {name: 'statusName', type: 'string'},
                    {name: 'userGroup', type: 'string'},
                    {name: 'userGroupName', type: 'string'},
                    {name: 'shopId', type: 'string'},
                    {name: 'statusShop', type: 'string'},
                    {name: 'nameShop', type: 'string'},
                    {name: 'addressShop', type: 'string'},
                    {name: 'statusShopName', type: 'string'}


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
            {text: 'id', datafield: 'id', width: 170, hidden: 'hidden'},
            {text: 'Name', datafield: 'name', width: 170},
            {text: 'Address', datafield: 'address', width: 230},
            {text: 'Phone', datafield: 'phone', width: 110},
            {text: 'Email', datafield: 'email', width: 160},
            {text: 'status', datafield: 'status', width: 100, hidden: 'hidden'},
            {text: 'Status', datafield: 'statusName', width: 60},
            {text: 'userGroup', datafield: 'userGroup', width: 100, hidden: 'hidden'},
            {text: 'Group', datafield: 'userGroupName', width: 60},
            {text: 'shopId', datafield: 'shopId', width: 60, hidden: 'hidden'},
            {text: 'statusShop', datafield: 'statusShop', width: 60, hidden: 'hidden'},
            {text: 'Name Shop', datafield: 'nameShop', width: 170},
            {text: 'Adress Shop', datafield: 'addressShop', width: 220},
            {text: 'Status Shop', datafield: 'statusShopName', width: 90}


            // {text: 'Description', datafield: 'description', width: 210, hidden: 'hidden'}
        ]
    });

    $('#gridProduct').unbind('rowselect');
    $('#gridProduct').on('rowselect', function (event)
    {


        var args = event.args;
        var rowBoundIndex = args.rowindex;
        var rowData = args.row;

        UserID = rowData.id;
        statusUser = rowData.status;
        statusShop = rowData.statusShop;
        ShopID = rowData.shopId;

        if (rowData.statusShop == '0') {
            $('#btnLockShop').removeClass('btn-danger');
            $('#btnLockShop').addClass('btn-success');
            $('#btnLockShop').html('Unlock Shop');
        } else {
            $('#btnLockShop').removeClass('btn-success');
            $('#btnLockShop').addClass('btn-danger');
            $('#btnLockShop').html('Lock Shop');
        }

        if (rowData.status == '0') {
            $('#btnLockUser').removeClass('btn-danger');
            $('#btnLockUser').addClass('btn-success');
            $('#btnLockUser').html('Unlock User');
        } else {
            $('#btnLockUser').removeClass('btn-success');
            $('#btnLockUser').addClass('btn-danger');
            $('#btnLockUser').html('Lock User');
        }



//
//        console.log(rowData);
//        $('.img-preview img').attr('src', rowData.image);
//        bindItemDetailGrid(rowData, 'form_product');
//
//        tinymce.get("textarea-description").execCommand('mceSetContent', false, rowData.description);
    });
}
