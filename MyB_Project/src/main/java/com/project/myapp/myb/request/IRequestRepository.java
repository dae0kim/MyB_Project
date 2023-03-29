package com.project.myapp.myb.request;

import java.util.List;

public interface IRequestRepository {
	// 요청사항 작성하기 (0328 문수지)
	void insertRequest(RequestVO request);
	
	//요청사항 리스트 페이지 (0329 합침 일형추가)
	List<RequestVO> teacherCheckList();
	// 요청사항 id 리스트 (0329 합침 일형추가)
	List<RequestVO> getRequestIdList(int teacherId);
	// 요청사항 상세 (0329 합침 일형추가)
	RequestVO getCheckDetail(int requestId);
}
