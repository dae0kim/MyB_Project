package com.project.myapp.myb.classroom;

import lombok.Data;

/**
 * 반 정보를 담는 클래스입니다.
 * 
 * @author 문수지,손일형,김대영
 * @since 2023.04.04
 *
 */
@Data
public class ClassroomVO {
	private int classroomId;
	private String classroomName;
	private int kindergartenId;
}
