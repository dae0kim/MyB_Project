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
	
	
	// 어린이집 검색 (0323 문수지 작성)
	@Override
	public List<KindergartenVO> searchListByNameKeyword(String kindergartenNameKeyword, String kindergartenCity,
			String kindergartenGu) {
		return kindergartenRepository.searchListByNameKeyword("%"+kindergartenNameKeyword+"%", kindergartenCity, kindergartenGu);
	}

	// 어린이집 정보 불어오기 (0324 문수지 작성)
	@Override
	public KindergartenVO selectKindergartenById(int kindergartenId) {
		return kindergartenRepository.selectKindergartenById(kindergartenId);
	}

	// (0329 합침 일형추가)
	@Override
	public KindergartenVO getKindergartenName(String kindergartenName) {
		// TODO Auto-generated method stub
		return kindergartenRepository.getKindergartenName(kindergartenName);
	}
	
	/* -----------------------------웹 기능----------------------------- */
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
