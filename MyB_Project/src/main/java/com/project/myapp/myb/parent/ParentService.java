package com.project.myapp.myb.parent;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
/***
 * 
 * @author 문수지
 * @since 2023-03-22
 * 부모 계정 회원가입/로그인 하기 위한 서비스 클래스입니다.
 *
 */
@Service
public class ParentService implements IParentService {

	@Autowired
	@Qualifier("IParentRepository")
	IParentRepository parentRepository;

	/***
	 * @author 문수지
	 * 부모(사용자) 계정을 추가하는 메서드입니다.
	 * @param parent : 부모 정보를 저장한 ParentVO 객체여야 합니다.
	 */
	@Override
	public void insertParent(ParentVO parent) {
		parentRepository.insertParent(parent);
	}

	/***
	 * @author 문수지
	 * @param parentEmail : 사용자 계정의 아이디가 될 이메일
	 * @return 부모(사용자)테이블에서 입력한 사용자 이메일과 일치하는 정보를 ParentVO에 저장해 반환합니다.
	 */
	@Override
	public ParentVO selectParent(String parentEmail) {
		return parentRepository.selectParent(parentEmail);
	}

	/***
	 * @author 문수지
	 * @param parentEmail : 사용자 계정의 아이디가 될 이메일
	 * @return 부모(사용자)테이블에서 입력한 사용자 이메일과 일치하는 개수를 int 타입으로 반환합니다.
	 */
	@Override
	public int emailChk(String parentEmail) throws Exception {
		return parentRepository.emailChk(parentEmail);
	}

	/***
	 * @author 문수지
	 * @param parentPhone : 사용자 전화번호
	 * @return 부모(사용자)테이블에서 입력한 사용자 전화번호와 일치하는 개수를 int 타입으로 반환합니다.
	 */
	@Override
	public int phoneChk(String parentPhone) throws Exception {
		return parentRepository.phoneChk(parentPhone);
	}
	
	/***
	 * @author 문수지
	 * @param parentEmail : 사용자 계정의 아이디가 될 이메일
	 * @param parentPw : 사용자 계정의 비밀번호
	 * @return : 부모(사용자)테이블에서 입력한 이메일과 비밀번호 둘 다 일치하는 개수를 int 타입으로 반환합니다.
	 */
	@Override
	public int pwChk(String parentEmail, String parentPw) throws Exception {
		return parentRepository.pwChk(parentEmail, parentPw);
	}

	@Override
	public void updateParent(ParentVO parent) {
		parentRepository.updateParent(parent);
	}

	// 일형추가 : 부모이름 불러오기 (0329 합침 일형추가)
	@Override
	public List<ParentVO> getParentName(int teacherId) {
		// TODO Auto-generated method stub
		return parentRepository.getParentName(teacherId);
	}
	
}
