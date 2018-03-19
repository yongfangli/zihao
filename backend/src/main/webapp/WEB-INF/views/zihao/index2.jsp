<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>首页</title>
	<%@include file="/WEB-INF/views/include/zihaohead.jsp" %>
	<link rel="stylesheet"  type="text/css"  href="${staticzihao}/css/indexother.css"/>
	<script type="text/javascript" src="${staticzihao}/imagenav/js/carousel.js"></script>
	<script type="text/javascript">
        $(function(){
                            $(".carousel-content").carousel({
                                carousel : ".carousel",//轮播图容器
                                indexContainer : ".img-index",//下标容器
                                prev : ".carousel-prev",//左按钮
                                next : ".carousel-next",//右按钮
                                timing : 5000,//自动播放间隔
                                animateTime : 800,//动画时间
                                auto : true,//是否自动播放
                            });

                            $(".carousel-prev").hover(function(){
                                $(this).find("img").attr("src","${staticzihao}"+"/imagenav/images/left_btn2.png");
                            },function(){
                                $(this).find("img").attr("src","${staticzihao}"+"/imagenav/images/left_btn1.png");
                            });
                            $(".carousel-next").hover(function(){
                                $(this).find("img").attr("src","${staticzihao}"+"/imagenav/images/right_btn2.png");
                            },function(){
                                $(this).find("img").attr("src","${staticzihao}"+"/imagenav/images/right_btn1.png");
                            });
                                                 
                            $("#contactus").submit(function(){
                            	
                            	if($("#name").val()==""||$("#name").val()==null){
                            		$("#namemsg").show();
                            		return false;
                            	}
                            	 if($("#phone").val()==""||$("#phone").val()==null){
                            		$("#phonemsg").show();
                            		return false;
                            	}
                            	if(!checkPhone($("#phone").val())){
                            		$("#phonemsg").empty().html("手机号码格式有误，请重新输入");
                            		$("#phonemsg").show();
                            		return false;
                            	}
                            	$.ajax({
                					type:"post",
                					async:false,
                					url:"${ctxzihao}/contactus/save",
                					dataType:"json",
                					cache:false,
                					data:$('#contactus').serializeArray(),
                					success : function(data) {
                						if(data.code==200){
                							alert(data.msg);
                							$("#phone").val("");
                							$("#name").val("");
                							$("#detail").val("");
                						}
                					}
                				}); 
                            	return false;
                            })
        });
        function scrollto(flag){
        	var time;
        	var time2;
        	if(flag==2){
        		
        		function push(){document.body.scrollTop=350;
        			clearInterval(time);};
        		 time=setInterval(push,500);
        		 
        	}
        	
        	if(flag==4){
        		function push2(){document.body.scrollTop=900;
        		 clearInterval(time2);};
        		 time2=setInterval(push2,500);
        		
        	}
        	
        }
        function hidmsg(){
        	$("#namemsg").hide();
        	$("#phonemsg").hide();
        }  
        function checkPhone(phone){ 
            if(!(/^1[34578]\d{9}$/.test(phone))){ 
                return false; 
            } else
            	return true;
        }
	</script>
<body>
<div class="top">
    <div class="right">
	<div class="logo"><img src="${staticzihao}/logo.png" alt="logo"/></div>
	<div class="title"><h3>上海子浩传播有限公司</h3></div>
	</div>
	<div class="left">
    <ul class="nav">
		<li><a href="${ctxzihao}/index">首页</a></li>
		<li><a  onclick="scrollto(2)" href="javascript:void(0)">公司介绍</a></li>
		<li><a href="${ctxzihao}/product">产品</a></li>
		<li><a  onclick="scrollto(4)" href="javascript:void(0)">联系我们</a></li>
	</ul>
	</div>
</div>
<div class="news">
      
	<div class="carousel-content">
	<div class="header">
			    <label >最新活动</label>
				<a href="${ctxzihao}/activity/list" class="more">更多....</a>
		    </div>
		<ul class="carousel">
		<c:forEach items="${activityList}" var="activity">
			<li><a href="${ctxzihao}/activity/detail/${activity.id}"><img src="${activity.img}" alt="${activity.name}"/></a></li>
        </c:forEach>
		</ul>
		<ul class="img-index"></ul>
		<div class="carousel-prev"><img src="${staticzihao}/imagenav/images/left_btn1.png"></div>
		<div class="carousel-next"><img src="${staticzihao}/imagenav/images/right_btn1.png"></div>
	</div>
	<div class="notice">
		    <div class="header">
			    <label >最新新闻</label>
				<a href="${ctxzihao}/companyNews/list" class="more">更多....</a>
		    </div>
			<ul class="noticeList">
			<c:forEach items="${newsList}" var="news"> 
				<li><a href="${ctxzihao}/companyNews/detail/${news.id}">${news.title}</a></li>
            </c:forEach>
			</ul>

	</div>

</div>

<div class="companyDetail">
    <h4>公司简介</h4>
      <div class="companyProgress">
          <img src=""${staticzihao}/image/overview_map.png">
          <span class="detailcontent">华为是全球领先的信息与通信技术(ICT)解决方案供应商，
      专注于ICT领域，坚持稳健经营、持续创新、开放合作，在电信运营商、企业、终端和云计算等领域构筑了端到端的解决方案优势，
      为运营商客户、企业客户和消费者提供有竞争力的ICT解决方案、产品和服务，并致力于使能未来信息社会、构建更美好的全联接世界。
      目前，华为约有18万名员工，业务遍及全球170多个国家和地区，服务全世界三分之一以上的人口。</span>
  </div>
    <div class="perspect">
		<div class="image"> <img class="perImg" src="${staticzihao}/image/4.jpg"/></div>
        <div class="text"><h2>我们的愿景</h2><p>我们旨在构建未来的商务生态系统。我们的愿景是让客户相会、工作和生活在阿里巴巴，并持续发展最少102年</p></div>
        <div class="text2"><h2>相会在阿里巴巴</h2><p>我们每天促进数以亿计的商业和社交互动，包括用户和用户之间、消费者和商家之间以及企业和企业之间的互动。</p></div>
        <div class="text2"><h2>相会在阿里巴巴</h2><p>我们每天促进数以亿计的商业和社交互动，包括用户和用户之间、消费者和商家之间以及企业和企业之间的互动。</p></div>

    </div>
  </div>

<div class="contactUs">
	<div class="contactBody">
    <div class="notice"><label>如果你有什么需求，请输入你的信息，我们会尽快回复</label></div>
    <div class="contactForm">
    <form action="${ctxzihao}/contactus/save" method="post" id="contactus">
       <div> <input placeholder="你的名字" oninput="hidmsg()" name="name" id="name" type="text"><div><span id="namemsg" style="display:none;color:red;margin-left:5px;font-size:0.5rem">名字不能为空</span></div></div>
		<div> <input placeholder="你的联系电话" oninput="hidmsg()" name="phone" id="phone" type="text"><div><span id="phonemsg" style="display:none;color:red;margin-left:5px;font-size:0.5rem">电话不能为空</span></div></div>
		<div> <textarea id="detail" rows="4" cols="22" placeholder="详情" name="detail" ></textarea></div>
		<div> <input class="submit"  value="提交"  type="submit"></div>
    </form>
	</div>
    </div>
</div>
<div class="bottom">
	<div class="contact">
	     <div class="person">
			 <p>联系人：李小军</p>
			 <p>联系电话：	15221156989</p>
			 <p>
				 Copyright 2018 上海子浩传播有限公司</p>
		 </div>

	</div>

</div>
</body>
</html>