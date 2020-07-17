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
		boolean checkId = repository.existsById(todo.getId());
		if (checkId) {
			repository.save(todo);
		}else {
			System.out.println("Not found");
		}
	}
	
	public void deleteMyToDos(Long id) {
		repository.deleteById(id);
	}

}
