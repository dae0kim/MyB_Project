package com.project.myapp.myb.classroom;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class ClassroomService implements IClassroomService {

	@Autowired
	@Qualifier("IClassroomRepository")
	IClassroomRepository classroomRepository;
	

	// 해당하는 어린이집의 반들 출력(0323 문수지 작성)
	@Override
	public List<ClassroomVO> selectClassroomList(int kindergartenId) {
		return classroomRepository.selectClassroomList(kindergartenId);
	}

	// 어린이집 정보 불러오기(0327 문수지 작성)
	@Override
	public ClassroomVO selectClassroom(int classroomId) {
		return classroomRepository.selectClassroom(classroomId);
	}

	// (0329 합침 일형추가)
	@Override
	public ClassroomVO getTeacherClass(int teacherId) {
		return classroomRepository.getTeacherClass(teacherId);
	}

	// (0329 합침 일형추가)
	@Override
	public ClassroomVO getClassroomId(int teacherId) {
		return classroomRepository.getClassroomId(teacherId);
	}

	// (0329 합침 일형추가)
	@Override
	public ClassroomVO getClassName(String classroomName) {
		return classroomRepository.getClassName(classroomName);
	}
	
	
	/* -----------------------------웹 기능----------------------------- */
	@Override
	public void insertClassroom(ClassroomVO classroom) {
		classroomRepository.insertClassroom(classroom);
	}

	@Override
	public void updateClassroom(ClassroomVO classroom) {
		classroomRepository.updateClassroom(classroom);
	}

	@Override
	public List<ClassroomVO> getClassroomNameList(int adminId) {
		return classroomRepository.getClassroomNameList(adminId);
	}

	@Override
	public ClassroomListVO getClassroomInfo(int classroomId) {
		return classroomRepository.getClassroomInfo(classroomId);
	}

	@Override
	public String getClassroomName(int classroomId) {
		return classroomRepository.getClassroomName(classroomId);
	}

	@Override
	public int getClassroomSeq(ClassroomSeqVO classroomSeqVO) {
		return classroomRepository.getClassroomSeq(classroomSeqVO);
	}

	@Override
	public int getClassroomCount(int kindergartenId) {
		return classroomRepository.getClassroomCount(kindergartenId);
	}

	


}
