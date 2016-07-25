package com.cet.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.cet.pojo.BaseCarereading;
import com.cet.pojo.BaseListening;
import com.cet.pojo.BaseLongreading;
import com.cet.pojo.BaseTranslate;
import com.cet.pojo.BaseWordunderstand;
import com.cet.pojo.BaseWriting;
import com.cet.pojo.Examinee;
import com.cet.pojo.Needmarking;
import com.cet.pojo.SeedCarereading;
import com.cet.pojo.SeedListening;
import com.cet.pojo.Test;
import com.cet.service.ObjectService;
import com.cet.tool.AutoGATest;
import com.opensymphony.xwork2.ActionSupport;

public class TestAction extends ActionSupport {
	/**
	 * 试题
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	private ObjectService objectService;

	// Fields
	private Integer id;
	private String name;
	private BaseWriting baseWriting;
	private BaseListening baseListening;
	private BaseWordunderstand baseWordunderstand;
	private BaseLongreading baseLongreading;
	private BaseCarereading baseCarereading1;
	private BaseCarereading baseCarereading2;
	private BaseTranslate baseTranslate;
	// 前台传入
	private int testid;// 要考试的试卷ID
	private float difficulty;// 自动组卷难度要求
	// 传入前台
	private List<Test> testList;
	private Test test;
	private String message;// 前台显示的信息
	// paging
	private int curPage = 1; // 当前显示的页面
	private int maxPage; // 总的页面数
	private int perPageRow = 6; // 每页显示的记录数

	// 获取考试
	public String toDBTest() {
		String mode = ServletActionContext.getRequest().getParameter("mode") != null ? "Testing"
				: "";
		ServletActionContext.getRequest().getSession().setAttribute("mode",
				mode);
		test = (Test) objectService.getObjectById(Test.class, testid);
		if (test == null) {
			message = "<script>alert('Error,获取试题失败');</script>";
			if (mode.equals("Testing"))
				return "index";
			else
				return "exerciselist";
		}
		ServletActionContext.getRequest().getSession().setAttribute("Test",
				test);
		return "testing";
	}

	// 获取自动组卷的考试
	public String toGATest() {
		ServletActionContext.getRequest().getSession().setAttribute("mode", "");

		test = new AutoGATest().getGATest(objectService, difficulty, 0.8, 0.1,
				5, 80, false);// 遗传算法自动组卷并返回试卷
		if (test == null) {// 题型数量已经不够用了，无法生成新的不重复的试卷
			message = "<script>alert('Error,题库相关难度的题型不足或者题型数量已经不够用，无法生成新的不重复的试卷');</script>";
			return "exerciselist";
		}
		ServletActionContext.getRequest().getSession().setAttribute("Test",
				test);
		return "testing";
	}

	// 交卷
	public String submitTest() {

		Test test = (Test) ServletActionContext.getRequest().getSession()
				.getAttribute("Test");

		float listeningGrade = 0, readingGrade = 0;
		float wordGrade = 0, longGrade = 0, careGrade1 = 0, careGrade2 = 0;
		// 计算听力成绩
		String listen = listen1 + listen2 + listen3 + listen4 + listen5
				+ listen6 + listen7 + listen8 + listen9 + listen10 + listen11
				+ listen12 + listen13 + listen14 + listen15 + listen16
				+ listen17 + listen18 + listen19 + listen20 + listen21
				+ listen22 + listen23 + listen24 + listen25;
		listen = listen.replace("null", "0");
		int i = 0;
		for (Iterator<SeedListening> iterator1 = test.getBaseListening()
				.getSeedListenings().iterator(); iterator1.hasNext(); i++) {
			SeedListening seed = iterator1.next();
			if (i < 15) {
				if (String.valueOf(listen.charAt(i)).equals(seed.getAnswer()))
					listeningGrade += 7.1f;
			} else {
				if (String.valueOf(listen.charAt(i)).equals(seed.getAnswer()))
					listeningGrade += 14.2f;
			}
		}
		// 计算阅读成绩
		String baseWordunderstandAnswer = test.getBaseWordunderstand()
				.getAnswer();
		for (i = 0; i < wordunderstandAnswer.length(); i++) {
			if (String.valueOf(wordunderstandAnswer.charAt(i)).equals(
					String.valueOf(baseWordunderstandAnswer.charAt(i)))) {
				readingGrade += 3.6f;
			}
		}
		wordGrade = readingGrade;// 词汇阅读成绩（总分36）
		String baseLongreadingAnswer = test.getBaseLongreading().getAnswer();
		System.out.println("长阅读" + lognreadingAnswer);
		for (i = 0; i < lognreadingAnswer.length(); i++) {
			if (String.valueOf(lognreadingAnswer.charAt(i)).equals(
					String.valueOf(baseLongreadingAnswer.charAt(i)))) {
				readingGrade += 7.1f;
			}
		}
		longGrade = readingGrade - wordGrade;// 长阅读成绩（总分71）
		String careread1 = carereading46 + carereading47 + carereading48
				+ carereading49 + carereading50;
		String careread2 = carereading51 + carereading52 + carereading53
				+ carereading54 + carereading55;
		careread1 = careread1.replace("null", "0");
		careread2 = careread2.replace("null", "0");
		i = 0;
		for (Iterator<SeedCarereading> iterator1 = test.getBaseCarereading1()
				.getSeedCarereadings().iterator(); iterator1.hasNext(); i++) {
			SeedCarereading seed = iterator1.next();
			if (String.valueOf(careread1.charAt(i)).equals(seed.getAnswer())) {
				readingGrade += 14.2f;
			}
		}
		careGrade1 = readingGrade - longGrade - wordGrade;// 仔细阅读1成绩（总分71）
		i = 0;
		for (Iterator<SeedCarereading> iterator1 = test.getBaseCarereading2()
				.getSeedCarereadings().iterator(); iterator1.hasNext(); i++) {
			SeedCarereading seed = iterator1.next();
			if (String.valueOf(careread2.charAt(i)).equals(seed.getAnswer())) {
				readingGrade += 14.2f;
			}
		}
		careGrade2 = readingGrade - longGrade - wordGrade - careGrade1;// 仔细阅读2成绩（总分71）

		Examinee examinee = (Examinee) ServletActionContext.getRequest()
				.getSession().getAttribute("Examinee");
		// 为needmarking设置值
		Needmarking needmarking = new Needmarking();
		needmarking.setExaminee(examinee);
		needmarking.setStatus("未改");
		needmarking.setTest(test);
		needmarking.setTime(new SimpleDateFormat("yyyy.MM.dd HH:mm:ss")
				.format(new Date()));
		needmarking.setWritingAnswer(writingAnswer);
		needmarking.setTranslateAnswer(translateAnswer);
		needmarking.setListeninggrade(listeningGrade);
		needmarking.setReadinggrade(readingGrade);
		objectService.save(needmarking);

		// 重设题型难度
		BaseListening baseListening = test.getBaseListening();
		baseListening.setAccess(baseListening.getAccess() + listeningGrade
				/ 248.5f);
		baseListening.setDifficulty(baseListening.getAccess()
				/ baseListening.getTotal());

		BaseWordunderstand baseWordunderstand = test.getBaseWordunderstand();
		baseWordunderstand.setAccess(baseWordunderstand.getAccess() + wordGrade
				/ 36f);
		baseWordunderstand.setDifficulty(baseWordunderstand.getAccess()
				/ baseWordunderstand.getTotal());

		BaseLongreading baseLongreading = test.getBaseLongreading();
		baseLongreading
				.setAccess(baseLongreading.getAccess() + longGrade / 71f);
		baseLongreading.setDifficulty(baseLongreading.getAccess()
				/ baseLongreading.getTotal());

		BaseCarereading baseCarereading1 = test.getBaseCarereading1();
		baseCarereading1.setAccess(baseCarereading1.getAccess() + careGrade1
				/ 71f);
		baseCarereading1.setDifficulty(baseCarereading1.getAccess()
				/ baseCarereading1.getTotal());

		BaseCarereading baseCarereading2 = test.getBaseCarereading2();
		baseCarereading2.setAccess(baseCarereading2.getAccess() + careGrade2
				/ 71f);
		baseCarereading2.setDifficulty(baseCarereading2.getAccess()
				/ baseCarereading2.getTotal());

		objectService.update(baseListening);
		objectService.update(baseWordunderstand);
		objectService.update(baseLongreading);
		objectService.update(baseCarereading1);
		objectService.update(baseCarereading2);

		if (ServletActionContext.getRequest().getSession().getAttribute("mode")
				.equals("Testing"))
			return "index";
		else {
			return "exerciselist";
		}
	}

	// 获取分页后的Test列表
	@SuppressWarnings("unchecked")
	public String pagingExercise() {
		this.testList = objectService.page("Test", (curPage - 1) * perPageRow,
				perPageRow);
		return "realexerciselist";
	}

	// 传入答题
	private String writingAnswer;
	private String listen1;
	private String listen2;
	private String listen3;
	private String listen4;
	private String listen5;
	private String listen6;
	private String listen7;
	private String listen8;
	private String listen9;
	private String listen10;
	private String listen11;
	private String listen12;
	private String listen13;
	private String listen14;
	private String listen15;
	private String listen16;
	private String listen17;
	private String listen18;
	private String listen19;
	private String listen20;
	private String listen21;
	private String listen22;
	private String listen23;
	private String listen24;
	private String listen25;
	private String wordunderstandAnswer;
	private String lognreadingAnswer;
	private String carereading45;
	private String carereading46;
	private String carereading47;
	private String carereading48;
	private String carereading49;
	private String carereading50;
	private String carereading51;
	private String carereading52;
	private String carereading53;
	private String carereading54;
	private String carereading55;
	private String translateAnswer;

	public String getCarereading45() {
		return carereading45;
	}

	public void setCarereading45(String carereading45) {
		this.carereading45 = carereading45;
	}

	public String getCarereading46() {
		return carereading46;
	}

	public void setCarereading46(String carereading46) {
		this.carereading46 = carereading46;
	}

	public String getCarereading47() {
		return carereading47;
	}

	public void setCarereading47(String carereading47) {
		this.carereading47 = carereading47;
	}

	public String getCarereading48() {
		return carereading48;
	}

	public void setCarereading48(String carereading48) {
		this.carereading48 = carereading48;
	}

	public String getCarereading49() {
		return carereading49;
	}

	public void setCarereading49(String carereading49) {
		this.carereading49 = carereading49;
	}

	public String getCarereading50() {
		return carereading50;
	}

	public void setCarereading50(String carereading50) {
		this.carereading50 = carereading50;
	}

	public String getCarereading51() {
		return carereading51;
	}

	public void setCarereading51(String carereading51) {
		this.carereading51 = carereading51;
	}

	public String getCarereading52() {
		return carereading52;
	}

	public void setCarereading52(String carereading52) {
		if (carereading52 == null)
			carereading52 = "0";
		else
			this.carereading52 = carereading52;
	}

	public String getCarereading53() {
		return carereading53;
	}

	public void setCarereading53(String carereading53) {
		if (carereading53 == null)
			carereading53 = "0";
		else
			this.carereading53 = carereading53;
	}

	public String getCarereading54() {
		return carereading54;
	}

	public void setCarereading54(String carereading54) {
		this.carereading54 = carereading54;
	}

	public String getCarereading55() {
		return carereading55;
	}

	public void setCarereading55(String carereading55) {
		this.carereading55 = carereading55;
	}

	public String getListen1() {
		return listen1;
	}

	public void setListen1(String listen1) {
		this.listen1 = listen1;
	}

	public String getListen2() {
		return listen2;
	}

	public void setListen2(String listen2) {
		this.listen2 = listen2;
	}

	public String getListen3() {
		return listen3;
	}

	public void setListen3(String listen3) {
		this.listen3 = listen3;
	}

	public String getListen4() {
		return listen4;
	}

	public void setListen4(String listen4) {
		this.listen4 = listen4;
	}

	public String getListen5() {
		return listen5;
	}

	public void setListen5(String listen5) {
		this.listen5 = listen5;
	}

	public String getListen6() {
		return listen6;
	}

	public void setListen6(String listen6) {
		this.listen6 = listen6;
	}

	public String getListen7() {
		return listen7;
	}

	public void setListen7(String listen7) {
		this.listen7 = listen7;
	}

	public String getListen8() {
		return listen8;
	}

	public void setListen8(String listen8) {
		this.listen8 = listen8;
	}

	public String getListen9() {
		return listen9;
	}

	public void setListen9(String listen9) {
		this.listen9 = listen9;
	}

	public String getListen10() {
		return listen10;
	}

	public void setListen10(String listen10) {
		this.listen10 = listen10;
	}

	public String getListen11() {
		return listen11;
	}

	public void setListen11(String listen11) {
		this.listen11 = listen11;
	}

	public String getListen12() {
		return listen12;
	}

	public void setListen12(String listen12) {
		this.listen12 = listen12;
	}

	public String getListen13() {
		return listen13;
	}

	public void setListen13(String listen13) {
		this.listen13 = listen13;
	}

	public String getListen14() {
		return listen14;
	}

	public void setListen14(String listen14) {
		this.listen14 = listen14;
	}

	public String getListen15() {
		return listen15;
	}

	public void setListen15(String listen15) {
		this.listen15 = listen15;
	}

	public String getListen16() {
		return listen16;
	}

	public void setListen16(String listen16) {
		this.listen16 = listen16;
	}

	public String getListen17() {
		return listen17;
	}

	public void setListen17(String listen17) {
		this.listen17 = listen17;
	}

	public String getListen18() {
		return listen18;
	}

	public void setListen18(String listen18) {
		this.listen18 = listen18;
	}

	public String getListen19() {
		return listen19;
	}

	public void setListen19(String listen19) {
		this.listen19 = listen19;
	}

	public String getListen20() {
		return listen20;
	}

	public void setListen20(String listen20) {
		this.listen20 = listen20;
	}

	public String getListen21() {
		return listen21;
	}

	public void setListen21(String listen21) {
		this.listen21 = listen21;
	}

	public String getListen22() {
		return listen22;
	}

	public void setListen22(String listen22) {
		this.listen22 = listen22;
	}

	public String getListen23() {
		return listen23;
	}

	public void setListen23(String listen23) {
		this.listen23 = listen23;
	}

	public String getListen24() {
		return listen24;
	}

	public void setListen24(String listen24) {
		this.listen24 = listen24;
	}

	public String getListen25() {
		return listen25;
	}

	public void setListen25(String listen25) {
		this.listen25 = listen25;
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public BaseLongreading getBaseLongreading() {
		return this.baseLongreading;
	}

	public void setBaseLongreading(BaseLongreading baseLongreading) {
		this.baseLongreading = baseLongreading;
	}

	public BaseTranslate getBaseTranslate() {
		return this.baseTranslate;
	}

	public void setBaseTranslate(BaseTranslate baseTranslate) {
		this.baseTranslate = baseTranslate;
	}

	public BaseListening getBaseListening() {
		return this.baseListening;
	}

	public void setBaseListening(BaseListening baseListening) {
		this.baseListening = baseListening;
	}

	public BaseCarereading getBaseCarereading1() {
		return this.baseCarereading1;
	}

	public void setBaseCarereading1(BaseCarereading baseCarereading1) {
		this.baseCarereading1 = baseCarereading1;
	}

	public BaseWordunderstand getBaseWordunderstand() {
		return this.baseWordunderstand;
	}

	public void setBaseWordunderstand(BaseWordunderstand baseWordunderstand) {
		this.baseWordunderstand = baseWordunderstand;
	}

	public BaseWriting getBaseWriting() {
		return this.baseWriting;
	}

	public void setBaseWriting(BaseWriting baseWriting) {
		this.baseWriting = baseWriting;
	}

	public BaseCarereading getBaseCarereading2() {
		return this.baseCarereading2;
	}

	public void setBaseCarereading2(BaseCarereading baseCarereading2) {
		this.baseCarereading2 = baseCarereading2;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setTestid(int testid) {
		this.testid = testid;
	}

	public int getTestid() {
		return testid;
	}

	public void setTestList(List<Test> testList) {
		this.testList = testList;
	}

	public List<Test> getTestList() {
		return testList;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getMaxPage() {
		int maxRow = objectService.getAllObjects("Test").size();
		if (maxRow % perPageRow == 0) {
			maxPage = maxRow / perPageRow;
		} else {
			maxPage = maxRow / perPageRow + 1;
		}
		return maxPage;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

	public float getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(float difficulty) {
		this.difficulty = difficulty;
	}

	public Test getTest() {
		return test;
	}

	public void setTest(Test test) {
		this.test = test;
	}

	public void setWritingAnswer(String writingAnswer) {
		if (writingAnswer == null)
			this.writingAnswer = "";
		else
			this.writingAnswer = writingAnswer;
	}

	public String getWritingAnswer() {
		return writingAnswer;
	}

	public void setWordunderstandAnswer(String wordunderstandAnswer) {
		if (wordunderstandAnswer == null)
			this.wordunderstandAnswer = "";
		else
			this.wordunderstandAnswer = wordunderstandAnswer;
	}

	public String getWordunderstandAnswer() {
		return wordunderstandAnswer;
	}

	public void setLognreadingAnswer(String lognreadingAnswer) {
		if (lognreadingAnswer == null)
			this.lognreadingAnswer = "";
		else
			this.lognreadingAnswer = lognreadingAnswer;
	}

	public String getLognreadingAnswer() {
		return lognreadingAnswer;
	}

	public void setTranslateAnswer(String translateAnswer) {
		if (translateAnswer == null)
			this.translateAnswer = "";
		else
			this.translateAnswer = translateAnswer;
	}

	public String getTranslateAnswer() {
		return translateAnswer;
	}
}
