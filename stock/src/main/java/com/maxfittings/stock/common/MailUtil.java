package com.maxfittings.stock.common;

import java.util.List;
import java.util.Map;
public class MailUtil {
	
	
	/**
	 * 
	 */
	public static boolean sendMail(String title, List<Map<String, Long>> list) {
		return Send.sendMail(getStringOfMailContent(list), title);
	}
	
	public static String getStringOfMailContent(List<Map<String, Long>> list){
		StringBuffer sb = new StringBuffer("");
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
}
