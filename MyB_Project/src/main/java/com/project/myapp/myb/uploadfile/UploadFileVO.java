package com.project.myapp.myb.uploadfile;

import lombok.Data;

/**
 * 파일 정보를 담는 클래스입니다.
 * 
 * @author 김대영
 * @since 2023.04.04
 * 
 */
@Data
public class UploadFileVO {
	private int fileId;
	private String fileName;
	private long fileSize;
	private String fileType;
	private byte[] fileData;
	private int adminId;
}