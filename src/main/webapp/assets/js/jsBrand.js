var urlForm;
var id_temp = '';
function brand() {
    $('#saveForm').bind('click', function () {
        do_save_form(urlForm + '/admin/brand/save', 'form_brand', 'getlistbrand();$("#clearForm").click();');
    });

    $('#clearForm').bind('click', function () {
        clear_form('form_brand');
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

    getlistbrand();
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

function getlistbrand() {
    var url = urlForm + '/admin/brand/getlist?1=1';

    var datajson = getDataJson(url);

    if (datajson == null)
        return;

    var array = new Array();
    $.each(datajson, function (index) {
        var item = datajson[index];

        if (item.status == '1') {
            item.statusName = 'Show';
        } else {
            item.statusName = 'Hide';
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
                    {name: 'statusName', type: 'string'},
                    {name: 'status', type: 'string'}
                ],
                id: 'id'
            };
    var dataAdapter = new $.jqx.dataAdapter(source);
    $("#gridBrand").jqxGrid({
        width: 320,
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
            {text: 'id brand', datafield: 'id', width: 100, hidden: 'hidden'},
            {text: 'Name', datafield: 'name', width: 200},
            {text: 'Status', datafield: 'statusName', width: 100},
            {text: 'status', datafield: 'status', width: 100, hidden: 'hidden'}
        ]
    });

    $('#gridBrand').unbind('rowselect');
    $('#gridBrand').on('rowselect', function (event)
    {
        var args = event.args;
        var rowBoundIndex = args.rowindex;
        var rowData = args.row;

        console.log(rowData);

        bindItemDetailGrid(rowData, 'form_brand');
    });
}
