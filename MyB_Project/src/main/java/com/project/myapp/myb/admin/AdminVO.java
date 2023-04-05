package com.project.myapp.myb.admin;

import lombok.Data;

/**
 * 사용자 정보를 담는 클래스입니다.
 * 
 * @author 김대영
 * @since 2023.04.04
 * 
 */
@Data
public class AdminVO {
	private int adminId;
	private String adminName;
	private String adminEmail;
	private String adminPw;
	private String adminPhone;
	private String adminLevel;
}
