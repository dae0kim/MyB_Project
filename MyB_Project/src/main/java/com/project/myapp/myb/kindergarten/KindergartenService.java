package com.project.myapp.myb.kindergarten;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.myapp.myb.uploadfile.UploadFileVO;

/**
 * 어린이집과 관련된 기능을 담는 서비스클래스입니다.
 * 
 * @author 문수지,손일형,김대영
 * @since 2023.04.04
 *
 */
@Service
public class KindergartenService implements IKindergartenService {

	@Autowired
	@Qualifier("IKindergartenRepository")
	IKindergartenRepository kindergartenRepository;
	
	@Override
	public List<KindergartenVO> searchListByNameKeyword(String kindergartenNameKeyword, String kindergartenCity,
			String kindergartenGu) {
		return kindergartenRepository.searchListByNameKeyword("%"+kindergartenNameKeyword+"%", kindergartenCity, kindergartenGu);
	}

	@Override
	public KindergartenVO selectKindergartenById(int kindergartenId) {
		return kindergartenRepository.selectKindergartenById(kindergartenId);
	}

	@Override
	public KindergartenVO getKindergartenName(String kindergartenName) {
		return kindergartenRepository.getKindergartenName(kindergartenName);
	}
	
	/* -----------------------------웹 기능 : 김대영----------------------------- */
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
	public List<KindergartenVO> selectKindergartenList() {
		return kindergartenRepository.selectKindergartenList();
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
	public List<Map<String, Object>> countAbsentList(int kindergartenId) {
		return kindergartenRepository.countAbsentList(kindergartenId);
	}

	@Override
	public List<Map<String, Object>> countStudentList(int kindergartenId) {
		return kindergartenRepository.countStudentList(kindergartenId);
	}

	@Override
	public List<Map<String, Object>> countAttendanceList(int kindergartenId) {
		return kindergartenRepository.countAttendanceList(kindergartenId);
	}

	@Override
	public List<Map<String, Object>> countClassroomDiseaseList(int classroomId) {
		return kindergartenRepository.countClassroomDiseaseList(classroomId);
	}


}
