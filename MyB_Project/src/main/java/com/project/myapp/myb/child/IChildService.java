package com.project.myapp.myb.child;

import java.util.List;

public interface IChildService {
	// 어린이 정보 삽입 (0324 문수지)
	void insertChild(ChildVO child);
	// 첬째 어린이 정보 불러오기 (0327 문수지)
	ChildVO selectChild(String parentEmail);
	// 모든 자녀 정보 불러오기 (0328 문수지)
	List<ChildVO> selectAllChildList(String parentEmail);
	// (0329 합침 일형추가)
	List<ChildVO> getChildNameList(int teacherId);
}
