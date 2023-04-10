package com.project.myapp.myb.parent;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * 부모 사용자와 관련된 기능을 담는서비스클래스입니다.
 * 
 * @author 문수지, 손일형
 * @since 2023.03.22
 *
 */
@Service
public class ParentService implements IParentService {

	@Autowired
	@Qualifier("IParentRepository")
	IParentRepository parentRepository;

	@Override
	public void insertParent(ParentVO parent) {
		parentRepository.insertParent(parent);
	}

	@Override
	public ParentVO selectParent(String parentEmail) {
		return parentRepository.selectParent(parentEmail);
	}

	@Override
	public int pwChk(String parentEmail, String parentPw) throws Exception {
		return parentRepository.pwChk(parentEmail, parentPw);
	}

	@Override
	public void updateParent(ParentVO parent) {
		parentRepository.updateParent(parent);
	}

	@Override
	public List<ParentVO> getParentName(int teacherId) {
		return parentRepository.getParentName(teacherId);
	}

	@Override
	public List<Integer> selectParentIdByAdmin(int adminId) {
		return parentRepository.selectParentIdByAdmin(adminId);
	}

	@Override
	public int getTeacherId(int parentId) {
		return parentRepository.getTeacherId(parentId);
	}
	
}
