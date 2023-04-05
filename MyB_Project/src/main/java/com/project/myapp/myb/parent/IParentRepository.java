package com.project.myapp.myb.parent;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IParentRepository {
	void insertParent(ParentVO parent);
	ParentVO selectParent(String parentEmail);
	int emailChk(String parentEmail);
	int phoneChk(String parentPhone);
	int pwChk(@Param(value="parentEmail")String parentEmail, @Param(value="parentPw")String parentPw);
	void updateParent(ParentVO parent);
	// adminId에 따른 parentId 가져오기 (0403 문수지)
	List<Integer> selectParentIdByAdmin(int adminId);
	
	// 일형추가 : 부모이름 불러오기 (0329 합침 일형추가)
	List<ParentVO> getParentName(@Param(value="teacherId")int teacherId);
}
