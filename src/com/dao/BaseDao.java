package com.dao;

import java.lang.reflect.ParameterizedType;
import java.math.BigInteger;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.type.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;



/**
 * 持久层基础类
 * 
 * @param <M>
 * @param <PK>
 */
@Repository
public class BaseDao<M extends java.io.Serializable, PK extends java.io.Serializable> {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	public Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	public void save(M model) {
		getCurrentSession().save(model);
	}

	public void saveOrUpdate(M model) {
		getCurrentSession().saveOrUpdate(model);
	}

	public void update(M model) {
		getCurrentSession().update(model);
	}

	public void merge(M model) {
		getCurrentSession().merge(model);
	}

	public void delete(PK id) {
		getCurrentSession().delete(this.findById(id));
	}

	public void deleteObject(M model) {
		getCurrentSession().delete(model);
	}

	public boolean exists(PK id) {
		return findById(id) != null;
	}

	@SuppressWarnings("unchecked")
	public M findById(PK id) {
		return (M) getCurrentSession().get(this.getEntityClass(), id);
	}

	/**
	 * 根据对象查找集合
	 * 
	 * @param model
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<M> findByExample(M model, Order... orders) {
		Criteria criteria = getExampleCriteria(model);
		for (Order order : orders) {
			criteria.addOrder(order);
		}
		List<M> results = criteria.list();
		return results;
	}
	

	public Criteria getExampleCriteria(M model) {
		Criteria criteria = getCurrentSession().createCriteria(this.getEntityClass())
				.add(Example.create(model));
		return criteria;
	}

	public Criteria getExampleCriteria() {
		Criteria criteria = getCurrentSession().createCriteria(this.getEntityClass());
		return criteria;
	}

	/**
	 * 根据对象查找返回唯一值
	 * 
	 * @param model
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public M findUnique(M model) {
		M result = (M) getExampleCriteria(model).uniqueResult();
		return result;
	}

	/**
	 * 获取所有记录
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<M> findAll(Order... orders) {
		Criteria criteria = getCurrentSession().createCriteria(this.getEntityClass());
		for (Order order : orders) {
			criteria.addOrder(order);
		}
		return criteria.list();
	}
	

	/**
	 * 获取总记录数
	 * 
	 * @return
	 */
	public int countAll() {
		Long total = aggregate(" select count(*) from "
				+ this.getEntityClass().getSimpleName());
		return total.intValue();
	}

	public int count(M model) {
		Criteria criteria = getExampleCriteria(model);
		criteria.setProjection(Projections.projectionList().add(
				Projections.rowCount()));
		return ((Long) criteria.uniqueResult()).intValue();
	}
	
	

	public Long countByHql(String hql, final Object... paramlist) {
		Query query = getCurrentSession().createQuery(hql);
		setParameters(query, paramlist);
		return (Long) query.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public List<M> findByHQL(String hql, final Object... paramlist) {
		Query query = getCurrentSession().createQuery(hql);
		setParameters(query, paramlist);
		List<M> results = query.list();
		return results;
	}

	
	@SuppressWarnings("unchecked")
	public <T> List<T> findByHQL(final String queryHql,
			final Class<T> clazz,final Object... paramlist) {
		Query query = getCurrentSession().createQuery(queryHql);
		setParameters(query, paramlist);
		List<T> results = query.list();
		return results;
	}
	
	
	@SuppressWarnings("rawtypes")
	public List findByHQLNotGeneric(final String queryHql,
			final Object... paramlist) {
		Query query = getCurrentSession().createQuery(queryHql);
		setParameters(query, paramlist);
		List results = query.list();
		return results;
	}
	
	
	
	@SuppressWarnings("unchecked")
	protected List<Object[]> findBySQL(final String sql,final Object... paramlist){
		Query query = getCurrentSession().createSQLQuery(sql);
		setParameters(query, paramlist);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	protected <T> List<T> findBySQL(final String sql, Class<T> entityClass, final Object... paramlist) {
		SQLQuery query = getCurrentSession().createSQLQuery(sql);
		setParameters(query, paramlist);
		query.addEntity(entityClass);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	protected List<Object[]> findByNamedQuery(String queryName,final Object... paramlist){
		Query query = this.getCurrentSession().getNamedQuery(queryName);
		setParameters(query, paramlist);
		return query.list();
	}

	/**
	 * 用于分页
	 * 
	 * @param hql
	 * @param firstResult
	 *            分页起始位置
	 * @param maxResult
	 *            每次查询记录数
	 * @param paramlist
	 * @return
	 */
	@SuppressWarnings("unchecked")
	protected <T> List<T> list(final String hql, final int firstResult,
			final int maxResult, final Object... paramlist) {
		Query query = getCurrentSession().createQuery(hql);
		setParameters(query, paramlist);
		query.setFirstResult(firstResult);
		query.setMaxResults(maxResult);
		List<T> results = query.list();
		return results;
	}

	/**
	 * 根据hql查询记录数
	 * 
	 * @param hql
	 * @param paramlist
	 * @return
	 */
	protected long getCount(String hql, Object... paramlist) {
		long result = -1;
		List<?> list = findByHQL(hql, paramlist);
		if (list != null && list.size() > 0) {
			return ((Number) list.get(0)).longValue();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public <T> List<T> list(Criteria criteria) {
		return criteria.list();
	}

	public void flush() {
		getCurrentSession().flush();
	}

	public void clear() {
		getCurrentSession().clear();
	}

	protected List<M> listSelf(final String hql, final int pn,
			final int pageSize, final Object... paramlist) {
		return this.<M> list(hql, pn, pageSize, paramlist);
	}

	/**
	 * for in
	 */
	@SuppressWarnings("unchecked")
	protected <T> List<T> listWithIn(final String hql, final int start,
			final int length, final Map<String, Collection<?>> map,
			final Object... paramlist) {
		Query query = getCurrentSession().createQuery(hql);
		setParameters(query, paramlist);
		for (Entry<String, Collection<?>> e : map.entrySet()) {
			query.setParameterList(e.getKey(), e.getValue());
		}
		if (start > -1 && length > -1) {
			query.setMaxResults(length);
			if (start != 0) {
				query.setFirstResult(start);
			}
		}
		List<T> results = query.list();
		return results;
	}

	/**
	 * 根据查询条件返回唯一一条记录
	 */
	@SuppressWarnings("unchecked")
	protected <T> T unique(final String hql, final Object... paramlist) {
		Query query = getCurrentSession().createQuery(hql);
		setParameters(query, paramlist);
		return (T) query.uniqueResult();
	}

	/**
	 * 
	 * for in
	 */
	@SuppressWarnings("unchecked")
	protected <T> T aggregate(final String hql,
			final Map<String, Collection<?>> map, final Object... paramlist) {
		Query query = getCurrentSession().createQuery(hql);
		if (paramlist != null) {
			setParameters(query, paramlist);
			for (Entry<String, Collection<?>> e : map.entrySet()) {
				query.setParameterList(e.getKey(), e.getValue());
			}
		}

		return (T) query.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	protected <T> T aggregate(final String hql, final Object... paramlist) {
		Query query = getCurrentSession().createQuery(hql);
		setParameters(query, paramlist);

		return (T) query.uniqueResult();

	}

	/**
	 * 执行批处理语句.如 之间insert, update, delete 等.
	 */
	protected int executeBulk(final String hql, final Object... paramlist) {
		Query query = getCurrentSession().createQuery(hql);
		setParameters(query, paramlist);
		Object result = query.executeUpdate();
		return result == null ? 0 : ((Integer) result).intValue();
	}

	public int executeNativeBulk(final String natvieSQL,
			final Object... paramlist) {
		Query query = getCurrentSession().createSQLQuery(natvieSQL);
		setParameters(query, paramlist);
		Object result = query.executeUpdate();
		return result == null ? 0 : ((Integer) result).intValue();
	}

	@SuppressWarnings("unchecked")
	protected <T> T aggregateByNative(final String natvieSQL,
			final List<Entry<String, Type>> scalarList,
			final Object... paramlist) {
		SQLQuery query = getCurrentSession().createSQLQuery(natvieSQL);
		if (scalarList != null) {
			for (Entry<String, Type> entity : scalarList) {
				query.addScalar(entity.getKey(), entity.getValue());
			}
		}
		setParameters(query, paramlist);
		Object result = query.uniqueResult();
		return (T) result;
	}

	@SuppressWarnings("unchecked")
	public <T> T unique(Criteria criteria) {
		return (T) criteria.uniqueResult();
	}

	public <T> List<T> list(DetachedCriteria criteria) {
		return list(criteria.getExecutableCriteria(getCurrentSession()));
	}

	@SuppressWarnings("unchecked")
	public <T> T unique(DetachedCriteria criteria) {
		return (T) unique(criteria.getExecutableCriteria(getCurrentSession()));
	}

	protected void setParameters(Query query, Object[] paramlist) {
		if (paramlist != null) {
			for (int i = 0; i < paramlist.length; i++) {
				if (paramlist[i] instanceof Date) {
					query.setTimestamp(i, (Date) paramlist[i]);
				} else if (paramlist[i] instanceof Collection) {
					/**
					 * hql或者sql中可以用常量"param" + 参数的索引做名称
					 * 例：
					 * 	from TableA a where a.name = ? and a.id in (:param1)
					 *  索引                                                                               0                                     常量param1
					 *  :1  为参数名称
					 */
					query.setParameterList("param" + i, (Collection<?>) paramlist[i]);
				} else {
					query.setParameter(i, paramlist[i]);
				}
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	public Class<M> getEntityClass() {
		java.lang.reflect.Type type = getClass().getGenericSuperclass();
		ParameterizedType parameterizedType = (ParameterizedType) (type);
		return (Class<M>) (parameterizedType.getActualTypeArguments()[0]);
	}

	public boolean isTableExist(String tableName) {
		String sql = "select count(1) from INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA=database() and table_name=?";
		Query query = getCurrentSession().createSQLQuery(sql);
		query.setParameter(0, tableName);
		BigInteger result = (BigInteger) query.uniqueResult();
		return result.intValue() > 0;
	}

	public boolean isViewExist(String viewName) {
		String sql = "select count(1) from INFORMATION_SCHEMA.VIEWS WHERE TABLE_SCHEMA=database() and table_name=?";
		Query query = getCurrentSession().createSQLQuery(sql);
		query.setParameter(0, viewName);
		BigInteger result = (BigInteger) query.uniqueResult();
		return result.intValue() > 0;
	}
	
	protected String getNamedQueryString(String queryName) {
		Query query = this.getCurrentSession().getNamedQuery(queryName);
		String queryString = query.getQueryString();
		return queryString;
	}
	

}
