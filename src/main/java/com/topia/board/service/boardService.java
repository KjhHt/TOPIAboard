package com.topia.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.topia.board.vo.Board;
import com.topia.board.vo.memo_board;
import com.topia.board.vo.memo_boardsch;
import com.topia.board.vo.memo_member;
import com.topia.board.vo.memo_membersch;

public interface boardService {
	//리스트
	public List<Board> getboardlist ();
	//등록
	public Integer insertboard(Board board);
	//상세
	public Board getboarddetail(int no);
	//수정
	public int updateboard(Board upt);
	//삭제
	public Integer deleteboard(int no);
	//----------------------------------------------
	// memo 로그인
	public memo_member memberlogin(memo_member m);
	// memo 회원가입
	public Integer memberjoin(memo_member member);
	// memo 게시판
	public List<memo_board> getmemoboardlist(memo_boardsch sch);
	// memo 게시판 등록
	public Integer insertmemoboard(memo_board ins, HttpServletRequest request);
	// memo 게시판 상세
	public memo_board detailmemoboard(int no);
	// memo 게시판 수정
	public memo_board updatememoboard(int no);
	// memo 게시판 수정처리
	public Integer updatememoboardupt(memo_board upt, HttpServletRequest request);
	// memo 게시판 삭제처리	
	public Integer deletememoboard(int no);
	// memo 게시판 선택삭제처리
	public int checkdelete(String no);
	// memo 회원정보수정
	public Integer updatemember(memo_member upt);
	// memo 회원정보리스트
	public List<memo_member> getmemomemberlist(memo_membersch sch);
	// memo 게시판 상세	
	public memo_member detailmemomember(int user_no);
	// memo 게시판 상세	삭제처리
	public Integer deletememomember(int user_no);
	// memo 게시판 회원관리 권한 수정
	public Integer updatememberSts(memo_member upt);
	// memo 회원리스트 선택삭제처리
	public int ckeckmemberdelete(String user_no);
}
