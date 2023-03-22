package com.project.myapp.myb.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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
