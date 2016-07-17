package com.cet.tool;

import com.cet.pojo.Test;
import com.cet.service.ObjectService;

/**
 * 功能：遗传算法主类
 * 
 * @author 冉椿林
 * 
 */
public class AutoGATest {

	/**
	 * 功能：遗传算法生成试卷主方法
	 * 
	 * @param objectService
	 * @param difficulty
	 *            试卷难度
	 * @param ep
	 *            期望难度
	 * @param uniformRate
	 *            交叉概率
	 * @param mutationRate
	 *            变异概率
	 * @param tournamentSize
	 *            淘汰数组大小
	 * @param popSize
	 *            种群大小
	 * @param isCheck
	 *            每次交叉或变异生成的个体是否需要检查重合，考试时检查，练习时不需检查
	 * @return
	 */
	public Test getGATest(ObjectService objectService, float ep,
			double uniformRate, double mutationRate, int tournamentSize,
			int popSize, boolean isCheck) {

		// 设置遗传算法相关参数
		Algorithm.ep = ep;// 设置期望难度
		Algorithm.uniformRate = uniformRate;// 设置交叉概率
		Algorithm.mutationRate = mutationRate;// 设置变异概率
		Algorithm.tournamentSize = tournamentSize;// 设置淘汰数组大小
		boolean isFirst = true;// 第一次进化，不进行精英主义，因为如果进行，是将初始的种群的精英放入新种群，而不会让它进行任何交叉变异，而有可能它是与数据库某Test重合的
		Algorithm.objectService = objectService;
		Population myPop = new Population(popSize, true);// 初始化一个种群

		// 不断迭代，进行进化操作。 直到找到期望的基因序列,默认都要进化一次，因为这样，进化后的种群个体都是经过交叉变异来的，
		// 交叉变异过程中，我进行了重复检查，如果个体和数据库的Test数据重合，则重新赋值一个不重复的。这样避免了
		// 未进化种群就找到了最优个体，而该最优个体与数据库Test数据重合的问题
		int generationCount = 0;

		long begin = System.currentTimeMillis();

		do {

			if (myPop.getFittest().getFitness(Algorithm.ep) < 0.90// 种群中最好的个体适应度都低于0.85，则加大交叉概率
					&& Algorithm.uniformRate < 0.97) {
				System.out.print(" 加大交叉概率 ");
				Algorithm.uniformRate += 0.07;
			}
			if (myPop.getFittest().getFitness(Algorithm.ep) < 0.90// 种群中最好的个体适应度都低于0.85，则加大变异概率
					&& Algorithm.mutationRate < 0.25) {
				System.out.println(" 加大变异概率 ");
				Algorithm.mutationRate += 0.03;
			}
			if (myPop.getFittest().getFitness(Algorithm.ep) > 0.90// 种群中最好的个体适应度高于0.9，则减小交叉概率
					&& Algorithm.uniformRate > 0.90) {
				System.out.print(" 减小交叉概率 ");
				Algorithm.uniformRate -= 0.07;
			}
			if (myPop.getFittest().getFitness(Algorithm.ep) > 0.90// 种群中最好的个体适应度高于0.9，则减小变异概率
					&& Algorithm.mutationRate > 0.15) {
				System.out.println(" 减小变异概率 ");
				Algorithm.mutationRate -= 0.03;
			}

			myPop = Algorithm.evolvePopulation(myPop, isFirst, isCheck);
			if (myPop == null) // 题型数量已经不够用了，无法生成新的不重复的试卷
				return null;
			isFirst = false;
			generationCount++;
			System.out.println("第" + generationCount + "次进化， 适应度为: "
					+ myPop.getFittest().getFitness(Algorithm.ep) * 100 + "%");

		} while (myPop.getFittest().getFitness(Algorithm.ep) < 0.98
				&& generationCount <= 100);
		System.out.println("用时:" + (System.currentTimeMillis() - begin)
				/ 1000.0 + "秒");
		if (generationCount > 100) {
			System.err.println("题库相关难度的题型不足，无法生成新的试卷\n");
			return null;
		}
		System.out.println("进化完成!");
		System.out.println("进化总次数:" + generationCount + "，最终个体适应度:"
				+ myPop.getFittest().getFitness(Algorithm.ep) * 100 + "%"
				+ "，期望难度:" + ep + ",试卷难度:" + myPop.getFittest().getDifficulty()
				+ "\n");

		return myPop.getFittest();
	}
}
