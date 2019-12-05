<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style type="text/css">
	.bottom_menu { }
	.bottom_menu>a {
		 display:inline-block;
		 width:200px;
		 height:25px;
		 box-shadow: 
		    2px 0 0 0 #CCC, 
		    0 2px 0 0 #CCC, 
		    2px 2px 0 0 #CCC,   /* Just to fix the corner */
		    2px 0 0 0 #CCC inset, 
		    0 2px 0 0 #CCC inset;
		 padding-top:3px;
		 text-align:center;
		 text-decoration:none;
		 color:#333;
	}
	.bottom_menu>a:hover {
		background-color:#999;
		color:#FFF;
	}
	.bottom_copyright {
		padding-top:10px;
		text-align:center; 
	}
</style>    
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-12" role="navigation">
			<nav class="nav bottom_menu"><!-- 
			--><a href="#">About Us</a><!-- 
			   --><a href="#">Privacy Policy(개인 정보 정책)</a><!--
			   --><a href="#">Terms of Use(이용약관)</a><!--
			--></nav>
		</div>
		<div class="col-sm-12 bottom_copyright">
			Copyright ⓒ 2019 iburster Griptok All rights reserved.
		</div>
	</div>
</div>