package com.project.myapp.myb.diseaselog;

import java.util.Date;

import lombok.Data;

@Data
public class DiseaselogVO {
	private int diseaselogId;
	private Date diseaselogDate;
	private int diseaseId;
	private int classroomId;
}
