package com.adultexample.utils;


/**
 * <p>
 *title:PageInfo.java
 *�Զ���Page���󣬰�����ҳ������Ϣ�ͷ�ҳҳ����Ϣ
 *</p>
 *Description ��������һ�������������ļ����ܡ�
 *
 *���ߣ�andyliu 2018-9-30����03:10:46
 *@version 1.0
 */
public class PageStr{
	private com.github.pagehelper.PageInfo page;
	 private String pageStr;
	//ƴ�ӷ�ҳ ҳ�漰JS����
		public String getPageStr() {
			StringBuffer sb = new StringBuffer();
			if(page.getTotal()>0){
				sb.append("	<ul class=\"pagination pull-right no-margin\">\n");
				if(page.getPageNum()==1){
					sb.append("	<li><a>��<font color=red>"+page.getTotal()+"</font>��</a></li>\n");
					sb.append("	<li><input type=\"number\" value=\"\" id=\"toGoPage\" style=\"width:50px;text-align:center;float:left\" placeholder=\"ҳ��\"/></li>\n");
					sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"toTZ();\"  class=\"btn btn-mini btn-success\">��ת</a></li>\n");
					sb.append("	<li><a>��ҳ</a></li>\n");
					sb.append("	<li><a>��ҳ</a></li>\n");
				}else{
					sb.append("	<li><a>��<font color=red>"+page.getTotal()+"</font>��</a></li>\n");
					sb.append("	<li><input type=\"number\" value=\"\" id=\"toGoPage\" style=\"width:50px;text-align:center;float:left\" placeholder=\"ҳ��\"/></li>\n");
					sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"toTZ();\"  class=\"btn btn-mini btn-success\">��ת</a></li>\n");
					sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage(1)\">��ҳ</a></li>\n");
					sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage("+(page.getPageNum()-1)+")\">��ҳ</a></li>\n");
				}
				
				int showTag = 5;//��ҳ��ǩ��ʾ����
				int startTag = 1;
				if(page.getPageNum()>showTag){
					startTag = page.getPageNum()-1;
				}
				int endTag = startTag+showTag-1;
				for(int i=startTag; i<=page.getPages() && i<=endTag; i++){
					if(page.getPageNum()==i)
						sb.append("<li class=\"active\"><a><font color='white'>"+i+"</font></a></li>\n");
					else
						sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage("+i+")\">"+i+"</a></li>\n");
				}
				
				if(page.getPageNum()==page.getPages()){
					sb.append("	<li><a>��ҳ</a></li>\n");
					sb.append("	<li><a>βҳ</a></li>\n");
				}else{
					sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage("+(page.getPageNum()+1)+")\">��ҳ</a></li>\n");
					sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage("+page.getPages()+")\">βҳ</a></li>\n");
				}
				sb.append("	<li><a>��"+page.getPages()+"ҳ</a></li>\n");
				sb.append("	<li><select title='��ʾ����' style=\"width:55px;float:left;margin-top:1px;\" onchange=\"changeCount(this.value)\">\n");
				sb.append("	<option value='"+page.getPageSize()+"'>"+page.getPageSize()+"</option>\n");
				sb.append("	<option value='2'>2</option>\n");
				sb.append("	<option value='5'>5</option>\n");
				sb.append("	<option value='10'>10</option>\n");
				sb.append("	</select>\n");
				sb.append("	</li>\n");
				
				sb.append("</ul>\n");
				sb.append("<script type=\"text/javascript\">\n");
				
				//��ҳ����
				sb.append("function nextPage(page){");
				sb.append("	if(true && document.forms[0]){\n");
				sb.append("		var url = document.forms[0].getAttribute(\"action\");\n");
				sb.append("document.getElementById(\"pageNumber\").value=page;\n");
				sb.append("document.getElementById(\"pageSize\").value="+page.getPageSize()+";\n");
				sb.append("		document.forms[0].action = url;\n");
				sb.append("		document.forms[0].submit();\n");
				sb.append("	}else{\n");
				sb.append("		var url = document.location+'';\n");
				sb.append("		if(url.indexOf('?')>-1){\n");
				sb.append("			if(url.indexOf('pageNumber')>-1){\n");
				sb.append("				var reg = /pageNumber=\\d*/g;\n");
				sb.append("				url = url.replace(reg,'pageNumber=');\n");
				sb.append("			}else{\n");
				sb.append("				url += \"&"+("pageNumber")+"=\";\n");
				sb.append("			}\n");
				sb.append("		}else{url += \"?"+("pageNumber")+"=\";}\n");
				sb.append("		url = url + page + \"&" +("pageSize")+"="+page.getPageSize()+"\";alert(url)\n");
				sb.append("		document.location = url;\n");
				sb.append("	}\n");
				sb.append("}\n");
				
				//����ÿҳ��ʾ����
				sb.append("function changeCount(value){ console.log(\"����size==\"+value);");
//				sb.append(" top.jzts();");
				sb.append("	if(true && document.forms[0]){\n");
				sb.append("		var url = document.forms[0].getAttribute(\"action\");\n");

				sb.append("document.getElementById(\"pageSize\").value=value;\n");
				
				sb.append("		if(url.indexOf('?')>-1){url += \"&"+("page.pageNumber")+"=\";}\n");
				sb.append("		else{url += \"?"+("pageNumber")+"=\";}\n");
				sb.append("		url = url + \"1&" +("pageSize")+"=\"+value;\n");
				sb.append("		document.forms[0].action = url;\n ");
				sb.append("		document.forms[0].submit();\n");
				sb.append("	}else{\n");
				sb.append("		var url = document.location+'';\n");
				sb.append("		if(url.indexOf('?')>-1){\n");
				sb.append("			if(url.indexOf('currentPage')>-1){\n");
				sb.append("				var reg = /currentPage=\\d*/g;\n");
				sb.append("				url = url.replace(reg,'currentPage=');\n");
				sb.append("			}else{\n");
				sb.append("				url += \"1&"+("pageNumber")+"=\";\n");
				sb.append("			}\n");
				sb.append("		}else{url += \"?"+("pageNumber")+"=\";}\n");
				sb.append("		url = url + \"&" +("pageSize")+"=\"+value;\n");
				sb.append("		document.location = url;\n");
				sb.append("	}\n");
				sb.append("}\n");
				
				//��ת���� 
				sb.append("function toTZ(){");
				sb.append("var toPaggeVlue = document.getElementById(\"toGoPage\").value;");
				sb.append("if(toPaggeVlue == ''){document.getElementById(\"toGoPage\").value=1;return;}");
				sb.append("if(isNaN(Number(toPaggeVlue))){document.getElementById(\"toGoPage\").value=1;return;}");
				sb.append("nextPage(toPaggeVlue);");
				sb.append("}\n");
				sb.append("</script>\n");
			}
			pageStr = sb.toString();
			return pageStr;
		}
		
		public void setPageStr(String pageStr) {
			this.pageStr = pageStr;
		}

		public com.github.pagehelper.PageInfo getPage() {
			return page;
		}

		public void setPage(com.github.pagehelper.PageInfo page) {
			this.page = page;
		}

		public PageStr(com.github.pagehelper.PageInfo page) {
			super();
			this.page = page;
		}
		public PageStr() {
			super();
		}
		
}