package com.project.myapp.myb.child;

import java.util.Date;

import lombok.Data;

@Data
public class ChildVO {
	private int childId;
	private String childName;
	private String childDate;
	private String childSex;
	private int parentId;
	private int classroomId;
	private int kindergartenId;
}
