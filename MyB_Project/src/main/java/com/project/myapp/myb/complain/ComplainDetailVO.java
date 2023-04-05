package com.project.myapp.myb.complain;

import lombok.Data;

/**
 * 컴플레인 상세 정보를 담는 클래스입니다.
 * 
 * @author 김대영
 * @since 2023.04.04
 *
 */
@Data
public class ComplainDetailVO {
	private String parentName;
	private String parentPhone;
	private String childName;
	private String classroomName;
}
