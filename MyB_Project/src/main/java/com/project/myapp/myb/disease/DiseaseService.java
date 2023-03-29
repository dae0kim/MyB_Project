package com.project.myapp.myb.disease;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class DiseaseService implements IDiseaseService {

	@Autowired
	@Qualifier("IDiseaseRepository")
	IDiseaseRepository diseaseRepository;

	// (0329 합침 일형추가)
	@Override
	public List<DiseaseVO> getDiseaseList() {
		return diseaseRepository.getDiseaseList();
	}



	
}


