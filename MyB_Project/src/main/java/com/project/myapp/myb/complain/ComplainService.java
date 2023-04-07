package com.project.myapp.myb.complain;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * 컴플레인과 관련된 기능을 담는 서비스클래스입니다.
 * 
 * @author 문수지,손일형,김대영
 * @since 2023.04.04
 *
 */
@Service
public class ComplainService implements IComplainService {
	
	@Autowired
	@Qualifier("IComplainRepository")
	IComplainRepository complainRepository;
	
	@Override
	public void insertComplain(ComplainVO complain) {
		complainRepository.insertComplain(complain);
	}

	@Override
	public List<ComplainVO> selectComplainList(int parentId) {
		return complainRepository.selectComplainList(parentId);
	}

	@Override
	public ComplainVO selectComplain(int complainId) {
		return complainRepository.selectComplain(complainId);
	}
	
	/* -----------------------------웹 기능 : 김대영----------------------------- */
	@Override
	public List<ComplainVO> selectComplainList2(int adminId) {
		return complainRepository.selectComplainList2(adminId);
	}

	@Override
	public ComplainVO selectComplainInfo(int complainId) {
		return complainRepository.selectComplainInfo(complainId);
	}

	@Override
	public void updateComplain(int complainId) {
		complainRepository.updateComplain(complainId);
	}

	@Override
	public ComplainDetailVO selectComplainDetail(int complainId) {
		return complainRepository.selectComplainDetail(complainId);
	}

}
