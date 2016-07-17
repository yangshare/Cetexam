package com.cet.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cet.pojo.Test;

@Transactional
public class ObjectServiceImpl implements ObjectService {
	@Resource
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	// 添加对象
	public void save(Object obj) {
		sessionFactory.getCurrentSession().save(obj);
	}

	// 通过id查找对象
	@SuppressWarnings("unchecked")
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public Object getObjectById(Class cls, int id) {
		return (Object) sessionFactory.getCurrentSession().get(cls, id);
	}

	// 获取最大ID
	public int getMaxID(String table) {
		Query query = sessionFactory.getCurrentSession().createQuery(
				"select max(id) as maxid from " + table).setResultTransformer(
				Transformers.ALIAS_TO_ENTITY_MAP);
		Map<?, ?> map = (Map<?, ?>) query.list().get(0);
		int id = Integer.parseInt(map.get("maxid").toString());
		return id;
	}

	// 修改对象
	public boolean update(Object obj) {
		try {
			sessionFactory.getCurrentSession().update(obj);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	// 删除对象
	public void delete(Object obj) {
		sessionFactory.getCurrentSession().delete(obj);
	}

	// 获取对象列表(不开启事务，且只读，不能更新和删除)
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public List<?> getAllObjects(String table) {
		return sessionFactory.getCurrentSession().createQuery("from " + table)
				.list();
	}

	// 根据一个字段获取对象列表
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public List<?> getObjectByfield(String table, String dbfield, Object field) {

		Query query = sessionFactory.getCurrentSession().createQuery(
				"from " + table + " where " + dbfield + "=?");
		query.setParameter(0, field);

		return query.list();
	}

	// 根据一组字段获取对象列表（参数数组应小于3，2以上为写相应代码）
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public List<?> getObjectByfield(String table, String dbfields[],
			Object fields[]) {
		String hql = "from " + table + " where ";
		for (int i = 0; i < dbfields.length; i++) {
			if (i == fields.length - 1) {
				hql += dbfields[i] + "=?";
				continue;
			}
			hql += dbfields[i] + "=? and ";
		}
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		for (int i = 0; i < dbfields.length; i++) {
			query.setParameter(i, fields[i]);
		}

		return query.list();
	}

	// 登录验证
	@SuppressWarnings("unchecked")
	public List check(String type, String username, String password) {
		String hql = null;
		if (type.equals("管理员")) {
			hql = "from Admin where name = ? and password = ?";
			System.out.println("信息：用户名="+username+",密码="+password);
		}else{
			if (type.equals("教师")) {
				hql = "from Teacher where teacherName = ? and password = ?";
			} else {
				hql = "from Examinee where candidate = ? and password = ?";
			}
		}
		
		List list = sessionFactory.getCurrentSession().createQuery(hql)
				.setString(0, username).setString(1, password).list();
		return list;
	}

	// 分页显示
	@SuppressWarnings("unchecked")
	public List page(String table, int first, int perPageRow) {
		Query q = sessionFactory.getCurrentSession().createQuery(
				"from " + table);
		q.setFirstResult(first);
		q.setMaxResults(perPageRow);
		return q.list();
	}

	// 获取一个ID不在idList里的Test列表
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public List<?> getObjectNotIn(String table) {

		List<?> list = getAllObjects("Test");
		String area = "";
		if (table.equals("BaseWriting")) {
			for (int i = 0; i < list.size(); i++) {
				if (i == list.size() - 1) {
					area += ((Test) list.get(i)).getBaseWriting().getId();
					break;
				}
				area += ((Test) list.get(i)).getBaseWriting().getId() + ",";
			}
		}
		if (table.equals("BaseListening")) {
			for (int i = 0; i < list.size(); i++) {
				if (i == list.size() - 1) {
					area += ((Test) list.get(i)).getBaseListening().getId();
					break;
				}
				area += ((Test) list.get(i)).getBaseListening().getId() + ",";
			}
		}
		if (table.equals("BaseWordunderstand")) {
			for (int i = 0; i < list.size(); i++) {
				if (i == list.size() - 1) {
					area += ((Test) list.get(i)).getBaseWordunderstand()
							.getId();
					break;
				}
				area += ((Test) list.get(i)).getBaseWordunderstand().getId()
						+ ",";
			}
		}
		if (table.equals("BaseLongreading")) {
			for (int i = 0; i < list.size(); i++) {
				if (i == list.size() - 1) {
					area += ((Test) list.get(i)).getBaseLongreading().getId();
					break;
				}
				area += ((Test) list.get(i)).getBaseLongreading().getId() + ",";
			}
		}
		if (table.equals("BaseCarereading")) {
			for (int i = 0; i < list.size(); i++) {
				if (i == list.size() - 1) {
					area += ((Test) list.get(i)).getBaseCarereading1().getId();
					area += ((Test) list.get(i)).getBaseCarereading2().getId();
					break;
				}
				area += ((Test) list.get(i)).getBaseCarereading1().getId()
						+ ",";
				area += ((Test) list.get(i)).getBaseCarereading2().getId()
						+ ",";
			}
		}

		if (table.equals("BaseTranslate")) {
			for (int i = 0; i < list.size(); i++) {
				if (i == list.size() - 1) {
					area += ((Test) list.get(i)).getBaseTranslate().getId();
					break;
				}
				area += ((Test) list.get(i)).getBaseTranslate().getId() + ",";
			}
		}

		return sessionFactory.getCurrentSession().createQuery(
				"from " + table + " where id not in (" + area + ")").list();
	}

	/**
	 * ================================================================ 
	 * 老杨添加方法
	 * ================================================================
	 */



	// 删除对象
	public void delete(String table ,String testid) {
		sessionFactory.getCurrentSession().createQuery(
				"delete from "+table+" where testid="+testid).executeUpdate();
	}

	// 删除对象通过id
	@SuppressWarnings("unchecked")
	public void delete(Class cls, int id) {
		sessionFactory.getCurrentSession().delete(
				sessionFactory.getCurrentSession().load(cls, id));
	}

	// 获取对象列表
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	@SuppressWarnings("unchecked")
	public List getObject(String table) {
		return sessionFactory.getCurrentSession().createQuery("from " + table)
				.list();
	}

	// 获取对象列表
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	@SuppressWarnings("unchecked")
	public List getObjectByTestid(String table, int cond) {
		return sessionFactory.getCurrentSession().createQuery(
				"from " + table + " where testid=" + cond).list();
	}

	// 获取对象列表通过ID
	@SuppressWarnings("unchecked")
	public List getObject(String table, String id) {
		if (table.equals("Testname")) {
			return sessionFactory.getCurrentSession().createQuery(
					"from " + table + " where id=" + id).list();
		} else {
			return sessionFactory.getCurrentSession().createQuery(
					"from " + table + " where testid=" + id).list();
		}

	}

	// 通过字符串查询对象
	@SuppressWarnings("unchecked")
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public Object getObjectById(Class cls, String str) {
		return (Object) sessionFactory.getCurrentSession().get(cls, str);
	}


	// 考生登录验证
	@SuppressWarnings("unchecked")
	public List validation(String table, String candidateNo) {
		List list = sessionFactory.getCurrentSession().createQuery(
				"from " + table + " where candidateNo = ?").setString(0,
				candidateNo).list();
		return list;
	}

	// 通过考号删除对象
	@SuppressWarnings("unchecked")
	public void delete(Class cls, String candidateNo) {
		sessionFactory.getCurrentSession().delete(
				sessionFactory.getCurrentSession().load(cls, candidateNo));
	}


}
