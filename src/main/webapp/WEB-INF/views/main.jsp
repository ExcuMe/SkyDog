<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
	  <meta charset="utf-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <title>SkyDog</title>
	  <link href="${cp}/css/bootstrap.min.css" rel="stylesheet">
	  <link href="${cp}/css/style.css" rel="stylesheet">

	  <script src="${cp}/js/jquery.min.js" type="text/javascript"></script>
	  <script src="${cp}/js/bootstrap.min.js" type="text/javascript"></script>
	  <script src="${cp}/js/layer.js" type="text/javascript"></script>
    <!--[if lt IE 9]>

      <script src="${cp}/js/html5shiv.min.js"></script>
      <script src="${cp}/js/js/respond.min.js"></script>
    <![endif]-->
  </head>
  <style>

  </style>

  <body  style="background-color: #5C6BC0">
    <!--导航栏部分-->
	<jsp:include page="include/header.jsp"/>





	<div class="col-sm-2 col-md-2 sidebar" style="background-color: #C5CAE9;">
		<ul class="nav nav-sidebar">
			<li  class="list-group-item-diy"><a href="#productArea1">衣服配饰 <span class="sr-only">(current)</span></a></li>
			<li class="list-group-item-diy"><a href="#productArea2">数码产品</a></li>
			<li class="list-group-item-diy"><a href="#productArea3">书籍办公</a></li>
			<li class="list-group-item-diy"><a href="#productArea4">游戏周边</a></li>
			<li class="list-group-item-diy"><a href="#productArea5">生活用品</a></li>
			<li class="list-group-item-diy"><a href="#productArea6">化妆用品</a></li>
			<li class="list-group-item-diy"><a href="#productArea7">运动用品</a></li>
		</ul>
	</div>
	<!-- 中间内容 -->
	<div class="container-fluid" name="right">
			<!-- 控制栏 -->
			<!----------------------------------------------------------------------------------------------->

				<div class="col-sm-10 col-sm-offset-2 col-md-10 col-md-offset-2 main">
			<div id="myCarousel" class="carousel slide" style="width: auto;height: 450px; ">
				<!-- 轮播（Carousel）指标 -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3"></li>
					<li data-target="#myCarousel" data-slide-to="4"></li>
					<li data-target="#myCarousel" data-slide-to="5"></li>
				</ol>
				<!-- 轮播（Carousel）项目 -->
				<div class="carousel-inner">
					<div class="item active">
						<img src="${cp}/img/banner1.jpg" class= "img-responsive center-block" alt="First slide"   >
					</div>
					<div class="item">
						<img src="${cp}/img/banner2.jpg" class= "img-responsive center-block" alt="Second slide">
					</div>
					<div class="item">
						<img src="${cp}/img/banner3.jpg" class= "img-responsive center-block" alt="Third slide">
					</div>
					<div class="item ">
						<img src="${cp}/img/banner4.jpg" class= "img-responsive center-block" alt="forth slide">
					</div>
					<div class="item">
						<img src="${cp}/img/banner5.jpg" class= "img-responsive center-block" alt="fifth slide">
					</div>
					<div class="item">
						<img src="${cp}/img/banner6.jpg" class= "img-responsive center-block" alt="sixth slide">
					</div>
				</div>
				<!-- 轮播（Carousel）导航 -->
				<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
					<span  aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
					<span  aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>




					</div>
		</div>
			<!----------------------------------------------------------------------------------------------->





			<!-- 控制内容 -->
			<div class="col-sm-10 col-sm-offset-2 col-md-10 col-md-offset-2 main" style="color:#C5CAE9">
				<div align="center">
				<h1>Products</h1>
				<h4>--全部商品--</h4>
				</div>


				<div name="productArea1" class="row pd-10" id="productArea1">
				</div>

				<div name="productArea2" class="row" id="productArea2">
				</div>

				<div name="productArea3" class="row" id="productArea3">
				</div>

                <div name="productArea4" class="row" id="productArea4">
				</div>

				<div name="productArea5" class="row" id="productArea5">
				</div>

				<div name="productArea6" class="row" id="productArea6">
				</div>

				<div name="productArea7" class="row" id="productArea7">
				</div>


			</div>
			<div class="col-sm-11 col-sm-offset-1 col-md-11 col-md-offset-1">
				<jsp:include page="include/foot.jsp"/>
			</div>
		</div>
	</div>

  <script type="text/javascript">

	  var loading = layer.load(0);

      var productType = new Array;
      productType[1] = "衣服配饰";
      productType[2] = "数码产品";
      productType[3] = "书籍办公";
      productType[4] = "游戏周边";
      productType[5] = "生活用品";
      productType[6] = "化妆用品";
      productType[7] = "运动用品";


	  listProducts();
	  function listProducts() {
		  var allProduct = getAllProducts();
          var mark = new Array;
          mark[1] = 0;
          mark[2] = 0;
          mark[3] = 0;
          mark[4] = 0;
          mark[5] = 0;
          mark[6] = 0;
          mark[7] = 0;
          for(var i=0;i<allProduct.length;i++){
              var owner=getOwnerByProductId(allProduct[i].id);
              var html = "";
			  var imgURL = "${cp}/img/"+allProduct[i].id+".jpg";
			  html += '<div class="col-sm-4 col-md-4" >'+
					  '<div class="boxes pointer" onclick="productDetail('+allProduct[i].id+')">'+
					  '<div class="big bigimg">'+
					  '<img src="'+imgURL+'"  class= "img-responsive center-block" >'+
					  '</div>'+
					  '<p class="product-name" style="color:black">'+allProduct[i].name+'</p>'+
					  '<p class="product-price" style="text-align: left">'+  '<span style="font-size: smaller;margin-left: 12px;color:#FF80AB">'+ owner.name  + ' </span><span style="margin-left: 24px;">￥'   +allProduct[i].price+'</span></p>'+
					  '</div>'+
					  '</div>';
              var id = "productArea"+allProduct[i].type;
              var productArea = document.getElementById(id);
              if(mark[allProduct[i].type] === 0){
                  html ='<hr/><h1>'+productType[allProduct[i].type]+'</h1><hr/>'+html;
                  mark[allProduct[i].type] = 1;
              }
              productArea.innerHTML += html;
		  }
		  layer.close(loading);
	  }


	  function getOwnerByProductId(id) {
          var userResult = "";
          var productId = {};
          productId.id = id;
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/getOwnerByProductId',
              data : productId,
              dataType : 'json',
              success : function(result) {
                  userResult = result.result;
              },
              error : function(result) {
                  layer.alert('查询错误');
              }
          });
          userResult = eval("("+userResult +")");
          return userResult;


      }
	  function getAllProducts() {
		  var allProducts = null;
		  var nothing = {};
		  $.ajax({
			  async : false, //设置同步
			  type : 'POST',
			  url : '${cp}/getAllProducts',
			  data : nothing,
			  dataType : 'json',
			  success : function(result) {
				  if (result!==null) {
					  allProducts = result.allProducts;
				  }
				  else{
					  layer.alert('查询错误');
				  }
			  },
			  error : function(resoult) {
				  layer.alert('查询错误');
			  }
		  });
		  allProducts = eval("("+allProducts+")");
		  return allProducts;
	  }

	  function productDetail(id) {
		  var product = {};
		  var jumpResult = '';
		  product.id = id;
		  $.ajax({
			  async : false, //设置同步
			  type : 'POST',
			  url : '${cp}/productDetail',
			  data : product,
			  dataType : 'json',
			  success : function(result) {
				  jumpResult = result.result;
			  },
			  error : function(resoult) {
				  layer.alert('查询错误');
			  }
		  });

		  if(jumpResult === "success"){
			  window.location.href = "${cp}/product_detail";
		  }
	  }
      $('.carousel').carousel({
          interval: 2000
      })



  </script>


  </body>
</html>