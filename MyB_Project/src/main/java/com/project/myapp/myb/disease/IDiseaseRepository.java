package com.project.myapp.myb.disease;

import java.util.List;

public interface IDiseaseRepository {
	
	/**
	 * 질병 리스트를 가져오는 메서드입니다.
	 * 
	 * @return 질병을 리스트 형태로 반환합니다.
	 */
	List<DiseaseVO> getDiseaseList();
}
