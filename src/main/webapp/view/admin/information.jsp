<%-- 
    Document   : home
    Created on : Sep 19, 2016, 3:35:24 AM
    Author     : daudau
--%>
<%@include file="_header.jsp" %>
<!-- BEGIN CONTAINER -->
<%@include file="_sidebar.jsp" %>
<!-- BEGIN PAGE CONTAINER-->
<style>
    .search {
        margin-top: -25%;
    }
    .search .form-section{
        background:#f6f7f8;
        border-radius: 5px;
        padding: 10px;
    }
</style>  
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
    <div class="content sm-gutter" style="padding-top: 20px;">
        <div class="page-title">
            Information
        </div>
        <div class="col-md-6">
            <div class="grid simple" style="">
                <div class="grid-title no-border">
                    <h4><span class="semi-bold">Information</span></h4>
                </div>
                <div class="grid-body no-border"> <br>
                    <form id="frm_information">
                        <label>Number of user</label>
                        <input id="frm_information_SoLuongUser" name="SoLuongUser" style="width: 70%;" type="text" class="form-control" readonly="readonly" />
                        <label>Number of user register shop</label>
                        <input id="frm_information_SoLuongShop" name="SoLuongShop" style="width: 70%;" type="text" class="form-control" readonly="readonly" />      
                        <label>Number of product</label>
                        <input id="frm_information_SoLuongSanPham" name="SoLuongSanPham" style="width: 70%;" type="text" class="form-control" readonly="readonly" />
                        <label>Number of product Out of stock</label>
                        <input id="frm_information_SoLuongSanPhamHetHang" name="SoLuongSanPhamHetHang" style="width: 70%;" type="text" class="form-control" readonly="readonly" />
                        <label>Number of product browsed</label>
                        <input id="frm_information_SoLuongSanPhamDaDuyet" name="SoLuongSanPhamDaDuyet" style="width: 70%;" type="text" class="form-control" readonly="readonly" />
                        <label>Number of order</label>
                        <input id="frm_information_SoLuongDonHang" name="SoLuongDonHang" style="width: 70%;" type="text" class="form-control" readonly="readonly" />
                        <label>Number of product booked</label>
                        <input id="frm_information_SoLuongSanPhamDonHang" name="SoLuongSanPhamDonHang" style="width: 70%;" type="text" class="form-control" readonly="readonly" />
                        <label>Number of product sold</label>
                        <input id="frm_information_SoLuongSanPhamDaBan" name="SoLuongSanPhamDaBan" style="width: 70%;" type="text" class="form-control" readonly="readonly" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="_footer.jsp" %>
<script type="text/javascript">
    $(document).ready(function () {
        urlForm = '${adminRoot}';

        var url = urlForm + '/Home/information?1=1&shopId=';
        var datajson = getDataJson(url);
        if (datajson != null) {
            bindItemDetail(datajson, 'frm_information');
        }
    });
</script>