package com.cet.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;


import com.cet.pojo.Teacher;
import com.cet.service.ObjectService;

public class UpdateTeacherPwdAction {
	@Resource
	ObjectService objectService;
	private Teacher teacher;
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	private String id;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	private String newpwd;
	public String getNewpwd() {
		return newpwd;
	}
	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}
	
	private String newpwdagain;
	public String getNewpwdagain() {
		return newpwdagain;
	}
	public void setNewpwdagain(String newpwdagain) {
		this.newpwdagain = newpwdagain;
	}
	/**
	 * 获取密码
	 *
	 */
	 public String currectpassword(){
		 HttpServletRequest request = ServletActionContext.getRequest();
		 int id = Integer.parseInt(request.getParameter("id"));
		 System.out.println(id);
		 teacher=(Teacher)objectService.getObjectById(Teacher .class, id);
		 return "currectpassword";
	 }
	/**
	 * 修改密码
	 * @return
	 */
	public String currectpwd(){
		
			System.out.println(id);
			int id1=Integer.parseInt(id);
			teacher=(Teacher)objectService.getObjectById(Teacher.class, id1);
			teacher.setPassword(newpwd);
			objectService.update(teacher);
			return "currectpwd";
		
	}
}
