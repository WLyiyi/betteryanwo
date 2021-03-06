<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>产品中心-鲜炖系列</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <meta name="author" content="gettemplates.co"/>


    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content=""/>
    <meta name="twitter:image" content=""/>
    <meta name="twitter:url" content=""/>
    <meta name="twitter:card" content=""/>

    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i" rel="stylesheet">

    <!-- Animate.css -->
    <link rel="stylesheet" href="../../statics/mycss/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="../../statics/mycss/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="../../statics/mycss/bootstrap.css">

    <!-- Flexslider  -->
    <link rel="stylesheet" href="../../statics/mycss/flexslider.css">

    <!-- Owl Carousel  -->
    <link rel="stylesheet" href="../../statics/mycss/owl.carousel.min.css">
    <link rel="stylesheet" href="../../statics/mycss/owl.theme.default.min.css">

    <!-- Theme style  -->
    <link rel="stylesheet" href="../../statics/mycss/style.css">

    <!-- Modernizr JS -->
    <script src="../../statics/myjs/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <style>


        #fh5co-header {
            margin-top: -18px;
        }

        #row {
            padding-top: 12px;
        }

        #font {
            font-size: 30px;
            font-family: "bodoni mt black";
            color: #FFFFFF;
            font-weight: 500;
        }

        .col-md-12 p {
            margin-top: -18px;
            font-size: 14px;

        }

        .col-md-12 p small {
            margin-top: 60px;
            font-size: 13.5px;
        }

        .ganyan {
            font-family: "微软雅黑";
        }
    </style>
</head>
<body>

<div class="fh5co-loader"></div>

<div id="page">
    <nav class="fh5co-nav" role="navigation">
        <div class="container">
            <div class="row" id="row">
                <div class="col-md-3 col-xs-2">
                    <div id="fh5co-logo"><a href="/jump/toIndex">思语燕坊</a></div>
                </div>
                <div class="col-md-6 col-xs-6 text-center menu-1">
                    <ul>

                        <li><a href="/jump/toIndex">首页</a></li>
                        <li class="has-dropdown">
                            <a href="#">产品中心</a>
                            <ul class="dropdown">
                                <li><a href="/jump/toDrydan">干燕系列</a></li>
                                <li><a href="/jump/toFreshstew">鲜炖系列</a></li>
                            </ul>
                        </li>
                        <li class="has-dropdown">
                            <a href="#">企业新闻</a>
                            <ul class="dropdown">
                                <li><a href="#">最新活动</a></li>
                                <li><a href="/jump/toAbout">企业文化</a></li>
                                <li><a href="/jump/toJoin">加入我们</a></li>
                            </ul>
                        </li>
                        <li class="has-dropdown">
                            <a href="#">招募活动</a>
                            <ul class="dropdown">
                                <li><a href="/jump/toEat">企业试吃</a></li>
                                <li><a href="/jump/toPersonal">个人体验</a></li>
                            </ul>
                        </li>
                        <li><a href="/jump/toCenter">个人中心</a></li>
                    </ul>
                </div>
                <div class="col-md-3 col-xs-4 text-right hidden-xs menu-2">
                    <ul>
                        <li class="search">
                            <div class="input-group">
                                <input type="text" placeholder="Search..">
                                <span class="input-group-btn">
						        <button class="btn btn-primary" type="button"><i class="icon-search"></i></button>
						      </span>
                            </div>
                        </li>
                        <li class="shopping-cart"><a href="#" class="cart"><span><small>0</small><i class="icon-shopping-cart"></i></span></a></li>
                        <li id="log"><a id="login" href="/user/toLogin">登录</a><a id="username" href="#">${user.userName}</a></li>
                    </ul>
                </div>
            </div>

        </div>
    </nav>


    <header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner"
            style="background-image:url(/statics/images/106.jpg);">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 text-center">
                    <div class="display-t">
                        <div class="display-tc animate-box" data-animate-effect="fadeIn">
                            <h1 id="h1">产品中心</h1>
                            <font id="font">PRODUCT CENTER</font>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <div id="fh5co-product">
        <div class="container">
            <div class="row animate-box">
                <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                    <span>Fresh stew</span>
                    <h2>鲜炖系列</h2>
                    <p>当天鲜炖、冷鲜配送的燕窝产品</p>
                    <p>采用低温炖煮，营养保留更全面，绝不含任何添加剂</p>
                </div>

            </div>
            <div class="row">
            <c:forEach items="${productList}" var="productItem">
                <div class="col-md-4 text-center animate-box">
                    <div class="product">
                        <div class="product-grid" style="background-image:url(${productItem.GImage});">
                            <div class="inner">
                                <p>
                                    <a href="#" class="icon"><i class="icon-shopping-cart"></i></a>
                                    <a href="/jump/toDetail?goodsId=${productItem.goodsId}" class="icon"><i class="icon-eye"></i></a>
                                </p>
                            </div>
                        </div>

                        <div class="desc">
                            <h3><a href="/jump/toDetail?goodsId=${productItem.goodsId}">${productItem.goodsName}</a></h3>
                            <span class="price">${productItem.GPrice}</span>
                        </div>
                    </div>
                </div>

            </c:forEach>

            </div>
            <%--<div class="col-md-4 text-center animate-box">
                <div class="product">
                    <div class="product-grid" style="background-image:url(/statics/images/product-1.jpg);">
                        <div class="inner">
                            <p>
                                <a href="single.html" class="icon"><i class="icon-shopping-cart"></i></a>
                                <a href="single.html" class="icon"><i class="icon-eye"></i></a>
                            </p>
                        </div>
                    </div>
                    <div class="desc">
                        <h3><a href="single.html">Hauteville Concrete Rocking Chair</a></h3>
                        <span class="price">$350</span>
                    </div>
                </div>
            </div>
            <div class="col-md-4 text-center animate-box">
                <div class="product">
                    <div class="product-grid" style="background-image:url(/statics/images/product-2.jpg);">
                        <div class="inner">
                            <p>
                                <a href="single.html" class="icon"><i class="icon-shopping-cart"></i></a>
                                <a href="single.html" class="icon"><i class="icon-eye"></i></a>
                            </p>
                        </div>
                    </div>
                    <div class="desc">
                        <h3><a href="single.html">Pavilion Speaker</a></h3>
                        <span class="price">$600</span>
                    </div>
                </div>
            </div>
            <div class="col-md-4 text-center animate-box">
                <div class="product">
                    <div class="product-grid" style="background-image:url(/statics/images/product-3.jpg);">
                        <div class="inner">
                            <p>
                                <a href="single.html" class="icon"><i class="icon-shopping-cart"></i></a>
                                <a href="single.html" class="icon"><i class="icon-eye"></i></a>
                            </p>
                        </div>
                    </div>
                    <div class="desc">
                        <h3><a href="single.html">Ligomancer</a></h3>
                        <span class="price">$780</span>
                    </div>
                </div>
            </div>--%>

            <%--<div class="row">
                <div class="col-md-4 text-center animate-box">
                    <div class="product">
                        <div class="product-grid" style="background-image:url(/statics/images/product-1.jpg);">
                            <div class="inner">
                                <p>
                                    <a href="single.html" class="icon"><i class="icon-shopping-cart"></i></a>
                                    <a href="single.html" class="icon"><i class="icon-eye"></i></a>
                                </p>
                            </div>
                        </div>
                        <div class="desc">
                            <h3><a href="single.html">Hauteville Concrete Rocking Chair</a></h3>
                            <span class="price">$350</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 text-center animate-box">
                    <div class="product">
                        <div class="product-grid" style="background-image:url(/statics/images/product-2.jpg);">
                            <div class="inner">
                                <p>
                                    <a href="single.html" class="icon"><i class="icon-shopping-cart"></i></a>
                                    <a href="single.html" class="icon"><i class="icon-eye"></i></a>
                                </p>
                            </div>
                        </div>
                        <div class="desc">
                            <h3><a href="single.html">Pavilion Speaker</a></h3>
                            <span class="price">$600</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 text-center animate-box">
                    <div class="product">
                        <div class="product-grid" style="background-image:url(/statics/images/product-3.jpg);">
                            <div class="inner">
                                <p>
                                    <a href="single.html" class="icon"><i class="icon-shopping-cart"></i></a>
                                    <a href="single.html" class="icon"><i class="icon-eye"></i></a>
                                </p>
                            </div>
                        </div>
                        <div class="desc">
                            <h3><a href="single.html">Ligomancer</a></h3>
                            <span class="price">$780</span>
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
    </div>


    <footer id="fh5co-footer" role="contentinfo">
        <div class="container">
            <div class="row row-pb-md">
                <div class="col-md-4 fh5co-widget">
                    <h3>思语燕坊</h3>
                    <p>Facilis ipsum reprehenderit nemo molestias. Aut cum mollitia reprehenderit. Eos cumque dicta
                        adipisci architecto culpa amet.</p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
                    <ul class="fh5co-footer-links">
                        <li>产品中心</li>
                        <li><a href="#">干燕系列</a></li>
                        <li><a href="#">鲜炖系列</a></li>
                    </ul>
                </div>

                <div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
                    <ul class="fh5co-footer-links">
                        <li>企业新闻</li>
                        <li><a href="#">最新活动</a></li>
                        <li><a href="#">企业文化</a></li>
                        <li><a href="#">发展历程</a></li>
                        <li><a href="#">加入我们</a></li>
                    </ul>
                </div>

                <div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
                    <ul class="fh5co-footer-links">
                        <li>招募活动</li>
                        <li><a href="#">企业试吃</a></li>
                        <li><a href="#">个人体验</a></li>
                    </ul>
                </div>
            </div>

            <div class="row copyright">
                <div class="col-md-12 text-center">
                    <p>
                        <small class="block">Copyright © 2018 betteryanwo.com 版权所有. 豫ICP备18020315</small>
                    </p>
                    <p>
                        联系方式：400-885-8630
                    </p>
                    <p>地址：河南省郑州市金水区紫荆山路与城北路交叉口阳光铭座A座1801室</p>
                </div>
            </div>

        </div>
    </footer>
</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
</div>


<!-- jQuery -->
<script src="../../statics/myjs/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="../../statics/myjs/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="../../statics/myjs/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="../../statics/myjs/jquery.waypoints.min.js"></script>
<!-- Carousel -->
<script src="../../statics/myjs/owl.carousel.min.js"></script>
<!-- countTo -->
<script src="../../statics/myjs/jquery.countTo.js"></script>
<!-- Flexslider -->
<script src="../../statics/myjs/jquery.flexslider-min.js"></script>
<!-- Main -->
<script src="../../statics/myjs/main.js"></script>

<script>
    $(function () {
        var users="<%=session.getAttribute("user")%>";
        if (users!='null'){
            $("#log #login").css("opacity","0");
            $("#log #login").css("display","none");
            $("#log #username").css("position","relative");
            $("#log #username").css("left","70px");
            $("#log #username").css("top","-37px");
        }
        if(users='null'){
            $("#log #login").css("position","relative");
            $("#log #login").css("left","75px");
            $("#log #login").css("top","-37px");
        }
    })
</script>

</body>
</html>

