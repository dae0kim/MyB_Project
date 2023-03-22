package com.project.myapp.myb.kindergarten;

import com.project.myapp.myb.uploadfile.UploadFileVO;

public interface IKindergartenService {

	// 어린이집 등록
	void insertKindergarten(KindergartenVO kindergartenVO);
	void insertFileData(UploadFileVO file);
}
