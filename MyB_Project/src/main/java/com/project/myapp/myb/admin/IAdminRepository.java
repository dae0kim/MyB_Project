package com.project.myapp.myb.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IAdminRepository {

	// 회원가입
	void insertAdmin(AdminVO admin);
	
	// 로그인 - 성공하면 해당 사용자 객체 반환 필요
	AdminVO selectAdmin(String email);
	String getPassword(String email);
	
	
	
	// 관리자 레벨 분류
	// 로그인 시점의 입력받은 email을 통해 admin테이블에서
	// 해당 email을 가진 사용자의 레벨을 string으로 반환
	String checkAdminLevel(String email);
}
