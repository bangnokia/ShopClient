<%-- 
    Document   : product_detail
    Created on : Oct 29, 2016, 5:23:42 AM
    Author     : daudau
--%>
<jsp:include page="_partial/_header.jsp" />
<style>
    .wrap {
        position: fixed;
        width: 300px;
        height: 400px;
        z-index: 9999999;
        right: 0px;
        bottom: 0px;
    }
    .x {
        font-family: arial, helvetica;
        background: rgba(78, 86, 101, 0.8) none repeat scroll 0 0;
        font-size: 14px;
        font-weight: bold;
        color: #fff;
        display: inline-block;
        height: 25px;
        line-height: 25px;
        position: absolute;
        right: 0;
        text-align: center;
        top: -19px;
        width: 25px;
        z-index: 99999999;
    }
    .x:hover {
        cursor: pointer;
    }
    .pxem {
        text-align: left;
        height: 20px;
        margin-bottom: 0;
        margin-top: 0;
        background: #34495E;
        width: 100%;
        bottom: 0;
        display: block;
        left: 0px;
        position: absolute;
        z-index: 999999999;
        border-left: 1px solid #fff;
    }
    .pxem a.axem {
        color: #fff;
        font-family: arial, helvetica;
        font-size: 12px;
        line-height: 23px;
        padding-left: 5px;
        text-decoration: none;
    }
    .pxem a.axem:hover {
        text-decoration: underline;
    }
    .alogo {
        position: absolute;
        bottom: 0;
        right: 0px;
        z-index: 999999999999;
        width: 75px;
        height: 20px;
        display: inline-block;
        background: #34495E;
        border-left: 2px solid #2c3e50;
        padding-right: 0px;
        padding-left: 5px
    }
    .vnk-tuvan {
        position: fixed;
        width: 300px;
        background: #0075FF;
        z-index: 99999999;
        right: 0px;
        bottom: 0px;
        border-style: solid solid none;
        border-color: #2c3e50;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }
    .vnk-tuvan p {
        color: #fff;
        font-size: 15px;
        margin: 0;
        padding: 0 13px;
        text-align: left;
    }
    .vnk-tuvan p a {
        color: #fff;
        font-size: 15px;
        padding: 5px 0px 7px;
        margin: 0;
        display: inline-block;
        font-family: arial, helvetica;
        text-decoration: none;
    }
    .vnk-tuvan p a:hover {
        text-decoration: underline;
        cursor: pointer;
    }
    .vnk-tuvan p img {
        float: right;
        margin-top: 10px;
    }
</style>
<div class="columns-container">
    <input type="hidden" id="idProductDetail" value="${id}" >
    <div class="container" id="columns">
        <!-- breadcrumb -->
        <div class="breadcrumb clearfix" id="link-product">
            <!--
            <a class="home" href="#" title="Return to Home">Home</a>
            <span class="navigation-pipe">&nbsp;</span>
            <a href="#" title="Return to Home">Fashion</a>
            <span class="navigation-pipe">&nbsp;</span>
            <span class="navigation_page">Maecenas consequat mauris</span>
            -->
        </div>
        <!-- ./breadcrumb -->
        <!-- row -->
        <div class="row">
            <!-- Left colunm -->
            <div class="column col-xs-12 col-sm-3" id="left_column">
                <!-- block best sellers -->
                <div class="block left-module" id="new-product-left">
                </div>
                <!--./left silde-->
            </div>
            <!-- ./left colunm -->
            <!-- Center colunm-->
            <div class="center_column col-xs-12 col-sm-9" id="center_column">
                <!-- Product -->
                <div id="product">
                    <div class="primary-box row">
                        <div class="pb-left-column col-xs-12 col-sm-6">
                            <!-- product-imge-->
                            <div class="product-image" id="product-imageDetail">
                                <!--
                                <div class="product-full">
                                    <img id="product-zoom" src='assets/data/product-s3-420x512.jpg' data-zoom-image="assets/data/product-s3-850x1036.jpg"/>
                                </div>
                                <div class="product-img-thumb" id="gallery_01">
                                    <ul class="owl-carousel" data-items="3" data-nav="true" data-dots="false" data-margin="20" data-loop="true">
                                        <li>
                                            <a href="#" data-image="assets/data/product-s3-420x512.jpg" data-zoom-image="assets/data/product-s3-850x1036.jpg">
                                                <img id="product-zoom"  src="assets/data/product-s3-100x122.jpg" /> 
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" data-image="assets/data/product-s2-420x512.jpg" data-zoom-image="assets/data/product-s2-850x1036.jpg">
                                                <img id="product-zoom"  src="assets/data/product-s2-100x122.jpg" /> 
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" data-image="assets/data/product-420x512.jpg" data-zoom-image="assets/data/product-850x1036.jpg">
                                                <img id="product-zoom"  src="assets/data/product-100x122.jpg" /> 
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" data-image="assets/data/product-s4-420x512.jpg" data-zoom-image="assets/data/product-s4-850x1036.jpg">
                                                <img id="product-zoom"  src="assets/data/product-s4-100x122.jpg" /> 
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" data-image="assets/data/product-s5-420x512.jpg" data-zoom-image="assets/data/product-s5-850x1036.jpg">
                                                <img id="product-zoom"  src="assets/data/product-s5-100x122.jpg" /> 
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" data-image="assets/data/product-s6-420x512.jpg" data-zoom-image="assets/data/product-s6-850x1036.jpg">
                                                <img id="product-zoom"  src="assets/data/product-s6-100x122.jpg" /> 
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                -->
                            </div>
                            <!-- product-imge-->
                        </div>
                        <div class="pb-right-column col-xs-12 col-sm-6" id="product_detai">
                            <!--
                            <h1 class="product-name">Maecenas consequat mauris</h1>
                            <div class="product-comments">
                                <div class="product-star">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-half-o"></i>
                                </div>
                                <div class="comments-advices">
                                    <a href="#">Based  on 3 ratings</a>
                                    <a href="#"><i class="fa fa-pencil"></i> write a review</a>
                                </div>
                            </div>
                            <div class="product-price-group">
                                <span class="price">$38.95</span>
                                <span class="old-price">$52.00</span>
                                <span class="discount">-30%</span>
                            </div>
                            <div class="info-orther">
                                <p>Item Code: #453217907</p>
                                <p>Availability: <span class="in-stock">In stock</span></p>
                                <p>Condition: New</p>
                            </div>
                            <div class="product-desc">
                                Vestibulum eu odio. Suspendisse potenti. Morbi mollis tellus ac sapien. Praesent egestas tristique nibh. Nullam dictum felis eu pede mollis pretium.Fusce egestas elit eget lorem. 
                            </div>
                            <div class="form-option">
                                <p class="form-option-title">Available Options:</p>
                                <div class="attributes">
                                    <div class="attribute-label">Color:</div>
                                    <div class="attribute-list">
                                        <ul class="list-color">
                                            <li style="background:#0c3b90;"><a href="#">red</a></li>
                                            <li style="background:#036c5d;" class="active"><a href="#">red</a></li>
                                            <li style="background:#5f2363;"><a href="#">red</a></li>
                                            <li style="background:#ffc000;"><a href="#">red</a></li>
                                            <li style="background:#36a93c;"><a href="#">red</a></li>
                                            <li style="background:#ff0000;"><a href="#">red</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="attributes">
                                    <div class="attribute-label">Qty:</div>
                                    <div class="attribute-list product-qty">
                                        <div class="qty">
                                            <input id="option-product-qty" type="text" value="1">
                                        </div>
                                        <div class="btn-plus">
                                            <a href="#" class="btn-plus-up">
                                                <i class="fa fa-caret-up"></i>
                                            </a>
                                            <a href="#" class="btn-plus-down">
                                                <i class="fa fa-caret-down"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="attributes">
                                    <div class="attribute-label">Size:</div>
                                    <div class="attribute-list">
                                        <select>
                                            <option value="1">X</option>
                                            <option value="2">XL</option>
                                            <option value="3">XXL</option>
                                        </select>
                                        <a id="size_chart" class="fancybox" href="assets/data/size-chart.jpg">Size Chart</a>
                                    </div>

                                </div>
                            </div>
                            <div class="form-action">
                                <div class="button-group">
                                    <a class="btn-add-cart" href="#">Add to cart</a>
                                </div>
                                <div class="button-group">
                                    <a class="wishlist" href="#"><i class="fa fa-heart-o"></i>
                                        <br>Wishlist</a>
                                    <a class="compare" href="#"><i class="fa fa-signal"></i>
                                        <br>        
                                        Compare</a>
                                </div>
                            </div>
                            <div class="form-share">
                                <div class="sendtofriend-print">
                                    <a href="javascript:print();"><i class="fa fa-print"></i> Print</a>
                                    <a href="#"><i class="fa fa-envelope-o fa-fw"></i>Send to a friend</a>
                                </div>
                                <div class="network-share">
                                </div>
                            </div>
                            -->
                        </div>
                    </div>
                    <!-- tab product -->
                    <div class="product-tab">
                        <ul class="nav-tab">
                            <li class="active">
                                <a aria-expanded="false" data-toggle="tab" href="#product-detail">Product Details</a>
                            </li>
                            <li>
                                <a aria-expanded="true" data-toggle="tab" href="#information">information</a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#reviews">reviews</a>
                            </li>
                        </ul>
                        <div class="tab-container">
                            <div id="product-detail" class="tab-panel active">

                            </div>
                            <div id="information"  class="tab-panel">
                                <table class="table table-bordered" id="informationTable">
                                    <!--
                               <tr>
                                   <td width="200">Compositions</td>
                                   <td>Cotton</td>
                               </tr>
                               <tr>
                                   <td>Styles</td>
                                   <td>Girly</td>
                               </tr>
                               <tr>
                                   <td>Properties</td>
                                   <td>Colorful Dress</td>
                               </tr>-->
                                </table>
                            </div>

                            <div id="reviews" class="tab-panel">
                                <div class="product-comments-block-tab" id="reviews-product">
                                    <!--
                                    <div class="comment row">
                                        <div class="col-sm-3 author">
                                            <div class="grade">
                                                <span>Grade</span>
                                                <span class="reviewRating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </span>
                                            </div>
                                            <div class="info-author">
                                                <span><strong>Jame</strong></span>
                                                <em>04/08/2015</em>
                                            </div>
                                        </div>
                                        <div class="col-sm-9 commnet-dettail">
                                            Phasellus accumsan cursus velit. Pellentesque egestas, neque sit amet convallis pulvinar
                                        </div>
                                    </div>
                                    <div class="comment row">
                                        <div class="col-sm-3 author">
                                            <div class="grade">
                                                <span>Grade</span>
                                                <span class="reviewRating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </span>
                                            </div>
                                            <div class="info-author">
                                                <span><strong>Author</strong></span>
                                                <em>04/08/2015</em>
                                            </div>
                                        </div>
                                        <div class="col-sm-9 commnet-dettail">
                                            Phasellus accumsan cursus velit. Pellentesque egestas, neque sit amet convallis pulvinar
                                        </div>
                                    </div>
                                    
                                    <p>
                                        <a class="btn-comment" href="#">Write your review !</a>
                                    </p>-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ./tab product -->
                    <!-- box product -->
                    <div class="page-product-box" id="Related-Products">
                        <h3 class="heading">Related Products</h3>
                        <ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav = "true" data-margin = "30" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":3}}'>
                            <!--
                             <li>
                                 <div class="product-container">
                                     <div class="left-block">
                                         <a href="#">
                                             <img class="img-responsive" alt="product" src="assets/data/p40.jpg" />
                                         </a>
                                         <div class="quick-view">
                                             <a title="Add to my wishlist" class="heart" href="#"></a>
                                             <a title="Add to compare" class="compare" href="#"></a>
                                             <a title="Quick view" class="search" href="#"></a>
                                         </div>
                                         <div class="add-to-cart">
                                             <a title="Add to Cart" href="#add">Add to Cart</a>
                                         </div>
                                     </div>
                                     <div class="right-block">
                                         <h5 class="product-name"><a href="#">Maecenas consequat mauris</a></h5>
                                         <div class="product-star">
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star-half-o"></i>
                                         </div>
                                         <div class="content_price">
                                             <span class="price product-price">$38,95</span>
                                             <span class="price old-price">$52,00</span>
                                         </div>
                                     </div>
                                 </div>
                             </li>
                             <li>
                                 <div class="product-container">
                                     <div class="left-block">
                                         <a href="#">
                                             <img class="img-responsive" alt="product" src="assets/data/p35.jpg" />
                                         </a>
                                         <div class="quick-view">
                                             <a title="Add to my wishlist" class="heart" href="#"></a>
                                             <a title="Add to compare" class="compare" href="#"></a>
                                             <a title="Quick view" class="search" href="#"></a>
                                         </div>
                                         <div class="add-to-cart">
                                             <a title="Add to Cart" href="#add">Add to Cart</a>
                                         </div>
                                     </div>
                                     <div class="right-block">
                                         <h5 class="product-name"><a href="#">Maecenas consequat mauris</a></h5>
                                         <div class="product-star">
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star-half-o"></i>
                                         </div>
                                         <div class="content_price">
                                             <span class="price product-price">$38,95</span>
                                             <span class="price old-price">$52,00</span>
                                         </div>
                                     </div>
                                 </div>
                             </li>
                             <li>
                                 <div class="product-container">
                                     <div class="left-block">
                                         <a href="#">
                                             <img class="img-responsive" alt="product" src="assets/data/p37.jpg" />
                                         </a>
                                         <div class="quick-view">
                                             <a title="Add to my wishlist" class="heart" href="#"></a>
                                             <a title="Add to compare" class="compare" href="#"></a>
                                             <a title="Quick view" class="search" href="#"></a>
                                         </div>
                                         <div class="add-to-cart">
                                             <a title="Add to Cart" href="#add">Add to Cart</a>
                                         </div>
                                     </div>
                                     <div class="right-block">
                                         <h5 class="product-name"><a href="#">Maecenas consequat mauris</a></h5>
                                         <div class="product-star">
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star-half-o"></i>
                                         </div>
                                         <div class="content_price">
                                             <span class="price product-price">$38,95</span>
                                             <span class="price old-price">$52,00</span>
                                         </div>
                                     </div>
                                 </div>
                             </li>
                             <li>
                                 <div class="product-container">
                                     <div class="left-block">
                                         <a href="#">
                                             <img class="img-responsive" alt="product" src="assets/data/p39.jpg" />
                                         </a>
                                         <div class="quick-view">
                                             <a title="Add to my wishlist" class="heart" href="#"></a>
                                             <a title="Add to compare" class="compare" href="#"></a>
                                             <a title="Quick view" class="search" href="#"></a>
                                         </div>
                                         <div class="add-to-cart">
                                             <a title="Add to Cart" href="#add">Add to Cart</a>
                                         </div>
                                     </div>
                                     <div class="right-block">
                                         <h5 class="product-name"><a href="#">Maecenas consequat mauris</a></h5>
                                         <div class="product-star">
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star-half-o"></i>
                                         </div>
                                         <div class="content_price">
                                             <span class="price product-price">$38,95</span>
                                             <span class="price old-price">$52,00</span>
                                         </div>
                                     </div>
                                 </div>
                             </li>
                            -->
                        </ul>
                    </div>
                    <!-- ./box product -->
                    <!-- box product
                    <div class="page-product-box">
                        <h3 class="heading">You might also like</h3>
                        <ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav = "true" data-margin = "30" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":3}}'>
                            <li>
                                <div class="product-container">
                                    <div class="left-block">
                                        <a href="#">
                                            <img class="img-responsive" alt="product" src="assets/data/p97.jpg" />
                                        </a>
                                        <div class="quick-view">
                                            <a title="Add to my wishlist" class="heart" href="#"></a>
                                            <a title="Add to compare" class="compare" href="#"></a>
                                            <a title="Quick view" class="search" href="#"></a>
                                        </div>
                                        <div class="add-to-cart">
                                            <a title="Add to Cart" href="#add">Add to Cart</a>
                                        </div>
                                    </div>
                                    <div class="right-block">
                                        <h5 class="product-name"><a href="#">Maecenas consequat mauris</a></h5>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                        </div>
                                        <div class="content_price">
                                            <span class="price product-price">$38,95</span>
                                            <span class="price old-price">$52,00</span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="product-container">
                                    <div class="left-block">
                                        <a href="#">
                                            <img class="img-responsive" alt="product" src="assets/data/p34.jpg" />
                                        </a>
                                        <div class="quick-view">
                                            <a title="Add to my wishlist" class="heart" href="#"></a>
                                            <a title="Add to compare" class="compare" href="#"></a>
                                            <a title="Quick view" class="search" href="#"></a>
                                        </div>
                                        <div class="add-to-cart">
                                            <a title="Add to Cart" href="#add">Add to Cart</a>
                                        </div>
                                    </div>
                                    <div class="right-block">
                                        <h5 class="product-name"><a href="#">Maecenas consequat mauris</a></h5>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                        </div>
                                        <div class="content_price">
                                            <span class="price product-price">$38,95</span>
                                            <span class="price old-price">$52,00</span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="product-container">
                                    <div class="left-block">
                                        <a href="#">
                                            <img class="img-responsive" alt="product" src="assets/data/p36.jpg" />
                                        </a>
                                        <div class="quick-view">
                                            <a title="Add to my wishlist" class="heart" href="#"></a>
                                            <a title="Add to compare" class="compare" href="#"></a>
                                            <a title="Quick view" class="search" href="#"></a>
                                        </div>
                                        <div class="add-to-cart">
                                            <a title="Add to Cart" href="#add">Add to Cart</a>
                                        </div>
                                    </div>
                                    <div class="right-block">
                                        <h5 class="product-name"><a href="#">Maecenas consequat mauris</a></h5>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                        </div>
                                        <div class="content_price">
                                            <span class="price product-price">$38,95</span>
                                            <span class="price old-price">$52,00</span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="product-container">
                                    <div class="left-block">
                                        <a href="#">
                                            <img class="img-responsive" alt="product" src="assets/data/p36.jpg" />
                                        </a>
                                        <div class="quick-view">
                                            <a title="Add to my wishlist" class="heart" href="#"></a>
                                            <a title="Add to compare" class="compare" href="#"></a>
                                            <a title="Quick view" class="search" href="#"></a>
                                        </div>
                                        <div class="add-to-cart">
                                            <a title="Add to Cart" href="#add">Add to Cart</a>
                                        </div>
                                    </div>
                                    <div class="right-block">
                                        <h5 class="product-name"><a href="#">Maecenas consequat mauris</a></h5>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                        </div>
                                        <div class="content_price">
                                            <span class="price product-price">$38,95</span>
                                            <span class="price old-price">$52,00</span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    ./box product -->
                </div>
                <!-- Product -->
            </div>
            <!-- ./ Center colunm -->
        </div>
        <!-- ./row-->
    </div>
</div>


<jsp:include page="_partial/_footer.jsp" />
<script src="${root}/assets/js/jsProductDetail.js" type="text/javascript"></script>
<script>
    jQuery(document).ready(function () {
        productdetail();
    });
</script>

<div id="fb-root"></div>
<script>(function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id))
            return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.7&appId=1687091491571762";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));</script>

<!-- live chat facebook -->
<div id="fb-root"></div>
<script>
    jQuery(document).ready(function () {
        $('#btn-prod-buy-fb').click(function() {
           $('.vnk-tuvan').click();
        });
        var raido = jQuery(".wrap").attr("data-toggle");
        if (raido == 1) {
            jQuery(".vnk-tuvan").css("display", "none");
            jQuery(".x").click(function () {
                jQuery(".wrap").slideToggle();
                jQuery(".vnk-tuvan").slideToggle();
            });
            jQuery(".vnk-tuvan").click(function () {
                jQuery(".wrap").slideToggle();
                jQuery(this).slideToggle();
            });
        } else {
            jQuery(".wrap").css("display", "none");
            jQuery(".x").click(function () {
                jQuery(".wrap").slideToggle();
                jQuery(".vnk-tuvan").slideToggle();
            });
            jQuery(".vnk-tuvan").click(function () {
                jQuery(".wrap").slideToggle();
                jQuery(this).slideToggle();
            });
        }
    })
</script>