package com.project.myapp.myb.kindergarten;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.myapp.myb.uploadfile.UploadFileVO;

@Service
public class KindergartenService implements IKindergartenService {

	@Autowired
	@Qualifier("IKindergartenRepository")
	IKindergartenRepository kindergartenRepository;
	
	@Override
	public void insertKindergarten(KindergartenVO kindergartenVO) {
		kindergartenRepository.insertKindergarten(kindergartenVO);
	}

	@Override
	public void insertFileData(UploadFileVO file) {
		// TODO Auto-generated method stub
		
	}

}
