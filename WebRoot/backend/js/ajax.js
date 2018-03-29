function printInfo(xml){
	var text = "<response>";
	text += "<info>";
	text += "<name>";
	text += "吴腾</name>";
	text += "<age>";
	text += "18</age>";
	text += "</info>";
	text += "</response>";

	xmlDoc = createXml(text); // 创建xml格式的内容，将直接用ajax从Servlet直接获取
	x = xmlDoc.documentElement.childNodes;
	xson = x[0].childNodes;

	// 打印表头
	var th = "<tr>";
	for(i = 0; i < xson.length; i++){
		th += "<th>"+xson[i].nodeName+"</th>";
	}
	th += "</tr>";
	
	$('#content').append(th);

	// 打印内容
	for(j = 0; j < x.length; j++){
		var td = "<tr>";
		for(i = 0; i < xson.length; i++){
			td += "<td>" + xson[i].firstChild.nodeValue + "</td>";
		}
		td += "</tr>";
	}
	$('#content').append(td);
}

// 将字符串解析为xml格式
function createXml(str){ 
if(document.all){ 
	var xmlDom=new ActiveXObject("Microsoft.XMLDOM");
	xmlDom.loadXML(str);
	return xmlDom;
} 
else
	return new DOMParser().parseFromString(str, "text/xml");
}

// js获取get参数
function getQueryString(name) { 
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
	var r = window.location.search.substr(1).match(reg); 
	if (r != null) return unescape(r[2]); return null; 
}
