<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/html.tld" prefix="html"%>
<%
	String contextPath = request.getContextPath();
	request.setAttribute( "contextPath", contextPath );
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>自定义标签</title>
	<script>            
	    if(typeof(requreLib)!="undefined"){
	        requreLib.setplugs("select2,pubfunction");
	    }
	</script>
</head>
<body>
	<!-- 菜单权限标签 -->
	<div>	
		<label>功能按钮权限标签(对应功能按钮的 function_ID 【pt_menu_sub_function表】 )：</label>
		 <html:hasFuncPermisson name="wqb_share" type="funBt">
			权限过滤区域 功能按钮权限 
		 </html:hasFuncPermisson>
		<pre style="margin-top: 5px;">
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">调用方式：</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">1、引入自定义标签文件：</span>
<span style=";font-family:Consolas;color:rgb(191,95,63);font-size:13px">&lt;%@</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:13px">taglib</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">uri</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;/WEB-INF/html.tld&quot;</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">prefix</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;html&quot;</span><span style=";font-family:Consolas;color:rgb(191,95,63);font-size:13px">%&gt;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">;</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">2、调用</span>
<span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&lt;</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:13px">html:hasFuncPermisson</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">name</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;wqb_share&quot;</span><span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&gt;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">;</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;外勤宝分享菜单权限</span>
<span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&lt;/</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:13px">html:hasFuncPermisson</span><span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&gt;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">;</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">其中name属性值为需要过滤的菜单功能function_id值，type=funBt或type为空表示过滤功能按钮权限，如果当前登录用户拥有该菜单权限则显示标签内内容</span>
		</pre>
	</div>
	
		<!-- 菜单权限标签 -->
	<div>	
		<label>菜单权限标签(对应菜单的 Menu_ID【pt_menu】表)：</label>
		 <html:hasFuncPermisson name="HRM0101" type="menu">
			菜单权限(对应菜单的 Menu_ID【pt_menu】表)
		 </html:hasFuncPermisson>
		<pre style="margin-top: 5px;">
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">调用方式：</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">1、引入自定义标签文件：</span>
<span style=";font-family:Consolas;color:rgb(191,95,63);font-size:13px">&lt;%@</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:13px">taglib</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">uri</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;/WEB-INF/html.tld&quot;</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">prefix</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;html&quot;</span><span style=";font-family:Consolas;color:rgb(191,95,63);font-size:13px">%&gt;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">;</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">2、调用</span>
    <span style=";font-family:Consolas;color:rgb(0,0,0);font-size:15px"></span><span style=";font-family:Consolas;color:rgb(0,128,128);font-size:15px">&lt;</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:15px">html:hasFuncPermisson</span><span style=";font-family:Consolas;font-size:15px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:15px">name</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:15px">=</span><em><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:15px">&quot;HRM0101&quot;</span></em><span style=";font-family:Consolas;font-size:15px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:15px">type</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:15px">=</span><em><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:15px">&quot;</span></em><em><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:15px;background:rgb(255,255,0);background:rgb(255,255,0)">menu</span></em><em><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:15px">&quot;</span></em><span style=";font-family:Consolas;color:rgb(0,128,128);font-size:15px">&gt;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:15px"></span>
    <span style=";font-family:Consolas;color:rgb(0,0,0);font-size:15px">菜单权限(对应菜单的 Menu_ID【pt_menu】表)</span>
    <span style=";font-family:Consolas;color:rgb(0,0,0);font-size:15px"></span><span style=";font-family:Consolas;color:rgb(0,128,128);font-size:15px">&lt;/</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:15px">html:hasFuncPermisson</span><span style=";font-family:Consolas;color:rgb(0,128,128);font-size:15px">&gt;</span>
    <br/>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">其中name属性值为需要过滤的菜单功能menuId值，type=menu 表示过滤菜单类型的权限如果当前登录用户拥有该菜单权限则显示标签内内容</span>
		</pre>
	</div>
	
	
	<!-- 超级管理员权限标签 -->
	<div>	
		<label>超级管理员权限标签：</label>
		<html:hasSuperRole>
			超级管理员权限
		</html:hasSuperRole>
		<pre style="margin-top: 5px;">
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">调用方式：</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">1、引入自定义标签文件：</span>
<span style=";font-family:Consolas;color:rgb(191,95,63);font-size:13px">&lt;%@</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:13px">taglib</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">uri</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;/WEB-INF/html.tld&quot;</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">prefix</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;html&quot;</span><span style=";font-family:Consolas;color:rgb(191,95,63);font-size:13px">%&gt;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">;</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">2、调用</span>
<span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&lt;</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:13px">html:hasSuperRole</span><span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&gt;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">;</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;超级管理员权限</span>
<span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&lt;/</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:13px">html:hasSuperRole</span><span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&gt;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">;</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">如果当前登录用户拥有超级管理员角色则显示标签内内容</span>
		</pre>
	</div>
	
	<!-- 角色权限标签 -->
	<div>	
		<label>角色权限标签：</label>
		<html:hasRole name="wqb_zongjingli,wqb_jingli,wqb_renshizhuanyuan">
			   角色权限
		</html:hasRole>
		<pre style="margin-top: 5px;">
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">调用方式：</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">1、引入自定义标签文件：</span>
<span style=";font-family:Consolas;color:rgb(191,95,63);font-size:13px">&lt;%@</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:13px">taglib</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">uri</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;/WEB-INF/html.tld&quot;</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">prefix</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;html&quot;</span><span style=";font-family:Consolas;color:rgb(191,95,63);font-size:13px">%&gt;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">;</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">2、调用</span>
<span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&lt;</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:13px">html:hasRole</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">name</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;wqb_zongjingli,wqb_jingli,wqb_renshizhuanyuan&quot;</span><span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&gt;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">;</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;角色权限</span>
<span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&lt;</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:13px">html:hasRole</span><span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&gt;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">;</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">其中name属性值为需要过滤的角色code值，如果当前登录用户拥有指定的角色则显示标签内内容</span>
		</pre>
	</div>
</body>
</html>