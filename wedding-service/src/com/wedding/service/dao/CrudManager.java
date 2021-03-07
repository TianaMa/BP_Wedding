package com.wedding.service.dao;

import java.util.List;
import java.util.Map;

public interface CrudManager<T> {

	public void save(T t);

	public void delete(Class<T> clazz, String... ids);

	public void modify(T t);

	public T find(Class<T> clazz, Integer id);

	public List<T> executeQuery(String hql, Map<String, Object> map);

	public List<T> findAll(Class<T> clazz);

	public List<T> findSub(Class<T> clazz, int num);

}
