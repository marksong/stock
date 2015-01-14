package com.maxfittings.stock.common;

import java.util.List;
import java.util.Map;
public class MailUtil {
	
	
	/**
	 * 
	 */
	public static boolean sendMail(String title, List<Map<String, Long>> list, String corpName, String corpAddr, String telephone, String mail, String contactName) {
		return Send.sendMail(getStringOfMailContent(list) + getDetailOfCorp(corpName, corpAddr, telephone, mail, contactName), title);
	}
	
	public static String getStringOfMailContent(List<Map<String, Long>> list){
		StringBuilder sb = new StringBuilder("");
		sb.append("<table width=100% border=2 cellpadding=2>")
			.append("<thead>")
			.append("<th width=20%>")
			.append("ID")
			.append("</th>")
			.append("<th width=20%>")
			.append("库存")
			.append("</th>")
			.append("<th width=60%>")
			.append("订购数量")
			.append("</th>")
		.append("</thead>");
		sb.append("<tbody>");
		for(Map<String, Long> map :list){
			sb.append("<tr>")
				.append("<td>")
				.append(map.get("id"))
				.append("</td>")
				.append("<td>")
				.append(map.get("stock"))
				.append("</td>")
				.append("<td>")
				.append(map.get("book"))
				.append("</td>")
			.append("</tr>");
		}
		sb.append("</tbody>")
		.append("</table>");
		return sb.toString();
	}
	
	
	public static String getDetailOfCorp(String corpName, String corpAddr, String telephone, String mail, String contactName){
		StringBuilder  sb = new StringBuilder("");
		sb.append("<table width=50% border=2 cellpadding=2> style=\"margin:0 auto\"")
			.append("<tbody>")
				.append("<tr>")
					.append("<td align=\"right\" width=50%>")
					.append("公司名称：")
					.append("</td>")
					.append("<td width=50%>")
					.append(corpName)
					.append("</td>")
				.append("</tr>")
				.append("<tr>")
					.append("<td align=\"right\" width=50%>")
					.append("公司地址：")
					.append("</td>")
					.append("<td width=50%>")
					.append(corpAddr)
					.append("</td>")
				.append("</tr>")				
				.append("<tr>")
					.append("<td align=\"right\" width=50%>")
					.append("联系电话：")
					.append("</td>")
					.append("<td width=50%>")
					.append(telephone)
					.append("</td>")
				.append("</tr>")				
				.append("<tr>")
					.append("<td align=\"right\" width=50%>")
					.append("邮箱：")
					.append("</td>")
					.append("<td width=50%>")
					.append(mail)
					.append("</td>")
				.append("</tr>")				
				.append("<tr>")
					.append("<td align=\"right\" width=50%>")
					.append("联系人姓名：")
					.append("</td>")
					.append("<td width=50%>")
					.append(contactName)
					.append("</td>")
				.append("</tr>")				
			.append("<tbody>")
		.append("</table>");
		return sb.toString();
	}
}
