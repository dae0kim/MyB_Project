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
	
	@Override
	public void insertRequest(RequestVO request) {
		requestRepository.insertRequest(request);
	}
	
	@Override
	public RequestVO selectRequest(int childId, String requestDate) {
		return requestRepository.selectRequest(childId, requestDate);
	}

	@Override
	public List<RequestVO> teacherCheckList() {
		return requestRepository.teacherCheckList();
	}

	@Override
	public List<RequestVO> getRequestIdList(int teacherId) {
		return requestRepository.getRequestIdList(teacherId);
	}

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