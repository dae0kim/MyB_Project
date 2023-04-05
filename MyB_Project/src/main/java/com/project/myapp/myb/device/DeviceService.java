package com.project.myapp.myb.device;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * 사용자 정보 조회와 관련된 기능을 담는 서비스 클래스입니다.
 * 
 * @author 김대영
 * @since 2023.04.04
 *
 */
@Service
public class DeviceService implements IDeviceService {

	@Autowired
	@Qualifier("IDeviceRepository")
	IDeviceRepository deviceRepository;
	
	@Override
	public int emailChkInAdmin(String email) {
		return deviceRepository.emailChkInAdmin(email);
	}

	@Override
	public int emailChkInTeacher(String email) {
		return deviceRepository.emailChkInTeacher(email);
	}

	@Override
	public int emailChkInParent(String email) {
		return deviceRepository.emailChkInParent(email);
	}

	@Override
	public int phoneChkInAdmin(String phone) {
		return deviceRepository.phoneChkInAdmin(phone);
	}

	@Override
	public int phoneChkInTeacher(String phone) {
		return deviceRepository.phoneChkInTeacher(phone);
	}

	@Override
	public int phoneChkInParent(String phone) {
		return deviceRepository.phoneChkInParent(phone);
	}

}
