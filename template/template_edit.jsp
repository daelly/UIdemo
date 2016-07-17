<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>模板编辑</title>
<!--jquery -->
<script src="/RedseaPlatform/skins/library/jquery/jquery-2.1.1.min.js"></script>
<!--bootstrap -->
<link rel="stylesheet" href="/RedseaPlatform/skins/library/bootstrap-3.3.0/css/bootstrap.min.css">
<script src="/RedseaPlatform/skins/library/bootstrap-3.3.0/js/bootstrap.min.js"></script>
<!--字体文件-->
<link rel="stylesheet" href="/RedseaPlatform/skins/library/bootstrap-3.3.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="/RedseaPlatform/skins/newstyle/css/iconfonts/iconfont.css" />
<script type="text/javascript" src="/RedseaPlatform/UIdemo/layer/layer.js"></script>
<style type="text/css">
	.main-content{
		background-color: rgba(206, 203, 203, 0.25);
		padding-bottom: 30px;
	}
	.view-box{
		padding-top: 10px;
	}
	.edit-area{
		background-color: #fff;
		border-radius: 5px;
		width: 450px;
		height: 500px;
		margin-left: 400px;
		overflow: auto;
	}
	#edit_content_list textarea{
		height: 90px;
	}
</style>
<script type="text/javascript">
	String.prototype.trim=function() {
	    return this.replace(/(^\s*)|(\s*$)/g,'');
	}
	
	$(function(){
		$("#myTab a").click(function(e){
			e.preventDefault()
			$(this).tab('show')
		});
	});
	
	var editables = [];
	var imglists = [];
	function loadUrl(){
		var url = $("input[name='url']").val();
		$("#viewBox").attr("src",url);
	}
	
	function updateTitles(){
		var win = document.getElementById('viewBox').contentWindow;
		editables = [];
		imglists = [];
		goahead(win.document.body);
		listEditableDom();
	}
	
	function goahead(dom){
		if(!dom || dom.tagName=='SCRIPT')
			return;
		if(dom.tagName=='IMG'){
			imglists.push(dom);
			return;
		}
		if(dom.nodeType==1 && dom.children.length==0){//处理没有子节点的节点
			var content = dom.innerText;
			if(!content || content.trim().length==0)//跳过没有内容的
				return;
			//console.log(dom);
			editables.push(dom);
		}else if(dom.childNodes && dom.childNodes.length > 0){
			for(d in dom.childNodes){
				if(dom.childNodes[d] && dom.childNodes[d].nodeType==1)
					goahead(dom.childNodes[d]);
			}
		}
	}
	
	function listEditableDom(){
		$("#edit_content_list").empty();
		for(i in editables){
			var content = editables[i].innerText;
			var html = "<tr><td width='80'>内容"+i+"</td><td>";
			if(content.length>30){
				html += "<textarea class='form-control' index='"+i+"' value='"+content+"'>"+content+"</textarea>";
			}else{
				html += "<input class='form-control' index='"+i+"' value='"+content+"' />";
			}
			html += "</td></tr>";
			$("#edit_content_list").append(html);
		}
		$("#edit_img_list").empty();
		for(j in imglists){
			var html = "<tr><td width='80' rowspan='2'>图片"+j+"</td><td rowspan='2'>";
			html += "<img src='"+imglists[j].src+"' index='"+j+"' style='height:100px;max-width:150px;' /></td>";
			html += "<td><button type='button' class='btn btn-sm btn-default' onclick='uploadDialog("+j+")'>本地选择</button></td>";
			html += "<td><button type='button' class='btn btn-sm btn-success' onclick='replace("+j+")'>替换</button>";
			html += "</td></tr>";
			html += "<tr><td colspan='2'><button type='button' class='btn btn-sm btn-info' onclick='save2Server("+j+")'>保存服务器</button></td></tr>";
			$("#edit_img_list").append(html);
		}
		$("#edit_content_list *[index]").on("change",function(){
			var index = $(this).attr("index");
			index = Number(index);
			console.log(editables[index]);
			console.log($(this).val());
			$(editables[index]).text($(this).val());
			var scroll_offset = $(editables[index]).offset();
			var win = document.getElementById('viewBox').contentWindow;
			$(win.document.body).animate({
				scrollTop:scroll_offset.top
			},0);
			//editables[index].innerHTML = $(this).val();
		});
	}
	
	function uploadDialog(index){
		 layer.open({
		    type: 2,
		    title: '图片上传',
		    shadeClose: true,
		    shade: 0.8,
		    maxmin: false,
		    offset:10,
		    area: ['618px', '570px'],
		    content: "/RedseaPlatform/UIdemo2/template/upload.jsp?index="+index //iframe的url
		}); 
	}
	
	function setImg(index,data){
		$("#edit_img_list img[index='"+index+"']").attr("src",data);
	}
	
	function replace(index){
		index = Number(index);
		imglists[index].src = $("#edit_img_list img[index='"+index+"']").attr("src");
		var scroll_offset = $(imglists[index]).offset();
		var win = document.getElementById('viewBox').contentWindow;
		$(win.document.body).animate({
			scrollTop:scroll_offset.top
		},0);
	}
	
	function save2Server(index){
		index = Number(index);
		$.ajax({
			url:"/RedseaPlatform/PtFjk.mc?method=base64ToImage",
			dataType:"json",
			data:{imageData:$("#edit_img_list img[index='"+index+"']").attr("src")},
			success:function(result){
				if(result.state=="1"){
					console.log(result);
				}else{
					console.log(result);
				}
			},
			error:function(){
				console.log($("#edit_img_list img[index='"+index+"']").attr("src"));
			}
		});
	}
</script>
</head>
<body>
<div class="container main-content">
	<div class="content-title">
		<h3>H5页面模板编辑</h3>
	</div>
	<div class="view-box">
		<div style="float:left;">
			<iframe id="viewBox" width="315px;" height="540px" src="/RedseaPlatform/UIdemo2/template/templates/cpts_204_cxx/cpts_204_cxx/index.html"></iframe>
		</div>
		<div class="edit-area">
			<table class="table">
				<tbody>
					<tr>
					<td colspan="3">
						<input type="text" name="url" class="form-control" placeholder="新url" />
					</td>
					</tr>
					<tr>
						<td><button type="button" class="btn btn-success" onclick="loadUrl()">重新加载</button></td>
						<td><button type="button" class="btn btn-primary" onclick="updateTitles()">更新字段</button></td>
						<td><button type="button" class="btn btn-info" onclick="exportPage()">导出页面</button></td>
					</tr>
				</tbody>
			</table>
			<div class="edit-content">
				<ul class="nav nav-tabs" id="myTab">
					<li role="presentation" class="active">
						<a href="#contentEdit" role="tab" data-toggle="tab">文字编辑</a>
					</li>
    				<li role="presentation">
    					<a href="#imgEdit" role="tab" data-toggle="tab">图片编辑</a>
    				</li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="contentEdit">
						<table class="table">
							<tbody id="edit_content_list">
								
							</tbody>
						</table>
					</div>
					<div role="tabpanel" class="tab-pane" id="imgEdit">
						<table class="table">
							<tbody id="edit_img_list">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>