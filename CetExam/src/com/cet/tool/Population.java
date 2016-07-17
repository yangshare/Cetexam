package com.cet.tool;

import com.cet.pojo.Test;

/**
 * 功能：遗传算法种群类
 * 
 * @author 冉椿林
 * 
 */
public class Population {
	Test[] Tests;// 个体集合

	// 创建一个种群,初始化时initialise=true
	public Population(int populationSize, boolean initialise) {
		Tests = new Test[populationSize];
		// 初始化种群
		if (initialise) {
			for (int i = 0; i < size(); i++) {
				Test newTest = new Test();
				newTest.getRandomTest();
				saveTest(i, newTest);
			}
		}
	}

	public Test getTest(int index) {
		return Tests[index];
	}

	// 获取种群适应度最高的个体
	public Test getFittest() {
		Test fittest = Tests[0];
		for (int i = 0; i < size(); i++) {
			if (fittest.getFitness(Algorithm.ep) <= getTest(i).getFitness(
					Algorithm.ep)) {
				fittest = getTest(i);
			}
		}
		return fittest;
	}

	// 获取种群大小
	public int size() {
		return Tests.length;
	}

	// 保存试卷到种群
	public void saveTest(int index, Test indiv) {
		Tests[index] = indiv;
	}
}
