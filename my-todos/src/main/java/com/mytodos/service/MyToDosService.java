package com.mytodos.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mytodos.model.MyToDos;
import com.mytodos.repository.MyToDosRepository;

@Service
@Transactional
public class MyToDosService {
	@Autowired
	private MyToDosRepository repository;

	public List<MyToDos> findAll() {
		return repository.findAll();
	}

	public void createMyToDos(MyToDos entity) {
		repository.save(entity);
	}

	public MyToDos findMyToDos(Long id) {
		return repository.getOne(id);
	}

	public void editMyToDos(MyToDos todo) {
		MyToDos dbTodo = repository.getOne(todo.getId());
		dbTodo.setStartDate(todo.getStartDate());
		dbTodo.setEndDate(todo.getEndDate());
		dbTodo.setStatus(todo.getStatus());
		dbTodo.setTaskName(todo.getTaskName());
		repository.save(dbTodo);
	}

	public void deleteMyToDos(Long id) {
		repository.deleteById(id);
	}

}
