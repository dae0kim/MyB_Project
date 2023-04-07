package com.project.myapp.myb.complain;

import java.util.List;

import org.apache.ibatis.annotations.Param;

/**
 * 컴플레인과 관련된 기능을 담는 레포지토리 인터페이스입니다.
 * 
 * @author 문수지,손일형,김대영
 * @since 2023.04.04
 *
 */
public interface IComplainRepository {
	
	/**
	 * 부모 사용자가 원장에게 1:1 문의을 작성하기 위한 메소드입니다.
	 * 
	 * @param complain 1:1 문의 정보가 담긴 객체를 입력합니다.
	 */
	void insertComplain(ComplainVO complain);
	
	/**
	 * 부모 사용자가 작성한 1:1 문의를 가져오기 위한 메서드입니다.
	 * 
	 * @param parentId 부모 사용자 식별번호를 입력합니다.
	 * @return 해당하는 부모 사용자의 1:1 문의 객체 리스트를 반환합니다.
	 */
	List<ComplainVO> selectComplainList(int parentId);
	
	/**
	 * 부모 사용자가 작성한 1:1 문의 상세정보 확인을 위한 메서드입니다.
	 * 
	 * @param complainId 1:1 문의 식별번호를 입력합니다.
	 * @return 해당 식별번호를 가진 1:1문의 정보를 VO객체로 반환합니다.
	 */
	ComplainVO selectComplain(@Param("complainId") int complainId);
	
	/* -----------------------------웹 기능 : 김대영----------------------------- */
	/**
	 * 원장 사용자의 어린이집에 등록된 모든 컴플레인 반환을 위한 메서드입니다.
	 * 
	 * @param adminId 사용자 식별번호를 입력합니다.
	 * @return 컴플레인 정보를 담은 객체 리스트를 반환합니다.
	 */
	List<ComplainVO> selectComplainList2(int adminId);
	
	/**
	 * 컴플레인 기본정보 확인을 위한 메서드입니다.
	 * 
	 * @param complainId 컴플레인 식별번호를 입력합니다.
	 * @return 해당 컴플레인의 기본정보를 담은 객체를 반환합니다.
	 */
	ComplainVO selectComplainInfo(int complainId);
	
	/**
	 * 컴플레인 상세정보 확인을 위한 메서드입니다.
	 * 
	 * @param complainId 컴플레인 식별번호를 입력합니다.
	 * @return 해당 컴플레인의 상세정보를 담은 객체를 반환합니다.
	 */
	ComplainDetailVO selectComplainDetail(int complainId);
	
	/**
	 * 컴플레인의 상태 업데이트를 위한 메서드입니다.
	 * 
	 * @param complainId 컴플레인 식별번호를 입력합니다.
	 */
	void updateComplain(int complainId);
		
}
