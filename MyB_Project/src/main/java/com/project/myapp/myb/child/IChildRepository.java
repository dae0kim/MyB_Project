package com.project.myapp.myb.child;

import java.util.List;

/**
 * 자녀와 관련된 기능을 담는 레포지토리 인터페이스입니다.
 * 
 * @author 문수지, 손일형
 * @since 2023.03.23
 *
 */
public interface IChildRepository {
	
	/**
	 * 부모 사용자의 회원가입을 통해 자녀 정보를 DB에 넣어주는 메서드입니다.
	 * 
	 * @param child 자녀 정보를 담은 VO객체를 입력합니다.
	 */
	void insertChild(ChildVO child);
	
	/**
	 * 부모 사용자의 첫째 자녀 정보를 VO객체로 받아오는 메서드입니다.
	 * 
	 * @param parentEmail 부모 사용자의 이메일을 입력합니다.
	 * @return 해당 이메일을 사용하는 부모 사용자의 첫째 자녀 정보를 VO객체로 반환합니다.
	 */
	ChildVO selectChild(String parentEmail);
	
	/**
	 * 부모 사용자의 모든 자녀 정보를 가져오기 위한 메서드입니다.
	 * 
	 * @param parentEmail 부모 사용자의 이메일을 입력합니다.
	 * @return 해당 이메일을 사용하는 부모 사용자의 모든 자녀 객체 리스트를 반환합니다.
	 */
	List<ChildVO> selectAllChildList(String parentEmail);
	
	/**
	 * 교사 사용자가 담당하는 반 아이들 정보를 가져오기 위한 메서드입니다.
	 * 
	 * @param teacherId 교사 사용자의 식별번호를 입력합니다.
	 * @return 해당 식별번호를 가진 교사 사용자가 담당하는 반 아이들 객체 리스트를 반환합니다.
	 */
	List<ChildVO> getChildNameList(int teacherId);
	
	/**
	 * 해당하는 자녀의 정보를 VO객체로 가져오기 위한 메서드입니다.
	 * 
	 * @param childId 자녀의 식별번호를 입력합니다.
	 * @return 해당 식별번호를 가진 자녀의 정보를 VO객체로 반환합니다.
	 */
	ChildVO selectChildById(int childId);
}
