package com.project.myapp.myb.complain;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class ComplainService implements IComplainService {
	
	@Autowired
	@Qualifier("IComplainRepository")
	IComplainRepository complainRepository;
	
	// 1:1문의 작성
	@Override
	public void insertComplain(ComplainVO complain) {
		complainRepository.insertComplain(complain);
	}

	// 1:1문의 리스트 불러오기
	@Override
	public List<ComplainVO> selectComplainList(int parentId) {
		return complainRepository.selectComplainList(parentId);
	}

	@Override
	public ComplainVO selectComplain(int complainId) {
		return complainRepository.selectComplain(complainId);
	}
	
	/* -----------------------------웹 기능----------------------------- */
	@Override
	public List<ComplainVO> selectComplainList2(int adminId, int page) {
		int start = (page-1)*10-1;
		return complainRepository.selectComplainList2(adminId, start, start+9);
	}

	@Override
	public int selectTotalComplainCount(int adminId) {
		return complainRepository.selectTotalComplainCount(adminId);
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
