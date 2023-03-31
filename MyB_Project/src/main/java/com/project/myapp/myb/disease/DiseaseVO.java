package com.project.myapp.myb.disease;

import java.util.Date;

import lombok.Data;

@Data
public class DiseaseVO {
	private int diseaseId;
	private String diseaseName;
	
	//  추가
	private Date diseaselogDate;
}
