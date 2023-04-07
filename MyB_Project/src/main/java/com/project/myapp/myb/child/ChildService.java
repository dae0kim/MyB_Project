package com.project.myapp.myb.child;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * 자녀와 관련된 기능을 담는 서비스클래스입니다.
 * 
 * @author 문수지, 손일형
 * @since 2023.03.23
 *
 */
@Service
public class ChildService implements IChildService {

	@Autowired
	@Qualifier("IChildRepository")
	IChildRepository childRepository;
	
	@Override
	public void insertChild(ChildVO child) {
		childRepository.insertChild(child);
	}

	@Override
	public ChildVO selectChild(String parentEmail) {
		return childRepository.selectChild(parentEmail);
	}

	@Override
	public List<ChildVO> selectAllChildList(String parentEmail) {
		return childRepository.selectAllChildList(parentEmail);
	}

	@Override
	public List<ChildVO> getChildNameList(int teacherId) {
		return childRepository.getChildNameList(teacherId);
	}
	
	@Override
	public ChildVO selectChildById(int childId) {
		return childRepository.selectChildById(childId);
	}

}

