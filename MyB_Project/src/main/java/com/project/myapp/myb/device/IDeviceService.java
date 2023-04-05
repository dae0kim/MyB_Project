package com.project.myapp.myb.device;

/**
 * 사용자 정보 조회와 관련된 기능을 담는 서비스 인터페이스입니다.
 * 
 * @author 김대영
 * @since 2023.04.04
 *
 */
public interface IDeviceService {

	// 회원가입시 모든 사용자 테이블에서 email 중복체크
	int emailChkInAdmin(String email);
	int emailChkInTeacher(String email);
	int emailChkInParent(String email);
	
	// 회원가입시 모든 사용자 테이블에서 phone 중복체크
	int phoneChkInAdmin(String phone);
	int phoneChkInTeacher(String phone);
	int phoneChkInParent(String phone);
}
