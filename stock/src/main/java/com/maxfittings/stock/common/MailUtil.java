package com.maxfittings.stock.common;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.util.StringUtil;

import sun.swing.StringUIClientPropertyKey;

public class MailUtil {
	// 发件人使用发邮件的电子信箱服务器
	private static String smtpHost = "smtp.163.com";
	
	/**
	 * 
	 * @param smtpFrom 发邮件的出发地（发件人的信箱）
	 * @param smtpTo 发邮件的目的地（收件人信箱）
	 */
	public static boolean sendMail(String smtpFrom, String smtpTo, String title, String content) {
		try {
			if(StringUtils.isAnyBlank(smtpFrom,smtpTo)) return false;
			
			// 创建 properties ，里面包含了发送邮件服务器的地址。
			Properties props = new Properties();
			// 发送邮件服务器的地址
			props.setProperty("mail.smtp.host", smtpHost);
			props.setProperty("mail.smtp.socketFactory.fallback", "false");
			// 通过验证 默认为false
			props.setProperty("mail.smtp.auth", "true");
			// 设置端口(测试可不设置)
//			props.setProperty("mail.smtp.port", "25");
//			props.setProperty("mail.smtp.socketFactory.port", "25");

			final String username = "hxk4613@163.com";// 发送人账户
			final String password = "168345";// 发送人密码
			// 校验发信人权限
			Session session = Session.getDefaultInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});
			// 创建 邮件的message，message对象包含了邮件众多有的部件，都是封装成了set方法去设置的
			MimeMessage msg = new MimeMessage(session);
			// 设置发信人
			msg.setFrom(new InternetAddress(smtpFrom));
			// 收信人
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(smtpTo));
			// 邮件标题
			msg.setSubject(MimeUtility.encodeText("Java邮件测试", "UTF-8", "B"));
			// 邮件内容
			msg.setContent("这是用Java写的发送电子邮件的测试程序！", "text/html;charset=UTF-8");
			msg.setSentDate(new Date());
			// 保存以上工作
			msg.saveChanges();
			// Transport transport = session.getTransport("smtp");
			// 发送邮件
			Transport.send(msg);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
}
