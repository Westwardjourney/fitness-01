<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'layout.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%@ include file="jslink.jsp"%>
<script type="text/javascript">
	$(function() {
		//设置树的节点对象
		var zTreeObj;
		var setting = {
			data : {
				simpleData : {
					enable : true,
					idKey : "mid",
					pIdKey : "pid",
					rootPId : 0
				},
				key : {
					name : "mname"
				}
			},
			view: {
				selectedMulti: false
			},
			callback : {
				onClick : function(e, id, node) {
					var zTree = $.fn.zTree.getZTreeObj("tree");
					if (node.isParent) {
						zTree.expandNode();
					} else {
						addTabs(node.mname, node.path);
					}

				}
			}
		};
		//设置节点全局
		var zTreeNodes = ${ztree};
		zTreeObj = $.fn.zTree.init($("#tree"), setting, zTreeNodes);

		function addTabs(Title, Url) {
			var tt = $("#tabs");
			if (tt.tabs("exists", Title)) {
				tt.tabs("select", Title);
			} else {
				$("#tabs").tabs("add",{
						title : Title,
						content : "<iframe src='"+Url+"' width='100%' height='100%' frameborder='0'></iframe>",
						closable : true
				});
			};
		}

	});
</script>
</head>

<body class="easyui-layout">
	<div data-options="region:'north',split:true" style="height:100px;">北${test}</div>
	<div data-options="region:'west',split:true" style="width:234px;">
		<ul id="tree" class="ztree" style="width:230px; overflow:auto;"></ul>
	</div>
	<div id="center" data-options="region:'center'"
		style="padding:5px;background:#eee;">
		<div id="tabs" class="easyui-tabs"
			data-options="fit:true,border:false">
			<div title="首页" style="padding: 20px; overflow: hidden;">
				<center>
					<span style="display: block;margin-top: 15%;"> <font
						color="blue" style="font-size: 65px;">欢迎光临!!!☺</font> </span>
				</center>
			</div>
		</div>
	</div>
</body>
</html>
