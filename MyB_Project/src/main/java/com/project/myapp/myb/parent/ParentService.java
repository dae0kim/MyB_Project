package com.project.myapp.myb.parent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ParentService implements IParentService {

	@Autowired
	IParentRepository parentDao;
	
	@Override
	public void insertParent(ParentVO parent) {
		parentDao.insertParent(parent);
	}

	@Override
	public ParentVO selectParent(String parentEmail) {
		return parentDao.selectParent(parentEmail);
	}
	
}
