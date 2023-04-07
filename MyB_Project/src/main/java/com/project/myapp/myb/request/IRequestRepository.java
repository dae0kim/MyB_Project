package com.project.myapp.myb.request;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IRequestRepository {
	
	/**
	 * 요청사항 작성시 사용하는 메서드입니다.
	 * 
	 * @param request 요청사항의 정보를 담은 객체를 VO형태로 반환합니다.
	 */
	void insertRequest(RequestVO request);
	
	/**
	 * 요청사항을 확인할때 사용되는 메서드입니다.
	 * 
	 * @param childId 자녀 식별번호를 입력합니다
	 * @param requestDate 요청 입력날짜를 입렵합니다
	 * @return 식별번호와 날짜에 맞는 요청사항을 확인합니다.
	 */
	RequestVO selectRequest(@Param("childId") int childId, @Param("requestDate") String requestDate);
	
	/**
	 * 요청사항 리스트 페이지를 출력하는 메서드입니다
	 * 
	 * @return 요청사항 리스트를 출력합니다.
	 */
	List<RequestVO> teacherCheckList();
	
	/**
	 * 요청사항 식별번호를 리스트로 받아오는 메서드입니다.
	 * 
	 * @param teacherId 교사 식별번호를 입력합니다.
	 * @return 요청사항 식별번호를 리스트로 출력합니다.
	 */
	List<RequestVO> getRequestIdList(int teacherId);
	
	/**
	 * 요청사항 상세를 확인하는 메서드입니다.
	 * 
	 * @param requestId 요청 식별번호가 입력됩니다.
	 * @return 요청사항의 상세가 출력됩니다.
	 */
	RequestVO getCheckDetail(int requestId);
	
	/**
	 * 요청사항을 확인하는 메서드입니다.
	 * 
	 * @param requestvo 업데이트된 요청사항이 담긴 객체를 VO형태로 반환합니다.
	 */
	void updateRequest(RequestVO requestvo);
}
