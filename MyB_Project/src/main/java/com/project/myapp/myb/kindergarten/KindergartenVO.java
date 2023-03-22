package com.project.myapp.myb.kindergarten;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class KindergartenVO {
	private int kindergartenId;
	private String kindergartenName;
	private String kindergartenPhone;
	private String kindergartenAddress;
	private String kindergartenCity;
	private String kindergartenGu;
	private String kindergartenStat;
	private int adminId;
	
	private MultipartFile file;
	
	private int fileId;
	private String fileName;
	private long fileSize;
	private String fileType;
	
}
