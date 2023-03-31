package com.project.myapp.myb.child;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class ChildService implements IChildService {

	@Autowired
	@Qualifier("IChildRepository")
	IChildRepository childRepository;
	
	// 어린이 정보 삽입 (0324 문수지)		
	@Override
	public void insertChild(ChildVO child) {
		childRepository.insertChild(child);
	}

	// 첫째 어린이 정보 불러오기 (0327 문수지)
	@Override
	public ChildVO selectChild(String parentEmail) {
		return childRepository.selectChild(parentEmail);
	}

	// 모든 자녀 정보 불러오기 (0328 문수지)
	@Override
	public List<ChildVO> selectAllChildList(String parentEmail) {
		return childRepository.selectAllChildList(parentEmail);
	}

	// (0329 합침 일형추가)
	// int classroomId => int teacherId 수정
	@Override
	public List<ChildVO> getChildNameList(int teacherId) {
		return childRepository.getChildNameList(teacherId);
	}
	
	//0330 수지
	@Override
	public ChildVO selectChildById(int childId) {
		return childRepository.selectChildById(childId);
	}

}

