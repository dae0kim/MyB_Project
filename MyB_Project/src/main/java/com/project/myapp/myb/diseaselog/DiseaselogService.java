package com.project.myapp.myb.diseaselog;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class DiseaselogService implements IDiseaselogService {

	@Autowired
	@Qualifier("IDiseaselogRepository")
	IDiseaselogRepository diseaselogRepository;

	// (0329 합침 일형추가)
	@Override
	public void insertDiseaseLog(DiseaselogVO diseaselogvo) {
		diseaselogRepository.insertDiseaseLog(diseaselogvo);

	}

	@Override
	public List<DiseaselogVO> defaultDisase(int teacherId) {
		// TODO Auto-generated method stub return
		return diseaselogRepository.defaultDisase(teacherId);
	}

	@Override
	public List<DiseaselogEtcVO> test(int classroomId) {
		// TODO Auto-generated method stub
		return diseaselogRepository.test(classroomId);
	}

	/* -----------------------------웹 기능----------------------------- */
	@Override
	public void showview() {
		diseaselogRepository.showview();
	}

	@Override
	public List<Map<String, Object>> countChildDiseaseList(String gu) {
		return diseaselogRepository.countChildDiseaseList(gu);
	}

	@Override
	public List<DiseaselogVO> countChildGuList() {
		return diseaselogRepository.countChildGuList();
	}

}
