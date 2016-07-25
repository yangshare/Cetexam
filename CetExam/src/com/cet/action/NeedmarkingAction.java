package com.cet.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cet.pojo.Needmarking;
import com.cet.service.ObjectService;

public class NeedmarkingAction {
	@Resource
	ObjectService objectService;
	private String candidateNo;
	private List<Needmarking> list;
    private Needmarking needmarking;
    private int curPage;	//当前显示的页面
	private int maxPage;	//总的页面数
	int perPageRow = 6;		//每页显示的记录数
	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getMaxPage() {
		int maxRow = objectService.getObject("Needmarking").size();
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

    public String getCom_grade() {
		return com_grade;
	}

	public void setCom_grade(String comGrade) {
		com_grade = comGrade;
	}

	public String getTrs_grade() {
		return trs_grade;
	}

	public void setTrs_grade(String trsGrade) {
		trs_grade = trsGrade;
	}
	private String com_grade;
    private String trs_grade;
	public Needmarking getNeedmarking() {
		return needmarking;
	}

	public void setNeedmarking(Needmarking needmarking) {
		this.needmarking = needmarking;
	}

	public List<Needmarking> getList() {
		return list;
	}

	public void setList(List<Needmarking> list) {
		this.list = list;
	}

	/**
	 * 获取试题列表
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String list(){
		list=objectService.page("Needmarking",(curPage-1)*perPageRow,perPageRow);
		return "list";
	}
	public String currect(){
		String candidateNo=ServletActionContext.getRequest().getParameter("candidateNo");
		needmarking=(Needmarking)objectService.getObjectById(Needmarking.class, candidateNo);
		return "currect";
	}
     
	/**
	 * 评分
	 * @return
	 */
//	public String grade(){
//		Examinee examinee=(Examinee)objectService.getObjectById(Examinee.class, candidateNo);
//		examinee.setComprehensivingGrade(examinee.getComprehensivingGrade()+Double.parseDouble(trs_grade));
//		examinee.setWritingGrade(Double.parseDouble(com_grade));
//		examinee.setTotal(examinee.getComprehensivingGrade()+Double.parseDouble(com_grade)+examinee.getReadingGrade()+examinee.getListeningGrade());
//		objectService.update(examinee);
//		
//		java.util.Calendar c=java.util.Calendar.getInstance();    
//        SimpleDateFormat f=new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss");    
//        System.out.println(f.format(c.getTime()));    
//		needmarking=(Needmarking)objectService.getObjectById(Needmarking.class, candidateNo);
//		needmarking.setStatus("已改");
//		needmarking.setTime(f.format(new Date()));
//		objectService.update(needmarking);
//		
//		return "grade";
//	}
	public String getCandidateNo() {
		return candidateNo;
	}
	public void setCandidateNo(String candidateNo) {
		this.candidateNo = candidateNo;
	}

	
}
