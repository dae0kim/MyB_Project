package com.project.myapp.myb.parent;

import java.util.List;

public interface IParentService {
	void insertParent(ParentVO parent);
	ParentVO selectParent(String parentEmail);
	int emailChk(String parentEmail) throws Exception;
	int phoneChk(String parentPhone) throws Exception;
	int pwChk(String parentEmail, String parentPw) throws Exception;
	void updateParent(ParentVO parent);
	
	// 일형추가 : 부모이름 불러오기 (0329 합침 일형추가)
	List<ParentVO> getParentName(int teacherId);
}
