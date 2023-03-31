package com.project.myapp.myb.diseaselog;

import java.util.List;
import java.util.Map;

import com.project.myapp.myb.classroom.ClassroomSeqVO;
import com.project.myapp.myb.disease.DiseaseVO;

public interface IDiseaselogRepository {
	
	// (0329 합침 일형추가)
	void insertDiseaseLog (DiseaselogVO diseaselogvo);
	
	List<DiseaselogVO> defaultDisase(int teacherId);
	
	List<DiseaselogEtcVO> test(int classroomId);
	
	/* -----------------------------웹 기능----------------------------- */
	void showview();
	
	// 관리자 웹 지도에 각 구별 전체 환자 수를 표시하기 위함
	List<DiseaselogVO> countChildGuList();

	// 관리자 웹에서 지도의 구를 클릭했을 때 해당 구의 각 질병당 환자 수를 반환
	List<Map<String, Object>> countChildDiseaseList(String gu);

}
