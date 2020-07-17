package com.mytodos.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mytodos.model.MyToDos;


public interface MyToDosRepository extends JpaRepository<MyToDos, Long>{

}
