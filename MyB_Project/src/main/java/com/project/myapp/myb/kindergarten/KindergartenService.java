package com.project.myapp.myb.kindergarten;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.myapp.myb.uploadfile.UploadFileVO;

@Service
public class KindergartenService implements IKindergartenService {

	@Autowired
	@Qualifier("IKindergartenRepository")
	IKindergartenRepository kindergartenRepository;
	
	@Override
	public KindergartenVO selectKindergarten(int adminId) {
		return kindergartenRepository.selectKindergarten(adminId);
	}
	
	@Transactional
	public void insertKindergarten(KindergartenVO kindergartenVO) {
		kindergartenRepository.insertKindergarten(kindergartenVO);
	}

	@Transactional
	public void insertKindergarten(KindergartenVO kindergartenVO, UploadFileVO file) {
		kindergartenRepository.insertKindergarten(kindergartenVO);
		if(file != null && file.getFileName() != null && !file.getFileName().equals("")) {
        	file.setAdminId(kindergartenVO.getAdminId());
        	kindergartenRepository.insertFileData(file);
        }
	}

	@Override
	public List<KindergartenVO> selectKindergartenList(int page) {
		int start = (page-1)*10-1;
		return kindergartenRepository.selectKindergartenList(start, start+9);
	}

	@Override
	public KindergartenVO selectKindergartenInfo(int kindergartenId) {
		return kindergartenRepository.selectKindergartenInfo(kindergartenId);
	}

	@Override
	public UploadFileVO getFile(int fileId) {
		return kindergartenRepository.getFile(fileId);
	}

	@Override
	public void updateKindergartenApprove(int kindergartenId) {
		kindergartenRepository.updateKindergartenApprove(kindergartenId);
	}

	@Transactional
	public void deleteKindergartenDisapprove(int kindergartenId) {
		kindergartenRepository.deleteFileData(kindergartenId);
		kindergartenRepository.deleteKindergartenDisapprove(kindergartenId);
	}

	@Override
	public int selectTotalKindergartenCount() {
		return kindergartenRepository.selectTotalKindergartenCount();
	}


}
