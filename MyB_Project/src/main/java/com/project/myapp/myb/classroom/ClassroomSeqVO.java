package com.project.myapp.myb.classroom;

import lombok.Data;

/**
 * 반 식별번호와 이름을 담는 클래스입니다.
 * 
 * @author 김대영
 * @since 2023.04.04
 *
 */
@Data
public class ClassroomSeqVO {
	private int adminId;
	private String classroomName;
}
