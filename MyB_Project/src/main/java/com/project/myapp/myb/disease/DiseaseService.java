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

	@Override
	public List<DiseaseVO> getDiseaseList() {
		return diseaseRepository.getDiseaseList();
	}
}


