<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>首页</title>
	<%@include file="/WEB-INF/views/include/zihaohead.jsp" %>
	<link rel="stylesheet"  type="text/css"  href="${staticzihao}/css/index1.css"/>
	<script>
	$(function(){
		$(".triangle").click(function(){
			if($(".lang-select").css("display")!="none"){
				$(".lang-select").hide();
			}else{
				$(".lang-select").show();
				}
		})
		
	})
	</script>
</head>
<body>
<div class="header">
    <div class="logo"><img src="${staticzihao}/logo.png" alt="logo"/><span>某某有限公司</span></div>
    <div class="right">
    <div class="searchform">
    <form action="${ctxzihao}/search">
    <input class="search" placeholder="请输入搜索内容" name="content">
    <input class="submit" type="button" id="submit">
    </form>
    </div>
    <div class="langwrap"><span class="lang">简体中文
    <ul class="lang-select">
    <li>EN</li>
    <li>简体中文</li>
    </ul></span>
    <span class="triangle"></span>
    </div>
    </div>
</div> 
<div class="nav">
<ul class="toggle">
 <li><a>公司简介</a></li>
 <li><a>业务范畴</a></li>
 <li><a>联系我们</a></li>
</ul>
</div>  
</body>
</html>