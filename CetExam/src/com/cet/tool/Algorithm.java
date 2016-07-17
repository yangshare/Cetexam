package com.cet.tool;

import com.cet.pojo.BaseCarereading;
import com.cet.pojo.BaseListening;
import com.cet.pojo.BaseLongreading;
import com.cet.pojo.BaseTranslate;
import com.cet.pojo.BaseWordunderstand;
import com.cet.pojo.BaseWriting;
import com.cet.pojo.Test;
import com.cet.service.ObjectService;

/**
 * 功能：遗传算法操作类
 * 
 * @author 冉椿林
 * 
 */
public class Algorithm {

	/* GA 算法的参数 */
	public static double uniformRate = 0.9; // 交叉概率（最宜0.9-0.97）
	public static double mutationRate = 0.035; // 突变概率（最宜0.1-0.001）
	public static int tournamentSize = 5; // 淘汰数组的大小
	private static final boolean elitism = true; // 精英主义

	public static ObjectService objectService;

	public static float ep = 0; // 期望难度（用户最先应设置）

	// 进化一个种群
	public static Population evolvePopulation(Population pop, boolean isFirst,
			boolean needCheck) {

		// 存放新一代的种群
		Population newPopulation = new Population(pop.size(), false);

		if (!isFirst) {
			// 把最优秀的那个 放在第一个位置.
			if (elitism) {
				newPopulation.saveTest(0, pop.getFittest());
			}
		}

		// 交叉位置
		int elitismOffset;
		if (elitism && !isFirst) {// 采用精英主义，0处存放精英，即从1处开始交叉
			elitismOffset = 1;
		} else {
			elitismOffset = 0;
		}

		// 交叉
		for (int i = elitismOffset; i < pop.size(); i++) {
			// 随机选择两个优秀的个体
			Test t1 = tournamentSelection(pop);
			Test t2 = tournamentSelection(pop);
			// 进行交叉
			Test newt = crossover(t1, t2);
			if (needCheck) {
				if (!newt.checkTest()) {
					System.err.println("交叉时失败（题型数量已经不够用了，无法生成新的不重复的试卷）");
					return null;
				}
			}
			newPopulation.saveTest(i, newt);
		}

		// 突变
		for (int i = elitismOffset; i < newPopulation.size(); i++) {
			// 进行突变
			Test newt = newPopulation.getTest(i);
			mutate(newt);
			if (needCheck) {
				if (!newt.checkTest()) {
					System.err.println("突变时失败（题型数量已经不够用了，无法生成新的不重复的试卷）");
					return null;
				}
				newPopulation.saveTest(i, newt);
			}
		}

		return newPopulation;
	}

	// 进行两个个体的交叉 ,交叉的概率为uniformRate
	private static Test crossover(Test t1, Test t2) {
		Test newSol = new Test();
		// 随机的从两个个体中选择
		if (Math.random() <= uniformRate) {
			newSol.setBaseWriting(t1.getBaseWriting());
		} else {
			newSol.setBaseWriting(t2.getBaseWriting());
		}
		if (Math.random() <= uniformRate) {
			newSol.setBaseListening(t1.getBaseListening());
		} else {
			newSol.setBaseListening(t2.getBaseListening());
		}
		if (Math.random() <= uniformRate) {
			newSol.setBaseWordunderstand(t1.getBaseWordunderstand());
		} else {
			newSol.setBaseWordunderstand(t2.getBaseWordunderstand());
		}
		if (Math.random() <= uniformRate) {
			newSol.setBaseLongreading(t1.getBaseLongreading());
		} else {
			newSol.setBaseLongreading(t2.getBaseLongreading());
		}
		if (Math.random() <= uniformRate) {
			newSol.setBaseCarereading1(t1.getBaseCarereading1());
		} else {
			newSol.setBaseCarereading1(t2.getBaseCarereading1());
		}
		if (Math.random() <= uniformRate) {
			if (newSol.getBaseCarereading1().getId() == t1
					.getBaseCarereading2().getId())
				newSol.setBaseCarereading2(t2.getBaseCarereading2());
			else
				newSol.setBaseCarereading2(t1.getBaseCarereading2());
		} else {
			if (newSol.getBaseCarereading1().getId() == t2
					.getBaseCarereading2().getId())
				newSol.setBaseCarereading2(t1.getBaseCarereading2());
			else
				newSol.setBaseCarereading2(t2.getBaseCarereading2());
		}
		if (Math.random() <= uniformRate) {
			newSol.setBaseTranslate(t1.getBaseTranslate());
		} else {
			newSol.setBaseTranslate(t2.getBaseTranslate());
		}
		return newSol;
	}

	// 突变个体。 突变的概率为 mutationRate
	private static Test mutate(Test newSol) {

		if (Math.random() <= mutationRate) {
			newSol.setBaseWriting((BaseWriting) newSol.getRandomObject(
					BaseWriting.class, "BaseWriting"));
		}
		if (Math.random() <= mutationRate) {
			newSol.setBaseListening((BaseListening) newSol.getRandomObject(
					BaseListening.class, "BaseListening"));
		}
		if (Math.random() <= mutationRate) {
			newSol.setBaseWordunderstand((BaseWordunderstand) newSol
					.getRandomObject(BaseWordunderstand.class,
							"BaseWordunderstand"));
		}
		if (Math.random() <= mutationRate) {
			newSol.setBaseLongreading((BaseLongreading) newSol.getRandomObject(
					BaseLongreading.class, "BaseLongreading"));
		}
		if (Math.random() <= mutationRate) {
			newSol.setBaseCarereading1((BaseCarereading) newSol
					.getRandomObject(BaseCarereading.class, "BaseCarereading"));
		}
		if (Math.random() <= mutationRate) {
			BaseCarereading baseCarereading2;
			do {
				baseCarereading2 = (BaseCarereading) newSol.getRandomObject(
						BaseCarereading.class, "BaseCarereading");
			} while (baseCarereading2.getId() == newSol.getBaseCarereading1()
					.getId());
			newSol.setBaseCarereading2(baseCarereading2);
		}
		if (Math.random() <= mutationRate) {
			newSol.setBaseTranslate((BaseTranslate) newSol.getRandomObject(
					BaseTranslate.class, "BaseTranslate"));
		}
		return newSol;
	}

	// 随机选择一个较优秀的个体，用了进行交叉
	private static Test tournamentSelection(Population pop) {
		// 创建一个淘汰种群
		Population tournamentPop = new Population(tournamentSize, false);
		// 随机选择 tournamentSize 个放入 tournamentPop 中
		for (int i = 0; i < tournamentSize; i++) {
			int randomId = (int) (Math.random() * pop.size());
			tournamentPop.saveTest(i, pop.getTest(randomId));
		}
		// 找到淘汰数组中最优秀的
		Test fittest = tournamentPop.getFittest();
		return fittest;
	}
}