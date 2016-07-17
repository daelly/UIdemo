<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="red.sea.platform.permit.login.GetUserInfo"%>
<%@ page import="red.sea.platform.permit.users.data.PtUsers"%>
<%
	String contextPath = request.getContextPath();
	request.setAttribute( "contextPath", contextPath );
	PtUsers user= GetUserInfo.getPtUsers(request);
	String rootId = user.getRootId();
	String staffId = user.getStaffId();
	String belonguintStruId = user.getBelongUnitStruId();
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>下拉选择</title>
	<style type="text/css">
		.select2-container--default.select2-container--focus .select2-selection--multiple {
			border: 1px solid #ccc;
		}
		.select2-container--default .select2-selection--multiple {
			border: 1px solid #ccc;
		}
		.select2-container .select2-selection--single {
			height: 32px !important;
		}
	</style>
	<script>            
	    if(typeof(requreLib)!="undefined"){
	        requreLib.setplugs("select2,pubfunction");
	    }
	    
	    $(function() {
	    	//单选
	    	$('#helpType').select2();
	    	
	    	//多选
	    	$('#multiselect').select2();
	    	$('#multiselect').select2('val',['1','2']);//参数回填
	    	
			loadProcessDataList();
	    });
		
		//加载流程数据
		function loadProcessDataList(){
			$.ajax({
				url : "${contextPath}/PubGridComhelp.mc?method=queryAllList" ,
				type : "post",
				dataType:"json",
				data : {
					HELP_ID : "getProcessType",
					formId : 'kq_leave',
					belonguintStruId : '<%=belonguintStruId%>',
					rootId : '<%=rootId%>'
				},
				success : function(result) {
					var datas = result.datas;
					var html = "";
					$("#processType").empty();
					if(datas != null &&　datas.length > 0) {
						rendListByTemplate($("#processTemplate"), $("#processType"), datas);
					}else {
						html = "<option>暂无数据</option>";
					}

					$('#processType').select2();
				},
				error :function(result){
					window.top.rsMessageBox.error('提示',"查询数据出错");
				}
			});
		}
		
	</script>
</head>
<body>
	<div>	
		<label>select2输入下拉选择框：</label><a target="blank" href="https://select2.github.io/examples.html">官方示例</a>
		<br/>
		单选：<select id="helpType" class="form-control" style="width: 80px;height: 30px;">
			<option value="" selected="selected">全部</option>
			<option value="1">列表</option>
			<option value="2">树形</option>
		</select>
		&nbsp;多选：<select id="multiselect" style="width: 200px;height: 30px; " class="form-control multiple" multiple="multiple">
			<option value="" selected="selected">全部</option>
			<option value="1">列表</option>
			<option value="2">树形</option>
		</select>
		<br/>
		<pre style="margin-top: 5px;">
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">调用方式：</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">1、引入select2插件</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">直接引入：</span>
<span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px"><</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:13px">link</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">href</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;/RedseaPlatform/skins/library/select2/css/select2.min.css&quot;</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">rel</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;stylesheet&quot;</span><span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">></span>
<span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px"><</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:13px">script</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">type</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;text/javascript&quot;</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">src</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;/RedseaPlatform/skins/library/select2/js/select2.min.js&quot;</span><span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">></</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:13px">script</span><span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">></span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">新版按需加载方式：</span>
<span style=";font-family:Consolas;color:rgb(127,0,85);font-weight:bold;font-size:13px">if</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">(</span><span style=";font-family:Consolas;color:rgb(127,0,85);font-weight:bold;font-size:13px">typeof</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">(requreLib)!=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&quot;undefined&quot;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">){</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;</span> <span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">&nbsp;requreLib.setplugs(</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&quot;select2&quot;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">);</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px"></span> <span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">}</span> 
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">2、调用</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">单选形式：</span><span style="font-family: Consolas;color: rgb(0, 0, 0);font-size: 13px">$(</span><span style="font-family: Consolas;color: rgb(42, 0, 255);font-size: 13px">&#39;#helpType&#39;</span><span style="font-family: Consolas;color: rgb(0, 0, 0);font-size: 13px">).select2();</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">多选形式：给select元素添加&nbsp;multiple=&quot;multiple&quot;&nbsp;属性</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">&nbsp;$(</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&#39;#multiselect&#39;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">).select2();</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">&nbsp;</span>$(</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&#39;#multiselect&#39;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">).select2(</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&#39;val&#39;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">,[</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&#39;1&#39;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">,</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&#39;2&#39;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">]);//参数回填</span>
		</pre>
	</div>
	<div>	
		<label>select2数据源为通用数据选择：</label>
		<br/>
		<select id="processType" name="processType" class="form-control" validate="required" style="width: 150px;"></select>
		<!--流程选择模板-->
		<script id="processTemplate" type="text/template">
			<option value="【DEF_PROCESS_ID】" packageId="【PACKAGE_ID】" defProcessId="【DEF_PROCESS_ID】" processType="【PROCESS_TYPE】" version="【VERSION】">【PROCESS_NAME】</option>
		</script>
		<pre style="margin-top: 5px;">
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">调用方式：</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">1、引入select2插件和</span><span style=";font-family:Consolas;color:rgb(0,0,0);text-underline:single;font-size:13px">pubfunction</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">公共</span><span style=";font-family:Consolas;color:rgb(0,0,0);text-underline:single;font-size:13px">js</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">直接引入：</span>
<span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&lt;</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:13px">link</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">href</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;/RedseaPlatform/skins/library/select2/css/select2.min.css&quot;&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">rel</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;stylesheet&quot;</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">/&gt;</span>
<span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&lt;</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:13px">script</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">type</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;text/javascript&quot;</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">src</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;/RedseaPlatform/skins/library/select2/js/select2.min.js&quot;</span><span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&gt;&lt;/</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:13px">script</span><span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&gt;</span>
<span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&lt;</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:13px">script</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">src</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;/RedseaPlatform/skins/js/common/pubfunction.js&quot;&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">type</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;text/javascript&quot;</span><span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&gt;&lt;/</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:13px">script</span><span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&gt;</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">新版按需加载方式：</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">if(</span><span style=";font-family:Consolas;color:rgb(0,0,0);text-underline:single;font-size:13px">typeof</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">(requreLib)!=&quot;undefined&quot;){</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">&nbsp;&nbsp;&nbsp;requreLib.setplugs(&quot;select2,</span><span style=";font-family:Consolas;color:rgb(0,0,0);text-underline:single;font-size:13px">pubfunction</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">&quot;);</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">}</span> &nbsp;
<span style=";font-family:Consolas;font-size:13px">&nbsp;</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">2、定义option模板</span>
<span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&lt;</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:13px">script</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">id</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;processTemplate&quot;</span><span style=";font-family:Consolas;font-size:13px">&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,127);font-size:13px">type</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">=</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-style:italic;font-size:13px">&quot;text/template&quot;</span><span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&gt;</span>
<span style=";font-family:Consolas;font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;&lt;option&nbsp;value=&quot;【D</span><span style=";font-family:Consolas;color:rgb(0,0,0);text-underline:single;font-size:13px">EF</span><span style=";font-family:Consolas;font-size:13px">_PROCESS_ID】&quot;&nbsp;packageId=&quot;【PACKAGE_ID】&quot;</span><span style=";font-family:Consolas;color:rgb(0,0,0);text-underline:single;font-size:13px">&nbsp;d</span><span style=";font-family:Consolas;font-size:13px">efProcessId=&quot;【DEF_PROCESS_ID】&quot;&nbsp;processType=&quot;【PROCESS_TYPE】&quot;&nbsp;version=&quot;【VERSION】&quot;&gt;</span>
<span style=";font-family:Consolas;font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;【PROCESS_NAME】</span>
<span style=";font-family:Consolas;font-size:13px">&nbsp;&nbsp;&nbsp;&nbsp;&lt;/option&gt;</span>
<span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&lt;/</span><span style=";font-family:Consolas;color:rgb(63,127,127);font-size:13px">script</span><span style=";font-family:Consolas;color:rgb(0,128,128);font-size:13px">&gt;</span>
<span style=";font-family:Consolas;font-size:13px">&nbsp;</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">3、异步加载通用选择数据</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">//加载流程数据</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">$.ajax({</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">url&nbsp;:&nbsp;</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&quot;${contextPath}/PubGridComhelp.mc?method=queryAllList&quot;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">&nbsp;,</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">type&nbsp;:&nbsp;</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&quot;post&quot;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">,</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">dataType:</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&quot;json&quot;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">,</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">data&nbsp;:&nbsp;{</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">HELP_ID&nbsp;:&nbsp;</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&quot;getProcessType&quot;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">,</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">formId&nbsp;:&nbsp;</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&#39;kq_leave&#39;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">,</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">belonguintStruId&nbsp;:&nbsp;&#39;</span><span style=";font-family:Consolas;color:rgb(191,95,63);font-size:13px">&lt;%=</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">belonguintStruId</span><span style=";font-family:Consolas;color:rgb(191,95,63);font-size:13px">%&gt;</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&#39;,</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">rootId&nbsp;:&nbsp;&#39;</span><span style=";font-family:Consolas;color:rgb(191,95,63);font-size:13px">&lt;%=</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">rootId</span><span style=";font-family:Consolas;color:rgb(191,95,63);font-size:13px">%&gt;</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&#39;</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">},</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">success&nbsp;:&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,85);font-weight:bold;font-size:13px">function</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">(result)&nbsp;{</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(127,0,85);font-weight:bold;font-size:13px">var</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">&nbsp;datas&nbsp;=&nbsp;result.datas;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(127,0,85);font-weight:bold;font-size:13px">var</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">&nbsp;html&nbsp;=&nbsp;</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&quot;&quot;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">$(</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&quot;#processType&quot;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">).empty();</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(127,0,85);font-weight:bold;font-size:13px">if</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">(datas&nbsp;!=&nbsp;</span><span style=";font-family:Consolas;color:rgb(127,0,85);font-weight:bold;font-size:13px">null</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">&nbsp;&amp;&amp;　datas.length&nbsp;&gt;&nbsp;0)&nbsp;{</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">rendListByTemplate($(</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&quot;#processTemplate&quot;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">),</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:宋体;color:rgb(0,0,0);font-size:13px"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">$(</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&quot;#processType&quot;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">),&nbsp;datas);</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">}</span><span style=";font-family:Consolas;color:rgb(127,0,85);font-weight:bold;font-size:13px">else</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">&nbsp;{</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">html&nbsp;=&nbsp;</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&quot;&lt;option&gt;暂无数据&lt;/option&gt;&quot;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">}</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;font-size:13px">&nbsp;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">$(</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&#39;#processType&#39;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">).select2();</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">},</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">error&nbsp;:</span><span style=";font-family:Consolas;color:rgb(127,0,85);font-weight:bold;font-size:13px">function</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">(result){</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">window.top.rsMessageBox.error(</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&#39;提示&#39;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">,</span><span style=";font-family:Consolas;color:rgb(42,0,255);font-size:13px">&quot;查询数据出错&quot;</span><span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">);</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">}</span>
<span style=";font-family:Consolas;color:rgb(0,0,0);font-size:13px">});</span>
		</pre>
	</div>
</body>
</html>