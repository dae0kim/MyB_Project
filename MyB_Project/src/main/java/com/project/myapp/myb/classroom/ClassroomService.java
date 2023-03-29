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
