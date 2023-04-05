package com.project.myapp.myb.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * 원장 사용자, 시스템 관리자와 관련된 기능을 담는 서비스클래스입니다.
 * 
 * @author 김대영
 * @since 2023.04.04
 *
 */
@Service
public class AdminService implements IAdminService {

	@Autowired
	@Qualifier("IAdminRepository")
	IAdminRepository adminRepository;

	@Override
	public void insertAdmin(AdminVO admin) {
		adminRepository.insertAdmin(admin);
	}

	@Override
	public String checkAdminLevel(String email) {
		return adminRepository.checkAdminLevel(email);
	}

	@Override
	public AdminVO selectAdmin(String email) {
		return adminRepository.selectAdmin(email);
	}

	@Override
	public String getPassword(String email) {
		return adminRepository.getPassword(email);
	}

}
