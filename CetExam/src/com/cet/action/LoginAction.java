package com.cet.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.cet.service.ObjectService;
import com.opensymphony.xwork2.ActionContext;

public class LoginAction {
	@Resource 
	ObjectService objectService;
	
	private String username;   	//定义用户登录姓名
	
	private String password;	//定义用户密码
	
	private String type;	//定义用户的类型
	
	@SuppressWarnings("unchecked")
	private List lists;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@SuppressWarnings("unchecked")
	public List getLists() {
		return lists;
	}

	@SuppressWarnings("unchecked")
	public void setLists(List lists) {
		this.lists = lists;
	}

	public String execute() throws IOException{
		
		//将登录的用户保存在session中
		HttpServletRequest request = ServletActionContext.getRequest();
		ActionContext context = ActionContext.getContext();
		context.getSession().put("username", username);
		context.getSession().put("password", password);
		
		this.lists = objectService.check(type, username, password);
		//对用户的登录信息进行验证
		if(objectService.check(type, username, password).size()!=0){
			if(type.equals("管理员")){
				return "admin";
			}
			else{
			//	context.getSession().put("lists", lists);
				return "teacher";
			}
		}
		else {
			request.setAttribute("fail","<script>alert('用户名或密码错误');</script>");
			return "fail";
		}
	}
	
	
	
	
}
