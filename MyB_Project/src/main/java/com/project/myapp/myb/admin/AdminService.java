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
	public List<AdminVO> getAdminList() {
		return adminRepository.getAdminList();
	}

}
