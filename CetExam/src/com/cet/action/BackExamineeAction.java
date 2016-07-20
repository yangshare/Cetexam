package com.cet.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.cet.pojo.Examinee;
import com.cet.service.ObjectService;

public class BackExamineeAction {

	@Resource
	ObjectService objectService;
	private String candidateNo;
	private List<Examinee> examinees;
	private Examinee examinee;
	private static File image;// 定义文件
	private static String imageFileName;// 定义文件名（相对路径）
	private int curPage; // 当前显示的页面
	private int maxPage; // 总的页面数
	int perPageRow = 6; // 每页显示的记录数

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getMaxPage() {
		int maxRow = objectService.getObject("Examinee").size();
		if (maxRow % perPageRow == 0) {
			maxPage = maxRow / perPageRow;
		} else {
			maxPage = maxRow / perPageRow + 1;
		}
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	String result = "";

	// wu~~
	public static File getImage() {
		return image;
	}

	@SuppressWarnings("static-access")
	public void setImage(File image) {
		this.image = image;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	@SuppressWarnings("static-access")
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public Examinee getExaminee() {
		return examinee;
	}

	public void setExaminee(Examinee examinee) {
		this.examinee = examinee;
	}

	public List<Examinee> getExaminees() {
		return examinees;
	}

	public void setExaminees(List<Examinee> examinees) {
		this.examinees = examinees;
	}

	public String getCandidateNo() {
		return candidateNo;
	}

	public void setCandidateNo(String candidateNo) {
		this.candidateNo = candidateNo;
	}

	/**
	 * 获得考生信息
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getexaminee() {
		List<Examinee> examinees = objectService.validation("Examinee",
				candidateNo);
		if (examinees.size() != 0) {
			examinee = (Examinee) objectService.getObjectById(Examinee.class,
					candidateNo);// 通过准考证号查询考生信息
			result = "getexaminee";
			return result;
		} else {
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("error",
					"<script>alert('准考证号输入错误，请查正后再输入');</script>");
			return "back";
		}
	}

	/**
	 * 查询成绩
	 * 
	 * @return
	 */
	public String getgrades() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String candidateNo = request.getParameter("candidateNo");
		if (candidateNo != null) {
			examinee = (Examinee) objectService.getObjectById(Examinee.class,
					candidateNo);// 通过准考证号查询考生信息
			result = "getgrades";
		}
		System.out.println(candidateNo + "success");
		return result;

	}

	/**
	 * 将图片上传到服务器
	 */
	@SuppressWarnings("deprecation")
	static void upload() {
		try {
			InputStream is = new FileInputStream(image); // 从流中读取数据
			OutputStream os = new FileOutputStream(ServletActionContext
					.getRequest().getRealPath("images/examinee")
					+ "/" + imageFileName); // 输出数据
			int i = 0;
			byte[] cs = new byte[1025];

			// 读出图片
			while ((i = is.read(cs)) != -1) { // 只有读到末尾时i才为-1
				os.write(cs, 0, i);
			}
			os.close();
			is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//添加学生跳转
	public String link() {
		return "success";
	}
	//修改学生返回列表
	@SuppressWarnings("unchecked")
	public String linkUpdateExamineePage() {
		curPage=1;
		this.examinees = objectService.page("Examinee", (curPage - 1)
				* perPageRow, perPageRow);
		return "execute";
	}
	//删除学生返回列表
	@SuppressWarnings("unchecked")
	public String linkDeleteExaminee() {
		curPage=1;
		this.examinees = objectService.page("Examinee", (curPage - 1)
				* perPageRow, perPageRow);
		return "execute";
	}

	/**
	 * 得到所有的考生对象
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String execute() {
		this.examinees = objectService.page("Examinee", (curPage - 1)
				* perPageRow, perPageRow);
		return "execute";
	}

	@SuppressWarnings("unchecked")
	public String result() {
		this.examinees = objectService.page("Examinee", (curPage - 1)
				* perPageRow, perPageRow);
		return "result";
	}

	/**
	 * 通过考号删除考生
	 * 
	 * @return
	 */
	public String delete() {
		objectService.delete(Examinee.class, candidateNo);
		return "delete";
	}

	/**
	 * 通过考号获取考生对象
	 * 
	 * @return
	 */
	public String getExamineeByCandidateNo() {
		this.examinee = (Examinee) objectService.getObjectById(Examinee.class,
				candidateNo);
		return "getExamineeByCandidateNo";
	}

	/**
	 * 实现考生信息的修改
	 * 
	 * @return
	 */
	public String update() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String candidateNo = request.getParameter("candidateNo");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String examineeOfSchool = request.getParameter("examineeOfSchool");
		String eImage = request.getParameter("examineeImage");
		String password = request.getParameter("password");
		String email = request.getParameter("email");

		String examineeImage = null;

		Examinee examinee = (Examinee) objectService.getObjectById(
				Examinee.class, candidateNo);

		// 只有图片被改变后才重新上传
		if (eImage.equals(examinee.getImage())) {
			examineeImage = eImage;
		} else {
			examineeImage = "images/examinee/" + imageFileName;
			upload();
		}

		examinee.setCandidate(candidateNo);
		examinee.setName(name);
		examinee.setSex(sex);
		examinee.setSchool(examineeOfSchool);
		examinee.setImage(examineeImage);
		examinee.setPassword(password);
		examinee.setEmail(email);

		objectService.update(examinee);
		return "update";
	}

	/**
	 * 添加考生
	 * 
	 * @return
	 */
	public String add() {

		HttpServletRequest request = ServletActionContext.getRequest();
		String candidateNo = request.getParameter("candidateNo");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String examineeOfSchool = request.getParameter("examineeOfSchool");
		String examineeImage = "images/examinee/" + imageFileName;
		String password = request.getParameter("password");
		String email = request.getParameter("email");

		upload(); // 上传图片

		Examinee examinee = new Examinee();
		examinee.setCandidate(candidateNo);
		examinee.setName(name);
		examinee.setSex(sex);
		examinee.setSchool(examineeOfSchool);
		examinee.setImage(examineeImage);
		examinee.setPassword(password);
		examinee.setEmail(email);
		

		objectService.save(examinee);
		return "add";
	}

}
