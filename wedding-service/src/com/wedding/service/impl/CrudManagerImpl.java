package com.wedding.service.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.hibernate.Query;
import org.springframework.context.annotation.Scope;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Component;

import com.wedding.service.dao.CrudManager;

@SuppressWarnings("unchecked")
@Component("crudManager")
@Scope("prototype")
public class CrudManagerImpl<T> extends HibernateDaoSupport implements
		CrudManager<T> {

	public void delete(Class<T> clazz, String... ids) {
		for (String id : ids) {
			T t = (T) this.getHibernateTemplate().get(clazz,
					Integer.parseInt(id));
			this.getHibernateTemplate().clear();
			if (t != null) {
				this.getHibernateTemplate().delete(t);
			}
		}

	}

	public T find(Class<T> clazz, Integer id) {
		return (T) this.getHibernateTemplate().get(clazz, id);
	}

	public List<T> findAll(Class<T> clazz) {
		return (List<T>) this.getSession().createQuery(
				"from " + clazz.getSimpleName() + " as "
						+ clazz.getSimpleName().toLowerCase()).list();
	}

	public List<T> findSub(Class<T> clazz, int num) {
		return (List<T>) this.getSession().createQuery(
				"from " + clazz.getSimpleName() + " as "
						+ clazz.getSimpleName().toLowerCase()).setMaxResults(
				num).list();
	}

	public void modify(T t) {
		this.getHibernateTemplate().update(t);
	}

	public void save(T t) {
		this.getHibernateTemplate().saveOrUpdate(t);
	}

	public List<T> executeQuery(String hql, Map<String, Object> map) {
		Query query = this.getSession().createQuery(hql);
		Iterator it = map.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, Object> entry = (Entry<String, Object>) it.next();
			query.setParameter(entry.getKey(), entry.getValue());
		}
		return (List<T>) query.list();
	}

}
