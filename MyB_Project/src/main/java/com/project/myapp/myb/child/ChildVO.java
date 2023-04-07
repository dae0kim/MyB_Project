package com.project.myapp.myb.child;

import java.util.Date;

import lombok.Data;

/**
 * 자녀 정보를 담는 클래스입니다.
 * 
 * @author 문수지
 * @since 2023.03.23
 *
 */
@Data
public class ChildVO {
	private int childId;
	private String childName;
	private Date childDate;
	private String childSex;
	private int parentId;
	private int classroomId;
	private int kindergartenId;
}
