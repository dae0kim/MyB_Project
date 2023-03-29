package com.project.myapp.myb.diseaselog;

import java.util.Date;

import lombok.Data;

@Data
public class DiseaselogVO {
	private int diseaselogId;
	private Date diseaselogDate;
	private int diseaseId;
	private String kindergartenCity;
	private String kindergartenGu;
	private int classroomId;
	private int kindergartenId;
	private int childId;
	
	// 추가
	private int totalPatient;
}
