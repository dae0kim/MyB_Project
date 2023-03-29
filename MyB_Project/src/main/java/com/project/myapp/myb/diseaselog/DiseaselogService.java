package com.project.myapp.myb.diseaselog;

import java.util.HashMap;
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

	// (0329 합침 일형추가)
	@Override
	public List<DiseaselogVO> setDiseaseId(int teacherId) {
		// TODO Auto-generated method stub
		return diseaselogRepository.setDiseaseId(teacherId);
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
