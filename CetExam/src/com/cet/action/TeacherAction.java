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

import com.cet.pojo.Teacher;
import com.cet.service.ObjectService;
import com.opensymphony.xwork2.ActionContext;
public class TeacherAction {

	@Resource
	ObjectService objectService;

	private int id;
 
	private Teacher teacher;

	private List<Teacher> teachers;

	private static File image;	//定义文件
	
	private static String imageFileName;	//定义文件名（相对路径）
	private int curPage;	//当前显示的页面
	private int maxPage;	//总的页面数
	int perPageRow = 6;		//每页显示的记录数
    
	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	
	//
	@SuppressWarnings("unchecked")
	public String tleft(){
		ActionContext context = ActionContext.getContext();
		String username = (String) context.getSession().get("username");
		String password = (String) context.getSession().get("password");
		teachers = (List<Teacher>) objectService.check("教师", username, password);
		return "tleft";
	}
	public int getMaxPage() {
		int maxRow = objectService.getAllObjects("Teacher").size();
		if(maxRow % perPageRow == 0){
			maxPage = maxRow / perPageRow;
		}else{
			maxPage = maxRow / perPageRow+1;
		}
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	@SuppressWarnings("deprecation")
	
	/**
	 * 实现图片上传到服务器
	 */
	static void upload(){
		try {
			InputStream is = new FileInputStream(image);	//从流中读取数据
			OutputStream os = new FileOutputStream(ServletActionContext.getRequest().getRealPath("images/teachers")+"/"+imageFileName);	//输出数据
			int i = 0;
			byte[] cs = new byte[1025];
			
			//读出图片
			while((i=is.read(cs))!=-1){	//只有读到末尾时i才为-1
				os.write(cs,0,i);
			}
			os.close();
			is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 超链接
	 * @return
	 */
	public String link() {
		return "success";
	}
	
	@SuppressWarnings("unchecked")
	public String linkUpdateTeacherPage() {
		this.teachers = objectService.page("Teacher",(curPage-1)*perPageRow,perPageRow);
		return "updateTeacherPage";
	}
	
	@SuppressWarnings("unchecked")
	public String linkDeleteTeacher() {
		this.teachers = objectService.page("Teacher",(curPage-1)*perPageRow,perPageRow);
		return "deleteTeacher";
	}

	/**
	 * 得到所有的教师对象
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String execute() {
		this.teachers = objectService.page("Teacher",(curPage-1)*perPageRow,perPageRow);
		return "execute";
	}

	/**
	 * 通过id删除教师
	 * @return
	 */
	public String delete() {
		objectService.delete(Teacher.class, id);
		return "delete";
	}

	/**
	 * 通过id获取教师对象
	 * @return
	 */
	public String getTeacherById() {
		this.teacher = (Teacher) objectService.getObjectById(Teacher.class, id);
		return "getTeacherById";
	}

	/**
	 * 实现教师信息的修改
	 * @return
	 */
	public String update(){
		
		HttpServletRequest request = ServletActionContext.getRequest();
		int id = Integer.parseInt(request.getParameter("id"));
		String teacherName = request.getParameter("teacherName");
		String password = request.getParameter("password");
		String teacherOfSchool = request.getParameter("teacherOfSchool");
		String tImage = request.getParameter("teacherImage");
		
		String teacherImage = null;
		
		Teacher teacher = (Teacher) objectService.getObjectById(Teacher.class, id);
		
		//只有图片改变的时候才重新上传
		if(tImage.equals(teacher.getImage())){
			teacherImage = tImage;
		} else {
			teacherImage = "images/teachers/"+imageFileName;
			upload();
		}
		
		teacher.setTeachername(teacherName);
		teacher.setPassword(password);
		teacher.setSchool(teacherOfSchool);
		teacher.setImage(teacherImage);
		
		objectService.update(teacher);
		return "update";
	}

	/**
	 * 添加教师
	 * @return
	 */
	public String add() {

		HttpServletRequest request = ServletActionContext.getRequest();
		String teacherName = request.getParameter("teacherName");
		String password = request.getParameter("password");
		String teacherOfSchool = request.getParameter("teacherOfSchool");
		String teacherImage = "images/teachers/"+imageFileName;
		
		upload();	//上传图片

		Teacher teacher = new Teacher();
		teacher.setTeachername(teacherName);
		teacher.setPassword(password);
		teacher.setSchool(teacherOfSchool);
		teacher.setImage(teacherImage);

		objectService.save(teacher);
		return "add";
	}
	public File getImage() {
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public List<Teacher> getTeachers() {
		return teachers;
	}

	public void setTeachers(List<Teacher> teachers) {
		this.teachers = teachers;
	}
	
}
