package com.maxfittings.stock.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.commons.lang3.StringUtils;

public class MailUtil {
	
	private static URL mailConfigPath = MailUtil.class.getClassLoader().getResource("mailConfig.properties");
	private static URL receiversConfig = MailUtil.class.getClassLoader().getResource("receiversConfig.config");
	
	/**
	 * 
	 * @param smtpFrom 发邮件的出发地（发件人的信箱）
	 * @param smtpTo 发邮件的目的地（收件人信箱）
	 */
	public static boolean sendMail(String title, List<Map<String, Long>> list) {
		try {
			// 创建 properties ，里面包含了发送邮件服务器的地址。
			Properties props = new Properties();
			props.load(new FileInputStream(new File(mailConfigPath.toURI())) );
			final String senderAccount = props.getProperty("senderAccount"); 
			final String senderPassword = props.getProperty("senderPassword"); 
			// 校验发信人权限
			Session session = Session.getDefaultInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(senderAccount, senderPassword);
				}
			});
			// 创建 邮件的message，message对象包含了邮件众多有的部件，都是封装成了set方法去设置的
			MimeMessage msg = new MimeMessage(session);
			// 设置发信人
			msg.setFrom(new InternetAddress(senderAccount));
			// 收信人
			msg.addRecipients(Message.RecipientType.TO, getReceivers().toArray(new InternetAddress[0]));
			// 邮件标题
			msg.setSubject(MimeUtility.encodeText(title, "utf8", "B"));
			
			
//			MimeBodyPart part = new MimeBodyPart();
//			part.setContent(getStringOfMailContent(list), "text/html; charset=\"UTF-8\"");
//			part.setHeader("MIME-Version", "1.0");
//			part.setHeader("Content-Type", "text/html; charset=\"UTF-8\"");
			// 邮件内容
			msg.setHeader("Content-Transfer-Encoding", "Base64");
			msg.setContent(getStringOfMailContent(list), "text/html;charset=utf8");
			msg.setSentDate(new Date());
			// 保存以上工作
			msg.saveChanges();
			session.getTransport().send(msg);
			// 发送邮件
//			Transport.send(msg);
			
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	public static String getStringOfMailContent(List<Map<String, Long>> list){
		StringBuffer sb = new StringBuffer("<html><body><table>");
		sb.append("<thead>")
			.append("<th width=30%>")
			.append("ID")
			.append("</th>")
			.append("<th width=30%>")
			.append("库存")
			.append("</th>")
			.append("<th width=40%>")
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
		.append("</table></body></html>");
		return sb.toString();
	}
	public static List<InternetAddress> getReceivers() throws IOException, URISyntaxException, AddressException{
		List<InternetAddress> receivers = new ArrayList<InternetAddress>();
		FileReader reader = new FileReader(new File(receiversConfig.toURI()));
		BufferedReader bReader = new BufferedReader(reader);
		String temp = null;
		while(!StringUtils.isBlank(temp = bReader.readLine())){
			receivers.add(new InternetAddress(temp));
		}
		bReader.close();
		return receivers;
	}
}
