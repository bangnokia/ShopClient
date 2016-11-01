var urlForm;
var id_temp = '';
function category() {
    $('#jqxTreeCategory').on('itemClick', function (event)
    {
        var args = event.args;
        var item = $('#jqxTreeCategory').jqxTree('getItem', args.element);
        var label = item.label;
        var id = item.id;
        var parentid = item.parentId;

        bindingItem(id)
    });

    $('#saveForm').bind('click', function () {
        do_save_form(urlForm + '/admin/category/save', 'form_category', 'getlistCat();$("#clearForm").click();');
    });

    $('#clearForm').bind('click', function () {
        clear_form('form_category');
    });

    $('#deleteFORM').bind('click', function () {
        if (!confirm('Are you sure?'))
            return;
        
        if ($('#form_category_idCat').val() == '') {
            alert('select category to delete');
            return;
        }

        do_delete_form(urlForm + '/admin/category/delete?id=' + $('#form_category_id').val(), 'getlistCat();$("#clearForm").click();');

    });

    getlistCat();
}

function afterUpload(url) {
    $('#form_category_icon').val(url);
    $('#imagerDemo').attr('src', url);
}

function bindingItem(id) {
    id_temp = id;
    var url = urlForm + '/admin/category/getitemdetail?id=' + id;

    var datajson = getDataJson(url);

    if (datajson == null)
        return;
    else {
        bindItemDetail(datajson, 'form_category');
        $('#imagerDemo').attr('src', $('#form_category_icon').val());
    }
}

function getlistCat() {
    var url = urlForm + '/admin/category/getlistCATadmin?1=1';

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

    $('#jqxTreeCategory').jqxTree({source: records, width: '100%', height: '100%'});

    bindingcombo('form_category_parentId', '', datajson, 'id,name');
}
