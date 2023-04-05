package com.project.myapp.myb.kindergarten;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

/**
 * 어린이집 정보를 담는 클래스입니다.
 * 
 * @author 문수지,손일형,김대영
 * @since 2023.04.04
 * 
 */
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
