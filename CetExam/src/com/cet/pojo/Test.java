package com.cet.pojo;

import java.util.List;
import java.util.Random;

import com.cet.service.ObjectService;
import com.cet.tool.Algorithm;

/**
 * Test entity.
 */

public class Test implements java.io.Serializable {

	/**
	 * 试题
	 */
	private static final long serialVersionUID = 1L;
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

	// 遗传算法相关属性
	private float difficulty = 0;// 试卷难度
	private double Fitness = 0;// 试卷适应度

	public int genes[] = new int[7];// 试卷基因序列

	// Constructors
	/** default constructor */
	public Test() {
	}

	// 遗传算法相关方法
	/**
	 * 计算试卷个体难度系数 计算公式： 每题难度*分数求和除总分
	 * 
	 * @return
	 */
	public float getDifficulty() {
		if (difficulty == 0) {
			float _difficulty = (baseWriting.getDifficulty() * (float) 106.5
					+ baseListening.getDifficulty() * (float) 248.5
					+ baseTranslate.getDifficulty() * (float) 106.5
					+ baseWordunderstand.getDifficulty() * (float) 36
					+ baseLongreading.getDifficulty() * (float) 71
					+ baseCarereading1.getDifficulty() * (float) 71 + baseCarereading2
					.getDifficulty()
					* (float) 71);
			difficulty = (_difficulty / (float) 710.5);
		}
		return difficulty;
	}

	/**
	 * 计算个体适应度 公式为：f=1-|EP-P| 其中EP为期望难度系数，P为种群个体难度系数
	 * 
	 * @param difficulty
	 *            期望难度系数
	 */
	public double getFitness(double EP) {
		if (Fitness == 0) {
			Fitness = 1 - Math.abs(EP - getDifficulty());
		}
		return Fitness;
	}

	/**
	 * 功能：避免重复题型
	 * 检查生成的Test的所有题型是否数据库已经存在，只要Test里有种题型和数据库的某个Test一样，就更换该题型为数据库所有Test里都没有的。
	 * 
	 * @param test
	 * @return
	 */
	public boolean checkTest() {

		ObjectService objectService = Algorithm.objectService;
		Random random = new Random();

		List<?> notInList = objectService.getObjectNotIn("BaseWriting");
		if (notInList.size() < 1) {
			return false;
		}
		baseWriting = (BaseWriting) notInList.get(random.nextInt(notInList
				.size()));

		notInList = objectService.getObjectNotIn("BaseListening");
		if (notInList.size() < 1) {
			return false;
		}
		baseListening = (BaseListening) notInList.get(random.nextInt(notInList
				.size()));

		notInList = objectService.getObjectNotIn("BaseWordunderstand");
		if (notInList.size() < 1) {
			return false;
		}
		baseWordunderstand = (BaseWordunderstand) notInList.get(random
				.nextInt(notInList.size()));

		notInList = objectService.getObjectNotIn("BaseLongreading");
		if (notInList.size() < 1) {
			return false;
		}
		baseLongreading = (BaseLongreading) notInList.get(random
				.nextInt(notInList.size()));

		notInList = objectService.getObjectNotIn("BaseCarereading");
		if (notInList.size() < 2) {
			return false;
		}
		int ran = random.nextInt(notInList.size());
		baseCarereading1 = (BaseCarereading) notInList.get(ran);
		notInList.remove(ran);
		baseCarereading2 = (BaseCarereading) notInList.get(random
				.nextInt(notInList.size()));

		notInList = objectService.getObjectNotIn("BaseTranslate");
		if (notInList.size() < 1) {
			return false;
		}
		baseTranslate = (BaseTranslate) notInList.get(random.nextInt(notInList
				.size()));

		return true;
	}

	/**
	 * 功能：随机生成一套试卷
	 * 
	 * @return
	 */
	public void getRandomTest() {

		BaseWriting baseWriting = (BaseWriting) getRandomObject(
				BaseWriting.class, "BaseWriting");
		setBaseWriting(baseWriting);
		genes[0] = baseWriting.getId();

		BaseListening baseListening = (BaseListening) getRandomObject(
				BaseListening.class, "BaseListening");
		setBaseListening(baseListening);
		genes[1] = baseListening.getId();

		BaseWordunderstand baseWordunderstand = (BaseWordunderstand) getRandomObject(
				BaseWordunderstand.class, "BaseWordunderstand");
		setBaseWordunderstand(baseWordunderstand);
		genes[2] = baseWordunderstand.getId();

		BaseLongreading baseLongreading = (BaseLongreading) getRandomObject(
				BaseLongreading.class, "BaseLongreading");
		setBaseLongreading(baseLongreading);
		genes[3] = baseLongreading.getId();

		BaseCarereading baseCarereading1 = (BaseCarereading) getRandomObject(
				BaseCarereading.class, "BaseCarereading");
		setBaseCarereading1(baseCarereading1);
		genes[4] = baseCarereading1.getId();

		BaseCarereading baseCarereading2;
		do {
			baseCarereading2 = (BaseCarereading) getRandomObject(
					BaseCarereading.class, "BaseCarereading");
		} while (baseCarereading2.getId() == baseCarereading1.getId());
		setBaseCarereading2(baseCarereading2);
		genes[5] = baseCarereading2.getId();

		BaseTranslate baseTranslate = (BaseTranslate) getRandomObject(
				BaseTranslate.class, "BaseTranslate");
		setBaseTranslate(baseTranslate);
		genes[6] = baseTranslate.getId();

	}

	/**
	 * 功能：随机获取一个题型对象
	 * 
	 * @param clas
	 * @param table
	 * @return
	 */
	public Object getRandomObject(Class<?> clas, String table) {
		ObjectService objectService = Algorithm.objectService;
		Random random = new Random();
		Object obj=objectService.getObjectById(clas, random.nextInt(objectService
				.getMaxID(table)) + 1);
		return obj;
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

}