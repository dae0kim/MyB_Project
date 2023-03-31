package com.project.myapp.myb.request;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class RequestService implements IRequestService{

	@Autowired
	@Qualifier("IRequestRepository")
	IRequestRepository requestRepository;
	
	// 요청사항 작성하기 (0328 문수지)
	@Override
	public void insertRequest(RequestVO request) {
		requestRepository.insertRequest(request);
	}
	
	// 요청사항 확인하기 (0330 문수지)
	@Override
	public RequestVO selectRequest(int childId, String requestDate) {
		return requestRepository.selectRequest(childId, requestDate);
	}

	// (0329 합침 일형추가)
	@Override
	public List<RequestVO> teacherCheckList() {
		return requestRepository.teacherCheckList();
	}

	// (0329 합침 일형추가)
	@Override
	public List<RequestVO> getRequestIdList(int teacherId) {
		return requestRepository.getRequestIdList(teacherId);
	}

	// (0329 합침 일형추가)
	@Override
	public RequestVO getCheckDetail(int requestId) {
		System.out.println("서비스동작확인");
		return requestRepository.getCheckDetail(requestId);
	}

	@Override
	public void updateRequest(RequestVO requestvo) {
		// TODO Auto-generated method stub
		requestRepository.updateRequest(requestvo);
	}





}

	//(0329 합침 일형추가)
	/*
	 * @Override public RequestVO getCheckDetail(int teacherId) { return
	 * requestRepository.getCheckDetail(teacherId); }
	 */