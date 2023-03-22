package com.project.myapp.myb.uploadfile;

import lombok.Data;

@Data
public class UploadFileVO {
	private int fileId;
	private String fileName;
	private long fileSize;
	private String fileType;
	private byte[] fileData;
	private int kindergartenId;
}