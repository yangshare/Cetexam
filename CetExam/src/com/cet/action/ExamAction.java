package com.cet.action;

import java.util.List;

import javax.annotation.Resource;

import com.cet.pojo.Exam;
import com.cet.pojo.Test;
import com.cet.service.ObjectService;
import com.cet.tool.AutoGATest;
import com.opensymphony.xwork2.ActionSupport;

public class ExamAction extends ActionSupport {

	/**
	 * 考试场次
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	private ObjectService objectService;

	// field
	private Integer id;
	private String examname;
	private String time;
	private String beginno;
	private String endno;
	private String teacher;
	private String position;
	private Test test;// 生成的试卷
	private float difficulty;

	private String message;// 用于JSP页面显示提示信息
	private Exam exam;
	private List<Exam> examList;
	
	// paging
	private int curPage = 1; // 当前显示的页面
	private int maxPage; // 总的页面数
	private int perPageRow = 6; // 每页显示的记录数
	
	// action默认方法
	@SuppressWarnings("unchecked")
	public String execute() {
		this.examList = objectService.page("Exam", (curPage - 1) * perPageRow,
				perPageRow);

		return "execute";
	}
	
	/**
	 * 去往修改页面
	 * @return
	 */
	public String gotoUpdate(){
		exam=(Exam)objectService.getObjectById(Exam.class, id);
		return "gotoUpdate";
	}
	/**
	 * 功能：修改一堂考试
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String update() {

		exam=(Exam)objectService.getObjectById(Exam.class, id);
		exam.setExamname(examname);
		exam.setTime(time);
		exam.setBeginno(beginno);
		exam.setEndno(endno);
		exam.setTeacher(teacher);
		exam.setPosition(position);

		exam.setDifficulty(difficulty);
		objectService.update(exam);
		
		//跳转到考试列表
		curPage=1;
		this.examList = objectService.page("Exam", (curPage - 1) * perPageRow,
				perPageRow);
		return "updateSuccess";
	}
	
	/**
	 * 去往添加页面
	 * @return
	 */
	public String gotoAdd(){
		return "gotoAdd";
	}

	/**
	 * 功能：添加一堂考试（并自动生成了一套试题）
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String insert() {

		exam = new Exam();
		id = objectService.getMaxID("Exam") + 1;
		exam.setId(id);
		exam.setExamname(examname);
		exam.setTime(time);
		exam.setBeginno(beginno);
		exam.setEndno(endno);
		exam.setTeacher(teacher);
		exam.setPosition(position);

		test = new AutoGATest().getGATest(objectService, difficulty, 0.8, 0.1,
				5, 80, true);// 遗传算法自动组卷并返回试卷
		if (test == null) {// 题型数量已经不够用了，无法生成新的不重复的试卷
			message = "<script>alert('Error,题库相关难度的题型不足或者题型数量已经不够用，无法生成新的不重复的试卷');</script>";
			return ERROR;
		}
		test.setId(objectService.getMaxID("Test") + 1);
		test.setName(examname);
		
		objectService.save(test);

		exam.setDifficulty(test.getDifficulty());
		exam.setTest(test);
		objectService.save(exam);
		try {
		} catch (Exception e) {
			message = "<script>alert('Error,添加考试失败');</script>";
		}

		//跳转到考试列表
		curPage=1;
		this.examList = objectService.page("Exam", (curPage - 1) * perPageRow,
				perPageRow);
		
		return SUCCESS;
	}
	
	/**
	 * 删除一堂考试
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String delete(){
		exam=(Exam)objectService.getObjectById(Exam.class, id);
		objectService.delete(exam);
		
		//跳转到考试列表
		curPage=1;
		this.examList = objectService.page("Exam", (curPage - 1) * perPageRow,
				perPageRow);
		
		return "deleteSuccess";
	}

	// Property accessors
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getExamname() {
		return examname;
	}

	public void setExamname(String examname) {
		this.examname = examname;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getTeacher() {
		return teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

	public String getBeginno() {
		return beginno;
	}

	public void setBeginno(String beginno) {
		this.beginno = beginno;
	}

	public String getEndno() {
		return endno;
	}

	public void setEndno(String endno) {
		this.endno = endno;
	}

	public void setTest(Test test) {
		this.test = test;
	}

	public Test getTest() {
		return test;
	}

	public void setDifficulty(float difficulty) {
		this.difficulty = difficulty;
	}

	public float getDifficulty() {
		return difficulty;
	}

	/**
	 * @param examList the examList to set
	 */
	public void setExamList(List<Exam> examList) {
		this.examList = examList;
	}

	/**
	 * @return the examList
	 */
	public List<Exam> getExamList() {
		return examList;
	}

	/**
	 * @param maxPage the maxPage to set
	 */
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	/**
	 * @return the maxPage
	 */
	public int getMaxPage() {
		int maxRow = objectService.getAllObjects("Test").size();
		if (maxRow % perPageRow == 0) {
			maxPage = maxRow / perPageRow;
		} else {
			maxPage = maxRow / perPageRow + 1;
		}
		return maxPage;
	}

	/**
	 * @param exam the exam to set
	 */
	public void setExam(Exam exam) {
		this.exam = exam;
	}

	/**
	 * @return the exam
	 */
	public Exam getExam() {
		return exam;
	}
}
