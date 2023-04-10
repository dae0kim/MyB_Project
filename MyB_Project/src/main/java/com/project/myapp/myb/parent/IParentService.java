package com.project.myapp.myb.parent;

import java.util.List;

/**
 * 부모 사용자와 관련된 기능을 담는 서비스 인터페이스입니다.
 * 
 * @author 문수지, 손일형
 * @since 2023.03.22
 *
 */
public interface IParentService {
	
	/**
	 * 부모 사용자의 회원가입을 통해 사용자 정보를 DB에 넣어주는 메서드입니다.
	 * 
	 * @param parent 부모 사용자의 정보를 담은 VO객체를 입력합니다.
	 */
	void insertParent(ParentVO parent);
	
	/**
	 * 로그인을 시도한 부모 사용자 정보를 VO객체로 받아오는 메서드입니다.
	 * 
	 * @param parentEmail 부모 사용자의 이메일을 입력합니다.
	 * @return 해당 이메일을 사용하는 부모 사용자 정보를 VO객체로 반환합니다.
	 */
	ParentVO selectParent(String parentEmail);
	
	/**
	 * 로그인을 시도한 부모 사용자의 이메일과 비밀번호가 일치하는 지 확인하는 메서드입니다.
	 * 
	 * @param parentEmail 부모 사용자의 이메일을 입력합니다.
	 * @param parentPw 부모 사용자의 비밀번호를 입력합니다.
	 * @return 해당 이메일과 비밀번호가 일치하는 정보의 개수를 반환합니다.
	 */
	int pwChk(String parentEmail, String parentPw) throws Exception;
	
	/**
	 * 부모 사용자의 정보를 수정하기 위한 메서드입니다.
	 * 
	 * @param parent 수정된 부모 사용자의 정보가 담긴 객체를 입력합니다.
	 */
	void updateParent(ParentVO parent);
	
	/**
	 * 해당 어린이집에 속한 모든 부모 식별번호를 가져오기 위한 메서드입니다.
	 * 
	 * @param adminId 원장 사용자 식별번호를 입력합니다.
	 * @return 해당 원장이 담당하는 어린이집에 속한 부모 아이디 리스트를 반환합니다.
	 */
	List<Integer> selectParentIdByAdmin(int adminId);
	
	/**
	 * 해당 교사가 담당하는 반의 부모 이름을 가져오기 위한 메서드입니다.
	 * 
	 * @param teacherId 교사 사용자의 식별번호를 입력합니다.
	 * @return 해당 식별번호를 가진 교사가 담당하는 반의 부모 이름 리스트를 반환합니다.
	 */
	List<ParentVO> getParentName(int teacherId);
	
	/**
	 * 교사 식별번호를 가져오기 위한 메서드입니다.
	 * 
	 * @param parentId 교사 식별번호를 입력합니다
	 * @return 부모 식별번호에 해당하는 교사 식별번호를 반환합니다.
	 */
	int getTeacherId (int parentId);	
}
