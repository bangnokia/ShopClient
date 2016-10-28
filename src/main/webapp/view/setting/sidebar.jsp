<!-- Left colunm -->
<div class="column col-xs-12 col-sm-3" id="left_column">
    <!-- block category -->
    <div class="block left-module">
        <p class="title_block">Menu</p>
        <div class="block_content">
            <!-- layered -->
            <div class="layered layered-category">
                <div class="layered-content">
                    <ul class="tree-menu">
                        <li><span style="float: left;"></span>
                            <form action="${root}/setting/profile" method="get">
                                <button type="submit" id="ProfileSetting" href="">Profile Setting</a>
                            </form>
                        </li>
                        <li><span style="float: left;"></span>
                            <form action="${root}/product/shop" method="post">
                                <button type="submit" id="ShopManagerBtn" name="abbbbb" value="<%=currentUser.getId()%>">Shop manager</button>
                            </form>
                        </li>
                        <li><span style="float: left;"></span><a href="${root}/product/create">Add new Product</a></li>
                        <li><span style="float: left;"></span><a href="#">Manage Products</a></li>                        
                    </ul>
                </div>
            </div>
            <!-- ./layered -->
        </div>
    </div>
    <!-- ./block category  -->
</div>
<!-- ./left colunm -->