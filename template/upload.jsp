<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图片上传</title>
<!--jquery -->
<script src="/RedseaPlatform/skins/library/jquery/jquery-2.1.1.min.js"></script>
<!--bootstrap -->
<link rel="stylesheet" href="/RedseaPlatform/skins/library/bootstrap-3.3.0/css/bootstrap.min.css">
<script src="/RedseaPlatform/skins/library/bootstrap-3.3.0/js/bootstrap.min.js"></script>
<!--字体文件-->
<link rel="stylesheet" href="/RedseaPlatform/skins/library/bootstrap-3.3.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="/RedseaPlatform/skins/newstyle/css/iconfonts/iconfont.css" />
<script type="text/javascript" src="/RedseaPlatform/UIdemo/layer/layer.js"></script>
<!-- <script type="text/javascript" src="/RedseaPlatform/skins/library/Jcrop/Jcrop-0.9.12/js/jquery.Jcrop.min.js"></script> -->
<link rel="stylesheet" type="text/css" href="/RedseaPlatform/UIdemo2/template/css/all.css" />
<!-- <link type="text/css" rel="stylesheet" href="/RedseaPlatform/skins/library/cropper/cropper.min.css" />  -->
<!-- <script src="/RedseaPlatform/skins/library/cropper/cropper.min.js" type="text/javascript"></script> -->
<script src="/RedseaPlatform/skins/library/cropper/imagecropper.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="/RedseaPlatform/skins/library/Jcrop/Jcrop-0.9.12/css/jquery.Jcrop.min.css" /> -->
<script type="text/javascript">
	$(function(){
		var cropper = new ImageCropper(400, 400, 350, 350);
		cropper.setCanvas("cropper");
		cropper.addPreview("preview100");
		if(!cropper.isAvaiable()) {  
		    alert("Sorry, your browser doesn't support FileReader, please use Firefox3.6+ or Chrome10+ to run it.");
		    return;
		}  
		$("#wyx-upload-avatar input[name='avatar']").change(function(evt){
			var files = evt.target.files; 
			cropper.loadImage(files[0]);
			$("#wyx-upload-avatar .browser").hide();
		});
		$(".wyx-upload-btns .save").click(function(){
			window.parent.setImg(${param.index},cropper.getCroppedImageData(100,100));
			window.parent.layer.closeAll();
		});
		$(".wyx-upload-btns .cancel").click(function(){
			window.parent.layer.closeAll();
		});
	});
</script>
</head>
<body>
	<div style="width:600px;height:525px;">
		<div class="ui-dialog-content" data-role="content" style="height: 100%; zoom: 1; background: rgb(255, 255, 255);"><div class="app-wyx-upload">
		    <!-- <div class="wyx-upload-summary">支持图片格式：JPG/JPEG/PNG/GIF，文件大小2M以内。</div> -->
		    <div class="wyx-upload-content ui-dialog-content fn-clear">
		    	<div id="wyx-upload-avatar" class="avatar-box" data-role="avatar" data-name="avatar">
		    		<div class="fs-h5avatar-box" style="width:400px;height:400px">   
		    			<div class="avatar" style="left: 0px; top: 20px;">       
				    		<canvas id="cropper"></canvas>  
			    		</div>   
			    		<a class="browser" href="javascript:;" title="选择图片" style="left: 111px; top: 168px; display: block;">       
				    		<span>+</span>       
				    		<label>选择图片<input type="file" name="avatar" accept="image/jpg,image/jpeg,image/png,image/gif" class=""></label>   
			    		</a>   
			    		<div class="error-msg" style="top: 252px; display: none;">图片太小</div>   
			    		<div class="loading" style="display: none; left: 155px; top: 190px;"><span>正在保存...</span>
			    		</div>
		    		</div>
		    	</div>
				<canvas id="preview100" width="100" height="100"  style="position:absolute;left:450px;top:20px;border-radius:10%;" class="preview" ></canvas>
		    </div>
		    <div class="wyx-upload-btns">
			    <button class="btn btn-success btn-sm rotate-left">向左旋转</button>
			    <button class="btn btn-success btn-sm rotate-right">向右旋转</button>
			    <button class="btn btn-info btn-sm save">保 存</button>
			    <button class="btn btn-default btn-sm cancel">取 消</button>
		    </div>
		</div>
	</div>
</body>
</html>