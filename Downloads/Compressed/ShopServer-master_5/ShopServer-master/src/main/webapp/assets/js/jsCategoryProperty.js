var urlForm;
var id_temp = '';
function categoryproperty() {
    $('#saveForm').bind('click', function () {
        do_save_form(urlForm + '/admin/categoryproperty/save', 'form_categoryproperty', 'getlistcategoryproperty();$("#clearForm").click();');
    });

    $('#clearForm').bind('click', function () {
        clear_form('form_categoryproperty');
    });

    $('#deleteFORM').bind('click', function () {
        if ($('#form_categoryproperty_idCat').val() == '') {
            alert('select categoryproperty to delete');
            return;
        }

        do_delete_form(urlForm + '/admin/categoryproperty/delete?id=' + $('#form_categoryproperty_id').val(), 'getlistcategoryproperty();$("#clearForm").click();');
    });

    getlistcategoryproperty();
}

function bindingItem(id) {
    id_temp = id;
    var url = urlForm + '/admin/categoryproperty/getitemdetail?id=' + id;

    var datajson = getDataJson(url);

    if (datajson == null)
        return;
    else {
        bindItemDetail(datajson, 'form_categoryproperty');
    }
}

function getlistcategoryproperty() {
    var url = urlForm + '/admin/category/getlistCAT?1=1';

    var datajson = getDataJson(url);

    bindingcombo('form_categoryproperty_catId', '', datajson, 'id,name');

    var url = urlForm + '/admin/categoryproperty/getlist?1=1';

    var datajson = getDataJson(url);

    if (datajson == null)
        return;

    var source =
            {
                localdata: datajson,
                datatype: "json",
                datafields: [
                    {name: 'id', type: 'string'},
                    {name: 'catId', type: 'string'},
                    {name: 'name', type: 'string'},
                    {name: 'status', type: 'string'}
                ],
                id: 'id'
            };
    var dataAdapter = new $.jqx.dataAdapter(source);
    $("#gridBrand").jqxGrid({
        width: 500,
        source: dataAdapter,
        pageable: true,
        autoheight: true,
        sortable: true,
        altrows: true,
        enabletooltips: true,
        // editable: true,
        selectionmode: 'singlerow',
        columns: [
            {text: 'id property', datafield: 'id', width: 100},
            {text: 'id category', datafield: 'catId', width: 100},
            {text: 'name', datafield: 'name', width: 200},
            {text: 'status', datafield: 'status', width: 100}
        ]
    });

    $('#gridBrand').unbind('rowselect');
    $('#gridBrand').on('rowselect', function (event)
    {
        var args = event.args;
        var rowBoundIndex = args.rowindex;
        var rowData = args.row;

        console.log(rowData);

        bindItemDetailGrid(rowData, 'form_categoryproperty');
    });
}
