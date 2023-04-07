package com.project.myapp.myb.parent;

import lombok.Data;

/**
 * 부모 사용자 정보를 담는 클래스입니다.
 * 
 * @author 문수지, 손일형
 * @since 2023.03.22
 *
 */
@Data
public class ParentVO {
	private int parentId;
	private String parentName;
	private String parentEmail;
	private String parentPw;
	private String parentPhone;
	private String parentRelation;
	private String parentGu;
	private String parentCity;
	private int requestId;
}
