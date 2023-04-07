package com.project.myapp.myb.classroom;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * 반과 관련된 기능을 담는 서비스클래스입니다.
 * 
 * @author 문수지,손일형,김대영
 * @since 2023.04.04
 *
 */
@Service
public class ClassroomService implements IClassroomService {

	@Autowired
	@Qualifier("IClassroomRepository")
	IClassroomRepository classroomRepository;
	
	@Override
	public List<ClassroomVO> selectClassroomList(int kindergartenId) {
		return classroomRepository.selectClassroomList(kindergartenId);
	}

	@Override
	public ClassroomVO selectClassroom(int classroomId) {
		return classroomRepository.selectClassroom(classroomId);
	}

	@Override
	public ClassroomVO getTeacherClass(int teacherId) {
		return classroomRepository.getTeacherClass(teacherId);
	}

	@Override
	public ClassroomVO getClassName(String classroomName) {
		return classroomRepository.getClassName(classroomName);
	}
	
	/* -----------------------------웹 기능 : 김대영----------------------------- */
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
