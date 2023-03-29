package com.project.myapp.myb.parent;

import lombok.Data;

@Data
public class ParentVO {
	private int parentId;
	private String parentName;
	private String parentEmail;
	private String parentPw;
	private String parentPhone;
	private String parentRelation;
	private String parentCity;
	private String parentGu;
	
	// (0329 합침 일형추가)
	private int requestId;
}
