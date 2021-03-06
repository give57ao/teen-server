package com.ez.teen.member.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.teen.chat.model.ChatModel;
import com.ez.teen.member.model.MemberModel;
import com.ez.teen.member.model.MemberParam;

public interface MemberService {
	
	// 마이페이지
	public List<MemberModel> myPageList(MemberModel memberModel) throws Exception;

	// 회원탈퇴
	public void deleteMember(MemberModel memberModel);

	// 회원가입
	public void insertMember(MemberModel memberModel);

	// 아이디중복체크
	public int checkId(String member_id);
	
	// 닉네임 중복체크
	public int checkNick(String member_nick);
	
	// 회원정보 수정
	public void mypageModify(MemberModel memberModel);

	public int passChk(MemberModel memberModel);

	public void temPwUpdate(MemberModel memberModel);

	//프로필 수정
	public void profileModifyMember(MemberModel memberModel, MultipartHttpServletRequest mpRequest) throws Exception;

	//회원 탈퇴 시 채팅 부분 수정
	public void deleteChatMember(ChatModel chatModel);

	public int emailCheck(String member_email);
}