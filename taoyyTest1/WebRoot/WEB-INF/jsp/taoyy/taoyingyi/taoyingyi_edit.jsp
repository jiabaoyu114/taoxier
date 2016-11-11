<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	
	
	//保存
	function save(){
			if($("#TAONAME").val()==""){
			$("#TAONAME").tips({
				side:3,
	            msg:'请输入名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TAONAME").focus();
			return false;
		}
		if($("#TAOAGE").val()==""){
			$("#TAOAGE").tips({
				side:3,
	            msg:'请输入年龄',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TAOAGE").focus();
			return false;
		}
		if($("#TAOTEL").val()==""){
			$("#TAOTEL").tips({
				side:3,
	            msg:'请输入电话',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TAOTEL").focus();
			return false;
		}
		if($("#TAOEMAIL").val()==""){
			$("#TAOEMAIL").tips({
				side:3,
	            msg:'请输入邮件',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TAOEMAIL").focus();
			return false;
		}
		if($("#TAOASSOCIATION").val()==""){
			$("#TAOASSOCIATION").tips({
				side:3,
	            msg:'请输入未知一',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TAOASSOCIATION").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="taoyingyi/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="TAOYINGYI_ID" id="TAOYINGYI_ID" value="${pd.TAOYINGYI_ID}"/>
		<div id="zhongxin">
		<table>
			<tr>
				<td><input type="text" name="TAONAME" id="TAONAME" value="${pd.TAONAME}" maxlength="32" placeholder="这里输入名称" title="名称"/></td>
			</tr>
			<tr>
				<td><input type="number" name="TAOAGE" id="TAOAGE" value="${pd.TAOAGE}" maxlength="32" placeholder="这里输入年龄" title="年龄"/></td>
			</tr>
			<tr>
				<td><input type="text" name="TAOTEL" id="TAOTEL" value="${pd.TAOTEL}" maxlength="32" placeholder="这里输入电话" title="电话"/></td>
			</tr>
			<tr>
				<td><input type="text" name="TAOEMAIL" id="TAOEMAIL" value="${pd.TAOEMAIL}" maxlength="32" placeholder="这里输入邮件" title="邮件"/></td>
			</tr>
			<tr>
				<td><input type="text" name="TAOASSOCIATION" id="TAOASSOCIATION" value="${pd.TAOASSOCIATION}" maxlength="32" placeholder="这里输入未知一" title="未知一"/></td>
			</tr>
			<tr>
				<td style="text-align: center;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
</body>
</html>