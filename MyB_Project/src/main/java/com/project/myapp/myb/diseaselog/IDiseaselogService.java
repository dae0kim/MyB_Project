package com.project.myapp.myb.diseaselog;

import java.util.List;
import java.util.Map;

/**
 * 질병로그 데이터와 관련된 기능을 담는 서비스 인터페이스입니다.
 * 
 * @author 손일형,김대영
 * @since 2023.04.04
 *
 */
public interface IDiseaselogService {

	// (0329 합침 일형추가)
	void insertDiseaseLog (DiseaselogVO diseaselogvo);
	
	/* List<DiseaselogVO> defaultDisase(int teacherId); */
	
	List<DiseaselogEtcVO> test(int classroomId);
	
	/* -----------------------------웹 기능 : 김대영----------------------------- */
	/**
	 * 각 구별 환자 수 반환을 위한 메서드입니다.
	 * 
	 * @return 질병로그 정보를 담은 객체 리스트를 반환합니다.
	 */
	List<DiseaselogVO> countChildGuList();

	/**
	 * 히트맵에서 특정 구의 질병 비율을 반환하기 위한 메서드입니다.
	 * 
	 * @param gu 구 이름을 입력합니다.
	 * @return 질병 이름과 환자수를 담은 맵 리스트를 반환합니다.
	 */
	List<Map<String, Object>> countChildDiseaseList(String gu);
}
