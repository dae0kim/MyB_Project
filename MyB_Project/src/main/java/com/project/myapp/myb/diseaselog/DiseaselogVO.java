package com.project.myapp.myb.diseaselog;

import java.util.Date;

import lombok.Data;

/**
 * 질병로그 정보를 담는 클래스입니다.
 * 
 * @author 손일형,김대영
 * @since 2023.04.04
 * 
 */
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
	private int totalPatient;
}
