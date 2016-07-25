package com.cet.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import javax.annotation.Resource;
import org.apache.struts2.ServletActionContext;

import com.cet.pojo.BaseCarereading;
import com.cet.pojo.BaseListening;
import com.cet.pojo.BaseLongreading;
import com.cet.pojo.BaseTranslate;
import com.cet.pojo.BaseWordunderstand;
import com.cet.pojo.BaseWriting;
import com.cet.pojo.SeedCarereading;
import com.cet.pojo.SeedListening;
import com.cet.pojo.Test;
import com.cet.service.ObjectService;
import com.opensymphony.xwork2.ActionSupport;

public class BackTestAction extends ActionSupport {
	/**
	 * 试题
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	private ObjectService objectService;

	// Fields

	private BaseWriting baseWriting;
	private BaseListening baseListening;
	private BaseWordunderstand baseWordunderstand;
	private BaseLongreading baseLongreading;
	private BaseCarereading baseCarereading1;
	private BaseCarereading baseCarereading2;
	private BaseTranslate baseTranslate;
	private SeedListening seedListening;
	private SeedCarereading seedCarereading;
	// 前台传入
	private int testid;// 要考试的试卷ID
	// 传入前台
	private List<Test> testList;
	private Test test;
	// paging
	private int curPage = 1; // 当前显示的页面
	private int maxPage; // 总的页面数
	private int perPageRow = 6; // 每页显示的记录数
	// 听力
	private static File listen;// 定义文件
	private static String listenFileName;// 定义文件名（相对路径）
	// 试题信息
	private Integer id;
	private String name;
	// 作文
	private String writing;
	// 听力
	private String material;//听力材料
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
	private String listenAnswer1;
	private String listenAnswer2;
	private String listenAnswer3;
	private String listenAnswer4;
	private String listenAnswer5;
	private String listenAnswer6;
	private String listenAnswer7;
	private String listenAnswer8;
	private String listenAnswer9;
	private String listenAnswer10;
	private String listenAnswer11;
	private String listenAnswer12;
	private String listenAnswer13;
	private String listenAnswer14;
	private String listenAnswer15;
	private String listenAnswer16;
	private String listenAnswer17;
	private String listenAnswer18;
	private String listenAnswer19;
	private String listenAnswer20;
	private String listenAnswer21;
	private String listenAnswer22;
	private String listenAnswer23;
	private String listenAnswer24;
	private String listenAnswer25;
	// 词汇理解
	private String wordunderstand;
	private String wordunderstandAnswer;
	// 长篇阅读
	private String longreading;

	private String longreadingAnswer;
	// 仔细阅读
	private String carereadingA;
	private String carereadingB;
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
	private String carereadingAnswer46;
	private String carereadingAnswer47;
	private String carereadingAnswer48;
	private String carereadingAnswer49;
	private String carereadingAnswer50;
	private String carereadingAnswer51;
	private String carereadingAnswer52;
	private String carereadingAnswer53;
	private String carereadingAnswer54;
	private String carereadingAnswer55;
	// 翻译
	private String translate;

	/**
	 * *************************************************************************
	 * action方法 ****************************************************************
	 * *************************************************************************
	 */

	// action默认方法
	@SuppressWarnings("unchecked")
	public String execute() {
		this.testList = objectService.page("Test", (curPage - 1) * perPageRow,
				perPageRow);
		return "execute";
	}

	/**
	 * 超链接
	 * 
	 * @return
	 */
	public String link() {
		return "success";
	}

	/**
	 * 通过testid获取一套试题
	 * 
	 * @return
	 */
	public String queryTestById() {

		test = (Test) objectService.getObjectById(Test.class, testid);

		return "getTest";
	}

	/**
	 * 删除试题成功
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String detectTestSuccess() {
		curPage = 1;
		this.testList = objectService.page("Test", (curPage - 1) * perPageRow,
				perPageRow);

		return "detectTestSuccess";
	}

	/**
	 * 通过testid删除一套试题
	 * 
	 * @return
	 */
	public String deleteTest() {
		// 获取一套试题
		test = (Test) objectService.getObjectById(Test.class, testid);
		// 删除作文
		objectService.delete(test.getBaseWriting());
		// 删除听力
		for (SeedListening seedListening : test.getBaseListening()
				.getSeedListenings()) {
			objectService.delete(seedListening);
		}
		objectService.delete(test.getBaseListening());
		// 删除词汇理解
		objectService.delete(test.getBaseWordunderstand());
		// 删除长阅读
		objectService.delete(test.getBaseLongreading());
		// 删除仔细阅读
		for (SeedCarereading seedCarereading : test.getBaseCarereading1()
				.getSeedCarereadings()) {
			objectService.delete(seedCarereading);
		}
		objectService.delete(test.getBaseCarereading1());
		for (SeedCarereading seedCarereading : test.getBaseCarereading2()
				.getSeedCarereadings()) {
			objectService.delete(seedCarereading);
		}
		objectService.delete(test.getBaseCarereading2());
		// 删除翻译
		objectService.delete(test.getBaseTranslate());

		objectService.delete(test);

		return "successDel";
	}

	/**
	 * 修改试题成功
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String updateTestSuccess() {
		curPage = 1;
		this.testList = objectService.page("Test", (curPage - 1) * perPageRow,
				perPageRow);
		return "updateTestSuccess";
	}

	/**
	 * 修改一套题
	 * 
	 * @return
	 */
	public String updateTest() {
		
		test = (Test)objectService.getObjectById(Test.class, testid);// 一套题对象
		
		test.setName(name);
		
		// 道题对象
		baseWriting = test.getBaseWriting();
		baseListening = test.getBaseListening();
		baseWordunderstand = test.getBaseWordunderstand();
		baseLongreading = test.getBaseLongreading();
		baseCarereading1 = test.getBaseCarereading1();
		baseCarereading2 = test.getBaseCarereading2();
		baseTranslate = test.getBaseTranslate();

		// 作文
		baseWriting.setTitle(writing);
		objectService.update(baseWriting);
		// 听力1-25个选项
		String[] listens = new String[25];
		listens[0] = listen1;
		listens[1] = listen2;
		listens[2] = listen3;
		listens[3] = listen4;
		listens[4] = listen5;
		listens[5] = listen6;
		listens[6] = listen7;
		listens[7] = listen8;
		listens[8] = listen9;
		listens[9] = listen10;
		listens[10] = listen11;
		listens[11] = listen12;
		listens[12] = listen13;
		listens[13] = listen14;
		listens[14] = listen15;
		listens[15] = listen16;
		listens[16] = listen17;
		listens[17] = listen18;
		listens[18] = listen19;
		listens[19] = listen20;
		listens[20] = listen21;
		listens[21] = listen22;
		listens[22] = listen23;
		listens[23] = listen24;
		listens[24] = listen25;

		String[] listenAnswers = new String[25];
		listenAnswers[0] = listenAnswer1;
		listenAnswers[1] = listenAnswer2;
		listenAnswers[2] = listenAnswer3;
		listenAnswers[3] = listenAnswer4;
		listenAnswers[4] = listenAnswer5;
		listenAnswers[5] = listenAnswer6;
		listenAnswers[6] = listenAnswer7;
		listenAnswers[7] = listenAnswer8;
		listenAnswers[8] = listenAnswer9;
		listenAnswers[9] = listenAnswer10;
		listenAnswers[10] = listenAnswer11;
		listenAnswers[11] = listenAnswer12;
		listenAnswers[12] = listenAnswer13;
		listenAnswers[13] = listenAnswer14;
		listenAnswers[14] = listenAnswer15;
		listenAnswers[15] = listenAnswer16;
		listenAnswers[16] = listenAnswer17;
		listenAnswers[17] = listenAnswer18;
		listenAnswers[18] = listenAnswer19;
		listenAnswers[19] = listenAnswer20;
		listenAnswers[20] = listenAnswer21;
		listenAnswers[21] = listenAnswer22;
		listenAnswers[22] = listenAnswer23;
		listenAnswers[23] = listenAnswer24;
		listenAnswers[24] = listenAnswer25;
		
		//修改听力材料
		if(!baseListening.getMaterialurl().trim().equals(material.trim())){
			baseListening.setListeningname(listenFileName);
			baseListening.setMaterialurl("listening/" + listenFileName);
			upload(listen,listenFileName);// 上传听力材料
			objectService.update(baseListening);
		}else{
			System.out.println("听力材料没变**************");
		}
		//遍历修改听力选项
		int i=0;
		for (SeedListening seedListening : baseListening.getSeedListenings()) {
			
			seedListening.setOptions(listens[i]);
			seedListening.setAnswer(listenAnswers[i]);
			objectService.update(seedListening);
			i++;
		}		

		// 词汇理解
		baseWordunderstand.setOptions(wordunderstand);
		baseWordunderstand.setAnswer(wordunderstandAnswer);
		objectService.update(baseWordunderstand);
		// 长篇阅读
		baseLongreading.setEssay("");
		baseLongreading.setOptions(longreading);
		baseLongreading.setAnswer(longreadingAnswer);
		objectService.update(baseLongreading);
		// 仔细阅读
		String[] carereadings = new String[10];
		carereadings[0] = carereading46;
		carereadings[1] = carereading47;
		carereadings[2] = carereading48;
		carereadings[3] = carereading49;
		carereadings[4] = carereading50;

		carereadings[5] = carereading51;
		carereadings[6] = carereading52;
		carereadings[7] = carereading53;
		carereadings[8] = carereading54;
		carereadings[9] = carereading55;

		String[] carereadingAnswers = new String[10];
		carereadingAnswers[0] = carereadingAnswer46;
		carereadingAnswers[1] = carereadingAnswer47;
		carereadingAnswers[2] = carereadingAnswer48;
		carereadingAnswers[3] = carereadingAnswer49;
		carereadingAnswers[4] = carereadingAnswer50;

		carereadingAnswers[5] = carereadingAnswer51;
		carereadingAnswers[6] = carereadingAnswer52;
		carereadingAnswers[7] = carereadingAnswer53;
		carereadingAnswers[8] = carereadingAnswer54;
		carereadingAnswers[9] = carereadingAnswer55;

		baseCarereading1.setEssay(carereadingA);
		objectService.update(baseCarereading1);
		
		
		int j=0;
		for (SeedCarereading seedCarereading : baseCarereading1
				.getSeedCarereadings()) {
			seedCarereading.setOptions(carereadings[j]);
			seedCarereading.setAnswer(carereadingAnswers[j]);
			objectService.update(seedCarereading);
			j++;
		}

		baseCarereading2.setEssay(carereadingB);
		objectService.update(baseCarereading2);

		int k=5;
		for (SeedCarereading seedCarereading : baseCarereading2
				.getSeedCarereadings()) {
			seedCarereading.setOptions(carereadings[k]);
			seedCarereading.setAnswer(carereadingAnswers[k]);
			objectService.update(seedCarereading);
			k++;
		}

		// 翻译
		baseTranslate.setEssay(translate);
		objectService.update(baseTranslate);

		objectService.update(test);

		return "successUpdate";
	}

	/**
	 * 跳转到修改试题页面
	 * 
	 * @return
	 */
	public String gotoUpdate() {

		test = (Test) objectService.getObjectById(Test.class, testid);

		return "updateTest";
	}

	/**
	 * 新增试题标题
	 * 
	 * @return
	 */
	public String gotoAdd() {

		return "addTest";
	}

	/**
	 * 增加一套题
	 * 
	 * @return
	 */
	public String addTest() {
		id = objectService.getMaxID("Test") + 1;
		test = new Test();// 一套题对象
		test.setId(id);
		test.setName(name);
		// 道题对象
		baseWriting = new BaseWriting();
		baseListening = new BaseListening();
		baseWordunderstand = new BaseWordunderstand();
		baseLongreading = new BaseLongreading();
		baseCarereading1 = new BaseCarereading();
		baseCarereading2 = new BaseCarereading();
		baseTranslate = new BaseTranslate();

		// 获取前台信息
		// 作文
		baseWriting.setId(objectService.getMaxID("BaseWriting") + 1);
		baseWriting.setTitle(writing);
		baseWriting.setDifficulty(Float.parseFloat("0"));
		baseWriting.setAccess(Float.parseFloat("0"));
		baseWriting.setTotal(0);
		objectService.save(baseWriting);
		// 听力1-25个选项
		String[] listens = new String[25];
		listens[0] = listen1;
		listens[1] = listen2;
		listens[2] = listen3;
		listens[3] = listen4;
		listens[4] = listen5;
		listens[5] = listen6;
		listens[6] = listen7;
		listens[7] = listen8;
		listens[8] = listen9;
		listens[9] = listen10;
		listens[10] = listen11;
		listens[11] = listen12;
		listens[12] = listen13;
		listens[13] = listen14;
		listens[14] = listen15;
		listens[15] = listen16;
		listens[16] = listen17;
		listens[17] = listen18;
		listens[18] = listen19;
		listens[19] = listen20;
		listens[20] = listen21;
		listens[21] = listen22;
		listens[22] = listen23;
		listens[23] = listen24;
		listens[24] = listen25;

		String[] listenAnswers = new String[25];
		listenAnswers[0] = listenAnswer1;
		listenAnswers[1] = listenAnswer2;
		listenAnswers[2] = listenAnswer3;
		listenAnswers[3] = listenAnswer4;
		listenAnswers[4] = listenAnswer5;
		listenAnswers[5] = listenAnswer6;
		listenAnswers[6] = listenAnswer7;
		listenAnswers[7] = listenAnswer8;
		listenAnswers[8] = listenAnswer9;
		listenAnswers[9] = listenAnswer10;
		listenAnswers[10] = listenAnswer11;
		listenAnswers[11] = listenAnswer12;
		listenAnswers[12] = listenAnswer13;
		listenAnswers[13] = listenAnswer14;
		listenAnswers[14] = listenAnswer15;
		listenAnswers[15] = listenAnswer16;
		listenAnswers[16] = listenAnswer17;
		listenAnswers[17] = listenAnswer18;
		listenAnswers[18] = listenAnswer19;
		listenAnswers[19] = listenAnswer20;
		listenAnswers[20] = listenAnswer21;
		listenAnswers[21] = listenAnswer22;
		listenAnswers[22] = listenAnswer23;
		listenAnswers[23] = listenAnswer24;
		listenAnswers[24] = listenAnswer25;

		baseListening.setId(objectService.getMaxID("BaseListening") + 1);
		baseListening.setListeningname(listenFileName);
		baseListening.setMaterialurl("listening/" + listenFileName);
		baseListening.setDifficulty(Float.parseFloat("0"));
		baseListening.setAccess(Float.parseFloat("0"));
		baseListening.setTotal(0);
		objectService.save(baseListening);
		if(listen!=null)
			upload(listen,listenFileName);// 上传听力材料
		int seedListeningid = objectService.getMaxID("SeedListening");

		for (int i = 0; i < 25; i++) {
			seedListening = new SeedListening();
			seedListening.setId(seedListeningid + 1 + i);
			seedListening.setBaseListening(baseListening);
			seedListening.setOptions(listens[i]);
			seedListening.setAnswer(listenAnswers[i]);
			objectService.save(seedListening);
		}
		// 词汇理解
		baseWordunderstand
				.setId(objectService.getMaxID("BaseWordunderstand") + 1);
		baseWordunderstand.setOptions(wordunderstand);
		baseWordunderstand.setAnswer(wordunderstandAnswer);
		baseWordunderstand.setDifficulty(Float.parseFloat("0"));
		baseWordunderstand.setAccess(Float.parseFloat("0"));
		baseWordunderstand.setTotal(0);
		objectService.save(baseWordunderstand);
		// 长篇阅读
		baseLongreading.setId(objectService.getMaxID("BaseLongreading") + 1);
		baseLongreading.setEssay("");
		baseLongreading.setOptions(longreading);

		baseLongreading.setAnswer(longreadingAnswer);
		baseLongreading.setDifficulty(Float.parseFloat("0"));
		baseLongreading.setAccess(Float.parseFloat("0"));
		baseLongreading.setTotal(0);
		objectService.save(baseLongreading);
		// 仔细阅读
		String[] carereadings = new String[10];
		carereadings[0] = carereading46;
		carereadings[1] = carereading47;
		carereadings[2] = carereading48;
		carereadings[3] = carereading49;
		carereadings[4] = carereading50;

		carereadings[5] = carereading51;
		carereadings[6] = carereading52;
		carereadings[7] = carereading53;
		carereadings[8] = carereading54;
		carereadings[9] = carereading55;

		String[] carereadingAnswers = new String[10];
		carereadingAnswers[0] = carereadingAnswer46;
		carereadingAnswers[1] = carereadingAnswer47;
		carereadingAnswers[2] = carereadingAnswer48;
		carereadingAnswers[3] = carereadingAnswer49;
		carereadingAnswers[4] = carereadingAnswer50;

		carereadingAnswers[5] = carereadingAnswer51;
		carereadingAnswers[6] = carereadingAnswer52;
		carereadingAnswers[7] = carereadingAnswer53;
		carereadingAnswers[8] = carereadingAnswer54;
		carereadingAnswers[9] = carereadingAnswer55;

		baseCarereading1.setId(objectService.getMaxID("BaseCarereading") + 1);
		baseCarereading1.setEssay(carereadingA);
		baseCarereading1.setDifficulty(Float.parseFloat("0"));
		baseCarereading1.setAccess(Float.parseFloat("0"));
		baseCarereading1.setTotal(0);
		objectService.save(baseCarereading1);
		int SeedCarereadingid = objectService.getMaxID("SeedCarereading");
		for (int i = 0; i < 5; i++) {
			seedCarereading = new SeedCarereading();
			seedCarereading.setId(SeedCarereadingid + 1 + i);
			seedCarereading.setBaseCarereading(baseCarereading1);
			seedCarereading.setOptions(carereadings[i]);
			seedCarereading.setAnswer(carereadingAnswers[i]);
			objectService.save(seedCarereading);
		}

		baseCarereading2.setId(objectService.getMaxID("BaseCarereading") + 1);
		baseCarereading2.setEssay(carereadingB);
		baseCarereading2.setDifficulty(Float.parseFloat("0"));
		baseCarereading2.setAccess(Float.parseFloat("0"));
		baseCarereading2.setTotal(0);
		objectService.save(baseCarereading2);

		for (int i = 5; i < 10; i++) {
			seedCarereading = new SeedCarereading();
			seedCarereading.setId(SeedCarereadingid + 1 + i);
			seedCarereading.setBaseCarereading(baseCarereading2);
			seedCarereading.setOptions(carereadings[i]);
			seedCarereading.setAnswer(carereadingAnswers[i]);
			objectService.save(seedCarereading);
		}

		// 翻译
		baseTranslate.setId(objectService.getMaxID("BaseTranslate") + 1);
		baseTranslate.setEssay(translate);
		baseTranslate.setDifficulty(Float.parseFloat("0"));
		baseTranslate.setAccess(Float.parseFloat("0"));
		baseTranslate.setTotal(0);
		objectService.save(baseTranslate);

		// 保存套题
		test.setBaseWriting(baseWriting);
		test.setBaseListening(baseListening);
		test.setBaseWordunderstand(baseWordunderstand);
		test.setBaseLongreading(baseLongreading);
		test.setBaseCarereading1(baseCarereading1);
		test.setBaseCarereading2(baseCarereading2);
		test.setBaseTranslate(baseTranslate);

		objectService.save(test);

		return "successAdd";
	}

	/**
	 * 文件上传
	 */
	@SuppressWarnings("deprecation")
	static void upload(File file,String fileName) {
		try {
			InputStream is = new FileInputStream(file); // 从流中读取数据
			OutputStream os = new FileOutputStream(ServletActionContext
					.getRequest().getRealPath("listening")
					+ "/" + fileName); // 输出数据
			int i = 0;
			byte[] cs = new byte[1025];

			// 读出文件
			while ((i = is.read(cs)) != -1) { // 只有读到末尾时i才为-1
				os.write(cs, 0, i);
			}
			os.close();
			is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * getter和setter方法
	 * 
	 * @return
	 */

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
		this.carereading52 = carereading52;
	}

	public String getCarereading53() {
		return carereading53;
	}

	public void setCarereading53(String carereading53) {
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

	public String getTranslateAnswer() {
		return translate;
	}

	public void settranslate(String translate) {
		this.translate = translate;
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

	public Test getTest() {
		return test;
	}

	public void setTest(Test test) {
		this.test = test;
	}

	public File getListen() {
		return listen;
	}

	@SuppressWarnings("static-access")
	public void setListen(File listen) {
		this.listen = listen;
	}

	public String getListenFileName() {
		return listenFileName;
	}

	@SuppressWarnings("static-access")
	public void setListenFileName(String listenFileName) {
		this.listenFileName = listenFileName;
	}

	/**
	 * @param writing
	 *            the writing to set
	 */
	public void setWriting(String writing) {
		this.writing = writing;
	}

	/**
	 * @return the writing
	 */
	public String getWriting() {
		return writing;
	}

	/**
	 * @param wordunderstand
	 *            the wordunderstand to set
	 */
	public void setWordunderstand(String wordunderstand) {
		this.wordunderstand = wordunderstand;
	}

	/**
	 * @return the wordunderstand
	 */
	public String getWordunderstand() {
		return wordunderstand;
	}

	/**
	 * @return the carereadingAnswer46
	 */
	public String getCarereadingAnswer46() {
		return carereadingAnswer46;
	}

	/**
	 * @param carereadingAnswer46
	 *            the carereadingAnswer46 to set
	 */
	public void setCarereadingAnswer46(String carereadingAnswer46) {
		this.carereadingAnswer46 = carereadingAnswer46;
	}

	/**
	 * @return the carereadingAnswer47
	 */
	public String getCarereadingAnswer47() {
		return carereadingAnswer47;
	}

	/**
	 * @param carereadingAnswer47
	 *            the carereadingAnswer47 to set
	 */
	public void setCarereadingAnswer47(String carereadingAnswer47) {
		this.carereadingAnswer47 = carereadingAnswer47;
	}

	/**
	 * @return the carereadingAnswer48
	 */
	public String getCarereadingAnswer48() {
		return carereadingAnswer48;
	}

	/**
	 * @param carereadingAnswer48
	 *            the carereadingAnswer48 to set
	 */
	public void setCarereadingAnswer48(String carereadingAnswer48) {
		this.carereadingAnswer48 = carereadingAnswer48;
	}

	/**
	 * @return the carereadingAnswer49
	 */
	public String getCarereadingAnswer49() {
		return carereadingAnswer49;
	}

	/**
	 * @param carereadingAnswer49
	 *            the carereadingAnswer49 to set
	 */
	public void setCarereadingAnswer49(String carereadingAnswer49) {
		this.carereadingAnswer49 = carereadingAnswer49;
	}

	/**
	 * @return the carereadingAnswer50
	 */
	public String getCarereadingAnswer50() {
		return carereadingAnswer50;
	}

	/**
	 * @param carereadingAnswer50
	 *            the carereadingAnswer50 to set
	 */
	public void setCarereadingAnswer50(String carereadingAnswer50) {
		this.carereadingAnswer50 = carereadingAnswer50;
	}

	/**
	 * @return the carereadingAnswer51
	 */
	public String getCarereadingAnswer51() {
		return carereadingAnswer51;
	}

	/**
	 * @param carereadingAnswer51
	 *            the carereadingAnswer51 to set
	 */
	public void setCarereadingAnswer51(String carereadingAnswer51) {
		this.carereadingAnswer51 = carereadingAnswer51;
	}

	/**
	 * @return the carereadingAnswer52
	 */
	public String getCarereadingAnswer52() {
		return carereadingAnswer52;
	}

	/**
	 * @param carereadingAnswer52
	 *            the carereadingAnswer52 to set
	 */
	public void setCarereadingAnswer52(String carereadingAnswer52) {
		this.carereadingAnswer52 = carereadingAnswer52;
	}

	/**
	 * @return the carereadingAnswer53
	 */
	public String getCarereadingAnswer53() {
		return carereadingAnswer53;
	}

	/**
	 * @param carereadingAnswer53
	 *            the carereadingAnswer53 to set
	 */
	public void setCarereadingAnswer53(String carereadingAnswer53) {
		this.carereadingAnswer53 = carereadingAnswer53;
	}

	/**
	 * @return the carereadingAnswer54
	 */
	public String getCarereadingAnswer54() {
		return carereadingAnswer54;
	}

	/**
	 * @param carereadingAnswer54
	 *            the carereadingAnswer54 to set
	 */
	public void setCarereadingAnswer54(String carereadingAnswer54) {
		this.carereadingAnswer54 = carereadingAnswer54;
	}

	/**
	 * @return the carereadingAnswer55
	 */
	public String getCarereadingAnswer55() {
		return carereadingAnswer55;
	}

	/**
	 * @param carereadingAnswer55
	 *            the carereadingAnswer55 to set
	 */
	public void setCarereadingAnswer55(String carereadingAnswer55) {
		this.carereadingAnswer55 = carereadingAnswer55;
	}

	/**
	 * @return the listenAnswer1
	 */
	public String getListenAnswer1() {
		return listenAnswer1;
	}

	/**
	 * @param listenAnswer1
	 *            the listenAnswer1 to set
	 */
	public void setListenAnswer1(String listenAnswer1) {
		this.listenAnswer1 = listenAnswer1;
	}

	/**
	 * @return the listenAnswer2
	 */
	public String getListenAnswer2() {
		return listenAnswer2;
	}

	/**
	 * @param listenAnswer2
	 *            the listenAnswer2 to set
	 */
	public void setListenAnswer2(String listenAnswer2) {
		this.listenAnswer2 = listenAnswer2;
	}

	/**
	 * @return the listenAnswer3
	 */
	public String getListenAnswer3() {
		return listenAnswer3;
	}

	/**
	 * @param listenAnswer3
	 *            the listenAnswer3 to set
	 */
	public void setListenAnswer3(String listenAnswer3) {
		this.listenAnswer3 = listenAnswer3;
	}

	/**
	 * @return the listenAnswer4
	 */
	public String getListenAnswer4() {
		return listenAnswer4;
	}

	/**
	 * @param listenAnswer4
	 *            the listenAnswer4 to set
	 */
	public void setListenAnswer4(String listenAnswer4) {
		this.listenAnswer4 = listenAnswer4;
	}

	/**
	 * @return the listenAnswer5
	 */
	public String getListenAnswer5() {
		return listenAnswer5;
	}

	/**
	 * @param listenAnswer5
	 *            the listenAnswer5 to set
	 */
	public void setListenAnswer5(String listenAnswer5) {
		this.listenAnswer5 = listenAnswer5;
	}

	/**
	 * @return the listenAnswer6
	 */
	public String getListenAnswer6() {
		return listenAnswer6;
	}

	/**
	 * @param listenAnswer6
	 *            the listenAnswer6 to set
	 */
	public void setListenAnswer6(String listenAnswer6) {
		this.listenAnswer6 = listenAnswer6;
	}

	/**
	 * @return the listenAnswer7
	 */
	public String getListenAnswer7() {
		return listenAnswer7;
	}

	/**
	 * @param listenAnswer7
	 *            the listenAnswer7 to set
	 */
	public void setListenAnswer7(String listenAnswer7) {
		this.listenAnswer7 = listenAnswer7;
	}

	/**
	 * @return the listenAnswer8
	 */
	public String getListenAnswer8() {
		return listenAnswer8;
	}

	/**
	 * @param listenAnswer8
	 *            the listenAnswer8 to set
	 */
	public void setListenAnswer8(String listenAnswer8) {
		this.listenAnswer8 = listenAnswer8;
	}

	/**
	 * @return the listenAnswer9
	 */
	public String getListenAnswer9() {
		return listenAnswer9;
	}

	/**
	 * @param listenAnswer9
	 *            the listenAnswer9 to set
	 */
	public void setListenAnswer9(String listenAnswer9) {
		this.listenAnswer9 = listenAnswer9;
	}

	/**
	 * @return the listenAnswer10
	 */
	public String getListenAnswer10() {
		return listenAnswer10;
	}

	/**
	 * @param listenAnswer10
	 *            the listenAnswer10 to set
	 */
	public void setListenAnswer10(String listenAnswer10) {
		this.listenAnswer10 = listenAnswer10;
	}

	/**
	 * @return the listenAnswer11
	 */
	public String getListenAnswer11() {
		return listenAnswer11;
	}

	/**
	 * @param listenAnswer11
	 *            the listenAnswer11 to set
	 */
	public void setListenAnswer11(String listenAnswer11) {
		this.listenAnswer11 = listenAnswer11;
	}

	/**
	 * @return the listenAnswer12
	 */
	public String getListenAnswer12() {
		return listenAnswer12;
	}

	/**
	 * @param listenAnswer12
	 *            the listenAnswer12 to set
	 */
	public void setListenAnswer12(String listenAnswer12) {
		this.listenAnswer12 = listenAnswer12;
	}

	/**
	 * @return the listenAnswer13
	 */
	public String getListenAnswer13() {
		return listenAnswer13;
	}

	/**
	 * @param listenAnswer13
	 *            the listenAnswer13 to set
	 */
	public void setListenAnswer13(String listenAnswer13) {
		this.listenAnswer13 = listenAnswer13;
	}

	/**
	 * @return the listenAnswer14
	 */
	public String getListenAnswer14() {
		return listenAnswer14;
	}

	/**
	 * @param listenAnswer14
	 *            the listenAnswer14 to set
	 */
	public void setListenAnswer14(String listenAnswer14) {
		this.listenAnswer14 = listenAnswer14;
	}

	/**
	 * @return the listenAnswer15
	 */
	public String getListenAnswer15() {
		return listenAnswer15;
	}

	/**
	 * @param listenAnswer15
	 *            the listenAnswer15 to set
	 */
	public void setListenAnswer15(String listenAnswer15) {
		this.listenAnswer15 = listenAnswer15;
	}

	/**
	 * @return the listenAnswer16
	 */
	public String getListenAnswer16() {
		return listenAnswer16;
	}

	/**
	 * @param listenAnswer16
	 *            the listenAnswer16 to set
	 */
	public void setListenAnswer16(String listenAnswer16) {
		this.listenAnswer16 = listenAnswer16;
	}

	/**
	 * @return the listenAnswer17
	 */
	public String getListenAnswer17() {
		return listenAnswer17;
	}

	/**
	 * @param listenAnswer17
	 *            the listenAnswer17 to set
	 */
	public void setListenAnswer17(String listenAnswer17) {
		this.listenAnswer17 = listenAnswer17;
	}

	/**
	 * @return the listenAnswer18
	 */
	public String getListenAnswer18() {
		return listenAnswer18;
	}

	/**
	 * @param listenAnswer18
	 *            the listenAnswer18 to set
	 */
	public void setListenAnswer18(String listenAnswer18) {
		this.listenAnswer18 = listenAnswer18;
	}

	/**
	 * @return the listenAnswer19
	 */
	public String getListenAnswer19() {
		return listenAnswer19;
	}

	/**
	 * @param listenAnswer19
	 *            the listenAnswer19 to set
	 */
	public void setListenAnswer19(String listenAnswer19) {
		this.listenAnswer19 = listenAnswer19;
	}

	/**
	 * @return the listenAnswer20
	 */
	public String getListenAnswer20() {
		return listenAnswer20;
	}

	/**
	 * @param listenAnswer20
	 *            the listenAnswer20 to set
	 */
	public void setListenAnswer20(String listenAnswer20) {
		this.listenAnswer20 = listenAnswer20;
	}

	/**
	 * @return the listenAnswer21
	 */
	public String getListenAnswer21() {
		return listenAnswer21;
	}

	/**
	 * @param listenAnswer21
	 *            the listenAnswer21 to set
	 */
	public void setListenAnswer21(String listenAnswer21) {
		this.listenAnswer21 = listenAnswer21;
	}

	/**
	 * @return the listenAnswer22
	 */
	public String getListenAnswer22() {
		return listenAnswer22;
	}

	/**
	 * @param listenAnswer22
	 *            the listenAnswer22 to set
	 */
	public void setListenAnswer22(String listenAnswer22) {
		this.listenAnswer22 = listenAnswer22;
	}

	/**
	 * @return the listenAnswer23
	 */
	public String getListenAnswer23() {
		return listenAnswer23;
	}

	/**
	 * @param listenAnswer23
	 *            the listenAnswer23 to set
	 */
	public void setListenAnswer23(String listenAnswer23) {
		this.listenAnswer23 = listenAnswer23;
	}

	/**
	 * @return the listenAnswer24
	 */
	public String getListenAnswer24() {
		return listenAnswer24;
	}

	/**
	 * @param listenAnswer24
	 *            the listenAnswer24 to set
	 */
	public void setListenAnswer24(String listenAnswer24) {
		this.listenAnswer24 = listenAnswer24;
	}

	/**
	 * @return the listenAnswer25
	 */
	public String getListenAnswer25() {
		return listenAnswer25;
	}

	/**
	 * @param listenAnswer25
	 *            the listenAnswer25 to set
	 */
	public void setListenAnswer25(String listenAnswer25) {
		this.listenAnswer25 = listenAnswer25;
	}

	/**
	 * @return the translate
	 */
	public String getTranslate() {
		return translate;
	}

	/**
	 * @param translate
	 *            the translate to set
	 */
	public void setTranslate(String translate) {
		this.translate = translate;
	}

	/**
	 * @param carereadingA
	 *            the carereadingA to set
	 */
	public void setCarereadingA(String carereadingA) {
		this.carereadingA = carereadingA;
	}

	/**
	 * @return the carereadingA
	 */
	public String getCarereadingA() {
		return carereadingA;
	}

	/**
	 * @param carereadingB
	 *            the carereadingB to set
	 */
	public void setCarereadingB(String carereadingB) {
		this.carereadingB = carereadingB;
	}

	/**
	 * @return the carereadingB
	 */
	public String getCarereadingB() {
		return carereadingB;
	}

	/**
	 * @return the longreading
	 */
	public String getLongreading() {
		return longreading;
	}

	/**
	 * @param longreading
	 *            the longreading to set
	 */
	public void setLongreading(String longreading) {
		this.longreading = longreading;
	}

	/**
	 * @return the wordunderstandAnswer
	 */
	public String getWordunderstandAnswer() {
		return wordunderstandAnswer;
	}

	/**
	 * @param wordunderstandAnswer
	 *            the wordunderstandAnswer to set
	 */
	public void setWordunderstandAnswer(String wordunderstandAnswer) {
		this.wordunderstandAnswer = wordunderstandAnswer;
	}

	/**
	 * @return the longreadingAnswer
	 */
	public String getLongreadingAnswer() {
		return longreadingAnswer;
	}

	/**
	 * @param longreadingAnswer
	 *            the longreadingAnswer to set
	 */
	public void setLongreadingAnswer(String longreadingAnswer) {
		this.longreadingAnswer = longreadingAnswer;
	}

	/**
	 * @param material the material to set
	 */
	public void setMaterial(String material) {
		this.material = material;
	}

	/**
	 * @return the material
	 */
	public String getMaterial() {
		return material;
	}

}
