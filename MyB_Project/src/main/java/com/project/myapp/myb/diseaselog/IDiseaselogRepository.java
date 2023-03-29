package com.project.myapp.myb.diseaselog;

import java.util.List;
import java.util.Map;

public interface IDiseaselogRepository {
	void showview();
	
	// 관리자 웹 지도에 각 구별 전체 환자 수를 표시하기 위함
	List<DiseaselogVO> countChildGuList();

	// 관리자 웹에서 지도의 구를 클릭했을 때 해당 구의 각 질병당 환자 수를 반환
	List<Map<String, Object>> countChildDiseaseList(String gu);

}
