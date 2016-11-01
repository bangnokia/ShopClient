var urlForm;
var id_temp = '';
function product() {
    $('#saveForm').bind('click', function () {
        do_save_form(urlForm + '/admin/brand/save', 'form_brand', 'getlistbrand();$("#clearForm").click();');
    });

    $('#deleteFORM').bind('click', function () {
        if (!confirm('Are you sure?'))
            return;

        if ($('#form_brand_idCat').val() == '') {
            alert('select brand to delete');
            return;
        }

        do_delete_form(urlForm + '/admin/brand/delete?id=' + $('#form_brand_id').val(), 'getlistbrand();$("#clearForm").click();');
    });

    getlistproduct();
}

function bindingItem(id) {
    id_temp = id;
    var url = urlForm + '/admin/brand/getitemdetail?id=' + id;

    var datajson = getDataJson(url);

    if (datajson == null)
        return;
    else {
        bindItemDetail(datajson, 'form_brand');
    }
}

function getlistproduct() {
    var url = urlForm + '/product/create/getlist?1=1&Text=&Price=&category=&status=&shopId=';
    var datajson = getDataJson(url);

    if (datajson == null)
        return;

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
                    {name: 'status', type: 'string'},
                    {name: 'categoryId', type: 'string'},
                    {name: 'image', type: 'string'},
                    {name: 'shopId', type: 'string'},
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
        enabletooltips: true,
        // editable: true,
        selectionmode: 'singlerow',
        columns: [
            {text: 'shopId', datafield: 'shopId', width: 70, hidden: 'hidden'},
            {text: 'name', datafield: 'name', width: 150},
            {text: 'price', filtertype: 'number', datafield: 'price', width: 100},
            {text: 'createdAt', filtertype: 'date', datafield: 'createdAt', width: 150},
            {text: 'brandId', datafield: 'brandId', width: 70},
            {text: 'status', datafield: 'status', width: 70},
            {text: 'categoryId', datafield: 'categoryId', width: 70},
            {text: 'image', datafield: 'image', width: 200},
            {text: 'id', datafield: 'id', width: 100, hidden: 'hidden'},
            {text: 'description', datafield: 'description', width: 100, hidden: 'hidden'}
        ]
    });

    $('#gridProduct').unbind('rowselect');
    $('#gridProduct').on('rowselect', function (event)
    {
        var args = event.args;
        var rowBoundIndex = args.rowindex;
        var rowData = args.row;

        console.log(rowData);
        bindItemDetailGrid(rowData, 'frm_addproduct');
        $('#frm_addproduct_shopId').val(shopIdproduct);

        tinymce.get("textarea-description").execCommand('mceSetContent', false, rowData.description);

        $('.img-preview img').attr('src', rowData.image);
    });
}
