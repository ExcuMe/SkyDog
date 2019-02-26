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
      <script src="${cp}/js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <!--导航栏部分-->
    <jsp:include page="include/header.jsp"/>

    <!-- 中间内容 -->
    <div class="container-fluid">
        <div class="row">
            <!-- 控制栏 -->
            <div class="col-sm-3 col-md-2 sidebar sidebar-1" style="color:#C5CAE9">
                <ul class="nav nav-sidebar">
                    <li class="list-group-item-diy"><a href="#section1">查看所有用户<span class="sr-only">(current)</span></a></li>
                    <li class="list-group-item-diy"><a href="#section2">查看所有商家</a></li>

                </ul>
            </div>
            <!-- 控制内容 -->
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <div class="col-md-12">
                    <h1><a name="section1" style="color: white;">用户信息</a></h1>
                    <hr/>
                    <table class="table table-hover center"  style="color: white;" id="userTable">
                    </table>
                </div>

                <div class="col-md-12">
                    <hr/>
                    <h1><a name="section2"  style="color: white;">商家信息</a></h1>
                    <hr/>
                    <table class="table table-hover center"  style="color: white;" id="shopOwnerArea">
                    </table>
                </div>

            </div>
            <br/>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- 尾部 -->
    <jsp:include page="include/foot.jsp"/>
  <script type="text/javascript">

    //  var loading = layer.load(0);//加载动画
      listAllUser();
      listAllshopOwner();
   //   layer.close(loading);
      //列出所有用户
      function listAllUser() {
          var userTable = document.getElementById("userTable");
          var allUser = getAllUsers();
          userTable.innerHTML = '<tr>'+
                                  '<th> 用户ID </th>'+
                                  '<th> 用户名</th>'+
                                  '<th> 昵称</th>'+
                                  '<th> 邮箱</th>'+
                                  '<th> 是否删除</th>'+
                                '</tr>';
          var html = "";
          for(var i=0;i<allUser.length;i++){
              html += '<tr>'+
                      '<td>'+allUser[i].id+'</td>'+
                      '<td>'+allUser[i].name+'</td>'+
                      '<td>'+allUser[i].nickName+'</td>'+
                      '<td>'+allUser[i].email+'</td>'+
                      '<td>'+
                      '<button class="btn btn-primary btn-sm" type="submit" onclick="deleteUser('+allUser[i].id+')">删除</button>'+
                      '</td>'+
                      '</tr>';
          }
          userTable.innerHTML += html;
      }

      function getAllUsers() {
          var allUsers = "";
          var nothing = {};
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/getAllUser',
              data : nothing,
              dataType : 'json',
              success : function(result) {
                  if (result!==null) {
                      allUsers = result.allUsers;
                  }
                  else{
                      layer.alert('查询所有用户错误');
                  }
              },
              error : function(resoult) {
                  layer.alert('查询所有用户错误');
              }
          });
          allUsers = eval("("+allUsers+")");//eval（）转换为json对象
          return allUsers;
      }


      function deleteUser(id) {
          var user = {};
          user.id = id;
          var deleteResult = "";
          $.ajax({
              async : false,
              type : 'POST',
              url : '${cp}/deleteUser',
              data : user,
              dataType : 'json',
              success : function(result) {
                  deleteResult = result;
              },
              error : function(result) {
                  layer.alert('查询用户错误');
              }
          });
          layer.msg(deleteResult.message);
          listAllUser();
          listAllshopOwner();
      }

      function listAllshopOwner() {
          var shopOwnerArea = document.getElementById("shopOwnerArea");
          var allshopOwner = getAllshopOwner();
          shopOwnerArea.innerHTML = '<tr>'+
              '<th> 商家ID </th>'+
              '<th> 用户名</th>'+
              '<th> 昵称</th>'+
              '<th> 邮箱</th>'+
              '<th> 是否删除</th>'+
              '</tr>';
          var html="";
          for(var i=0;i<allshopOwner.length;i++){
              html += '<tr>'+
                  '<td>'+allshopOwner[i].id+'</td>'+
                  '<td>'+allshopOwner[i].name+'</td>'+
                  '<td>'+allshopOwner[i].nickName+'</td>'+
                  '<td>'+allshopOwner[i].email+'</td>'+
                  '<td>'+
                  '<button class="btn btn-primary btn-sm" type="submit" onclick="deleteUser('+allshopOwner[i].id+')">删除</button>'+
                  '</td>'+
                  '</tr>';
          }
          shopOwnerArea.innerHTML+=html;
      }
      //列出所有商品
      function getAllshopOwner() {
          var allShopowners ="";
          var nothing = {};
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/getAllShopowners',
              data : nothing,
              dataType : 'json',
              success : function(result) {
                  if (result) {
                      allShopowners = result.allShopowners;
                  }
                  else{
                      layer.alert('查询所有商家错误');
                  }
              },
              error : function(result) {
                  layer.alert('查询所有商家错误');
              }
          });
          allShopowners = eval("("+allShopowners+")");
          return allShopowners;
      }

      <!--
      function deleteshopowner(id) {
          var owner = {};
          owner.id = id;
          alert(owner.id);
          var deleteResult = "";
          $.ajax({
              async : false,
              type : 'POST',
              url : '${cp}/deleteShopownerById',
              data : owner,
              dataType : 'json',
              success : function(result) {
                  deleteResult = result;
              },
              error : function(result) {
                  layer.alert('查询商家错误');

              }
          });
          layer.msg(deleteResult.message);
          listAllshopOwner();
      }
      -->

  </script>
  </body>
</html>