package com.maxfittings.stock.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.security.Security;
import java.text.SimpleDateFormat;
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
import javax.mail.internet.MimeMessage;

import org.apache.commons.lang3.StringUtils;

import com.sun.net.ssl.internal.ssl.Provider;

public class Send {
	private static URL mailConfigPath = MailUtil.class.getClassLoader().getResource("mailConfig.properties");
	private static URL receiversConfig = MailUtil.class.getClassLoader().getResource("receiversConfig.config");
	private static Send mail = new Send();


	public static boolean sendMail(String Email_Text, String subject) {

		boolean sendFlag = true;

		Security.addProvider(new Provider());

		Session session = null;
		Transport transport = null;

		try {
			Properties props = new Properties();
			props.load(new FileInputStream(new File(mailConfigPath.toURI())));
			final String senderAccount = props.getProperty("senderAccount"); 
			final String senderPassword = props.getProperty("senderPassword");
			session = Session.getInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(senderAccount, senderPassword);
				}
			});
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(senderAccount));
			message.setSubject(subject);
			message.addRecipients(Message.RecipientType.TO, getReceivers(receiversConfig.toURI()).toArray(new InternetAddress[0]));
			System.out.println("html:::::::"+Email_Text);
			System.out.println("subject:::::::"+subject);
			message.setContent(Email_Text, "text/html; charset=UTF-8");
			transport = session.getTransport("smtp");
			transport.connect(props.getProperty("mail.smtp.host"), senderAccount, senderPassword);
			transport.sendMessage(message, message.getAllRecipients());
			System.out.println("===============邮件发送成功=================");
			System.out.println("发送主题：" + subject);
			System.out.println("发送时间：" + getDate());
		} catch (Exception e) {
			sendFlag = false;
			System.out.println("发送时间：" + getDate());
		}
		try {
			if (transport != null)
				transport.close();
		} catch (Exception localException1) {
		}

		return sendFlag;
	}
	public static List<InternetAddress> getReceivers(URI uri) throws IOException, URISyntaxException, AddressException{
		List<InternetAddress> receivers = new ArrayList<InternetAddress>();
		FileReader reader = new FileReader(new File(uri));
		BufferedReader bReader = new BufferedReader(reader);
		String temp = null;
		while(!StringUtils.isBlank(temp = bReader.readLine())){
			receivers.add(new InternetAddress(temp));
		}
		bReader.close();
		return receivers;
	}
	public String returnMessage(String Email_Text, String subject) {
		boolean flag = sendMail(Email_Text, subject);
		StringBuilder sb = new StringBuilder();
		if (flag) {
			sb.append("\n").append("邮件发送已成功").append("\t").append("\n");
			sb.append("邮件正文为：" + Email_Text).append("\t").append("\n");
			sb.append("发送时间是：" + getDate()).append("\t").append("\n");
		} else {
			sb.append("\n").append("邮件发送失败").append("\t").append("\n");
			sb.append("发送时间是：" + getDate()).append("\t").append("\n");
		}
		return sb.toString();
	}

	public static void main(String[] args) {
		StringBuffer theMessage = new StringBuffer();
		theMessage.append("<h2><font color=red>您好</font></h2>");
		theMessage.append("<hr>");
		theMessage.append("<i>欢迎查看</i>");
		String Email_Text = theMessage.toString();
		String subject = "测试主题";
		System.out.println("===============开始发送=================");
		System.out.println(mail.returnMessage(MailUtil.getStringOfMailContent(new ArrayList<Map<String, Long>>()), subject));
		System.out.println("===============发送结束=================");
	}
	public static String getDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		return sdf.format(date);
	}
}

