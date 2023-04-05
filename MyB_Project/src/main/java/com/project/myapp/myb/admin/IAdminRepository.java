package com.project.myapp.myb.admin;


/**
 * 원장 사용자, 시스템 관리자와 관련된 기능을 담는 레포지토리 인터페이스입니다.
 * 
 * @author 김대영
 * @since 2023.04.04
 *
 */
public interface IAdminRepository {

	/**
	 * 원장 사용자의 회원가입을 통해 사용자 정보를 DB에 넣어주는 메서드입니다. 
	 * 
	 * @param admin 원장 사용자의 정보를 담은 VO객체를 입력합니다.
	 */
	void insertAdmin(AdminVO admin);

	/**
	 * 로그인을 시도한 사용자 정보를 VO객체로 받아오는 메서드입니다.
	 * 
	 * @param email 이메일을 입력합니다. 
	 * @return 해당 이메일을 사용하는 사용자 정보를 DB에서 받아와 VO객체로 반환합니다.
	 */
	AdminVO selectAdmin(String email);
	
	/**
	 * 로그인을 시도한 사용자의 이메일을 통해 비밀번호를 반환하는 메서드입니다.
	 * 
	 * @param email 이메일을 입력합니다.
	 * @return 입력받은 이메일을 사용하는 사용자의 비밀번호를 반환합니다.
	 */
	String getPassword(String email);
	
	/**
	 * 로그인을 시도한 사용자가 원장 사용자인지, 시스템 관리자인지 구분하기 위한 메서드입니다.
	 * 
	 * @param email 이메일을 입력합니다.
	 * @return 입력받은 이메일을 사용하는 사용자의 레벨을 반환합니다.
	 */
	String checkAdminLevel(String email);
}
