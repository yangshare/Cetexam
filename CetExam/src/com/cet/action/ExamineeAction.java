package com.cet.action;

import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cet.pojo.Exam;
import com.cet.pojo.Examinee;
import com.cet.pojo.Needmarking;
import com.cet.service.ObjectService;
import com.cet.tool.MailSend;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ExamineeAction extends ActionSupport {

	/**
	 * 考生类
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	private ObjectService objectService;

	// field
	private String candidate;
	private String name;
	private String password;
	private String sex;
	private String school;
	private String image;
	private Double writinggrade;
	private Double listeninggrade;
	private Double readinggrade;
	private Double translategrade;
	private Double totalgrade;
	private String email;

	private String newpassword;

	private String message;// 前台提示信息
	private List<Exam> examList;// 反应到前台
	private Examinee examinee;// 反应到前台
	private List<Needmarking> needmarkingList;// 反应到前台

	// 功能：考生登录验证
	public String login() {
		List<?> list = objectService
				.getObjectByfield("Examinee", new String[] { "candidate",
						"password" }, new String[] { candidate, password });
		if (list.size() > 0) { // 登录成功
			ServletActionContext.getRequest().getSession().setAttribute(
					"Examinee", (Examinee) list.get(0));
			return "index";
		} else {
			if (objectService.getObjectByfield("Examinee", "candidate",
					candidate).size() > 0)
				message = "<script>alert('Error,密码错误');</script>";
			else
				message = "<script>alert('Error,账号不存在');</script>";
			return "login_false";
		}
	}

	// 功能：跳转到主页时需要的方法，得到该考生和其最近的考试 （该方法需要考生准考证号）
	public String toIndex() throws ParseException {
		message = (ActionContext.getContext().get("message") != null ? (String) ActionContext
				.getContext().get("message")
				: null);
		Examinee tempExaminee = (Examinee) ServletActionContext.getRequest()
				.getSession().getAttribute("Examinee");
		if (tempExaminee != null)
			examinee = tempExaminee;
		else {
			List<?> examineeList = objectService.getObjectByfield("Examinee",
					"candidate", candidate);
			examinee = examineeList.size() > 0 ? (Examinee) examineeList.get(0)
					: null;
		}
		if (examinee == null)
			message = "<script>alert('Error,获取考生信息失败');</script>";
		else
			candidate = examinee.getCandidate();

		// 验证考生最近是否有考试,如果存在最近考试，返回最近考试对象
		List<?> list = objectService.getAllObjects("Exam");
		examList = new ArrayList<Exam>();
		for (Object object : list) {
			Exam exam = (Exam) object;
			BigInteger begin = new BigInteger(exam.getBeginno());
			BigInteger end = new BigInteger(exam.getEndno());

			if (new BigInteger(candidate).compareTo(begin) >= 0
					&& new BigInteger(candidate).compareTo(end) <= 0) {// 该考生有考试

				long sysDate = System.currentTimeMillis();
				int diffDate = dateTODate("yyyy.MM.dd hh:mm:ss",
						exam.getTime(), sysDate);
				if (diffDate < 15 && diffDate >= -60 * 12) {// 如果考生距离考试时间前12小时到开考15分钟内
					examList.add(exam);
				}
			}
		}

		return "realindex";
	}

	// 修改密码
	public String updatePass() {
		Examinee examinee = (Examinee) ServletActionContext.getRequest()
				.getSession().getAttribute("Examinee");
		if (examinee != null && examinee.getPassword().equals(password)) {
			examinee.setPassword(newpassword);
			objectService.update(examinee);
			message = "OK，修改成功";
		} else
			message = "ERROR，原密码不正确";
		return "updatepass";
	}

	// 忘记密码
	public String forgetPass() {
		System.out.println(candidate);
		List<?> list = objectService.getObjectByfield("Examinee", "candidate",
				candidate);
		System.out.println(list.size());
		Examinee examinee = list.size() > 0 ? (Examinee) list.get(0) : null;
		if (examinee != null) {
			String message = examinee.getName()
					+ "您好，您正在进行找回密码操作，若非本人操作，请修改密码！您的原登录密码为"
					+ examinee.getPassword() + "，请注意保存您的密码。";
			if (MailSend.SendMail("smtp.qq.com", "587", examinee.getEmail(),
					"1907472272@qq.com", "找回密码", message))
				message = "OK，已发送邮件，请注意查收";
			else
				message = "ERROR，发送邮件失败";
		} else
			message = "ERROR，账号不正确";
		return "login_false";
	}

	/**
	 * 功能描述：日期相减
	 * 
	 * @param format
	 *            字符型日期转换为Date格式
	 * @param time
	 *            字符型
	 * @param sysDate
	 *            long型
	 * @return 返回time-sysDate的日期的分钟数
	 * @throws ParseException
	 */
	private int dateTODate(String format, String time, long sysDate)
			throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat(format);// 小写的mm表示的是分钟
		Date date = sdf.parse(time);// 数据库的时间转Date

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		long intDate = calendar.getTimeInMillis();
		return (int) ((sysDate - intDate) / (1000 * 60));
	}

	// 显示成绩
	public String showGrade() {

		List<?> list = objectService.getObjectByfield("Needmarking",
				new String[] { "candidate", "status" }, new String[] {
						candidate, "已改" });
		if (list.size() > 0) {
			needmarkingList = new ArrayList<Needmarking>();
			for (int i = 0; i < list.size(); i++) {
				needmarkingList.add((Needmarking) list.get(i));
			}
			return "showgrade";
		} else {
			ActionContext.getContext().put("message",
					"<script>alert('Error,查询成绩失败,尚无成绩');</script>");
			return "index";
		}
	}

	// Property accessors
	public String getCandidate() {
		return candidate;
	}

	public void setCandidate(String candidate) {
		this.candidate = candidate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Double getWritinggrade() {
		return writinggrade;
	}

	public void setWritinggrade(Double writinggrade) {
		this.writinggrade = writinggrade;
	}

	public Double getListeninggrade() {
		return listeninggrade;
	}

	public void setListeninggrade(Double listeninggrade) {
		this.listeninggrade = listeninggrade;
	}

	public Double getReadinggrade() {
		return readinggrade;
	}

	public void setReadinggrade(Double readinggrade) {
		this.readinggrade = readinggrade;
	}

	public Double getTranslategrade() {
		return translategrade;
	}

	public void setTranslategrade(Double translategrade) {
		this.translategrade = translategrade;
	}

	public Double getTotalgrade() {
		return totalgrade;
	}

	public void setTotalgrade(Double totalgrade) {
		this.totalgrade = totalgrade;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setExamList(List<Exam> examList) {
		this.examList = examList;
	}

	public List<Exam> getExamList() {
		return examList;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

	public Examinee getExaminee() {
		return examinee;
	}

	public void setExaminee(Examinee examinee) {
		this.examinee = examinee;
	}

	public List<Needmarking> getNeedmarkingList() {
		return needmarkingList;
	}

	public void setNeedmarkingList(List<Needmarking> needmarkingList) {
		this.needmarkingList = needmarkingList;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public String getNewpassword() {
		return newpassword;
	}
}
