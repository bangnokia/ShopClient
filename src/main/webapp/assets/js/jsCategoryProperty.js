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
        if (!confirm('Are you sure?'))
            return;

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

    var datajsonCate = getDataJson(url);

    bindingcombo('form_categoryproperty_catId', '', datajsonCate, 'id,name');

    var url = urlForm + '/admin/categoryproperty/getlist?1=1';

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

        $.each(datajsonCate, function (index2) {
            var item2 = datajsonCate[index2];
            if (item.catId == item2.id) {
                item.catName = item2.name;
            }
        });

        array.push(item);
    });

    datajson = JSON.parse(JSON.stringify(array));

    var source =
            {
                localdata: datajson,
                datatype: "json",
                datafields: [
                    {name: 'id', type: 'string'},
                    {name: 'catId', type: 'string'},
                    {name: 'catName', type: 'string'},
                    {name: 'statusName', type: 'string'},
                    {name: 'name', type: 'string'},
                    {name: 'status', type: 'string'}
                ],
                id: 'id'
            };
    var dataAdapter = new $.jqx.dataAdapter(source);
    $("#gridBrand").jqxGrid({
        width: 420,
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
            {text: 'id property', datafield: 'id', width: 100, hidden: 'hidden'},
            {text: 'Category', datafield: 'catName', width: 100},
            {text: 'id category', datafield: 'catId', width: 100, hidden: 'hidden'},
            {text: 'Name', datafield: 'name', width: 200},
            {text: 'status', datafield: 'statusName', width: 100},
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

        bindItemDetailGrid(rowData, 'form_categoryproperty');
    });
}
