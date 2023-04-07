package com.project.myapp.myb.diseaselog;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * 질병로그 데이터와 관련된 기능을 담는 서비스클래스입니다.
 * 
 * @author 손일형,김대영
 * @since 2023.04.04
 *
 */
@Service
public class DiseaselogService implements IDiseaselogService {

	@Autowired
	@Qualifier("IDiseaselogRepository")
	IDiseaselogRepository diseaselogRepository;

	@Override
	public void insertDiseaseLog(DiseaselogVO diseaselogvo) {
		diseaselogRepository.insertDiseaseLog(diseaselogvo);
	}

	@Override
	public List<DiseaselogEtcVO> test(int classroomId) {
		// TODO Auto-generated method stub
		return diseaselogRepository.test(classroomId);
	}

	/* -----------------------------웹 기능 : 김대영----------------------------- */
	@Override
	public List<Map<String, Object>> countChildDiseaseList(String gu) {
		return diseaselogRepository.countChildDiseaseList(gu);
	}

	@Override
	public List<DiseaselogVO> countChildGuList() {
		return diseaselogRepository.countChildGuList();
	}


}
