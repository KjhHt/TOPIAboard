package com.topia.board.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.topia.board.vo.Board;
import com.topia.board.vo.memo_board;
import com.topia.board.vo.memo_boardsch;
import com.topia.board.vo.memo_member;
import com.topia.board.vo.memo_membersch;

@Repository
public class boardDAO {
	@Autowired
	private SqlSessionTemplate tpl;
	// 조회
	public List<Board> getboardlist (){
		return tpl.selectList("boardDAO.getboardlist");
	}
	// 등록
	public Integer insertboard(Board board) {
		return tpl.insert("boardDAO.insertboard",board);
	}
	// 상세
	public Board getboarddetail(int no) {
		return tpl.selectOne("boardDAO.getboarddetail", no);
	}
	// 수정
	public Integer updateboard(Board upt) {
		return tpl.update("boardDAO.updateboard",upt);
	}
	// 삭제
	public Integer deleteboard(int no) {
		return tpl.delete("boardDAO.deleteboard",no);
	}
	// ------------------------------------------------------------
	// memo 로그인
	public memo_member memberlogin(memo_member m) {
		return tpl.selectOne("boardDAO.memologin",m);
	}
	// memo 회원가입
	public Integer memberjoin(memo_member member) {
		return tpl.insert("boardDAO.joinmember",member);
	}
	// memo 게시판
	public List<memo_board> getmemoboardlist (memo_boardsch sch){
		return tpl.selectList("boardDAO.getmemoboardlist",sch);
	}	
	// memo 게시판 전체개수
	public Integer memoboardtotcnt(memo_boardsch sch) {
		return tpl.selectOne("boardDAO.memoboardtotcnt",sch);
	}
	// memo 게시판 등록
	public Integer insertmemoboard(memo_board ins, HttpServletRequest request) {
		return tpl.insert("boardDAO.insertmemoboard",ins);
	}
	// memo 게시판 상세
	public memo_board detailmemoboard(int no) {
		return tpl.selectOne("boardDAO.detailmemoboard", no);
	}
	// memo 게시판 수정
	public memo_board updatememoboard(int no) {
		return tpl.selectOne("boardDAO.updatememoboard", no);
	}
	// memo 게시판 수정처리
	public Integer updatememoboardupt(memo_board upt, HttpServletRequest request) {
		return tpl.update("boardDAO.updatememoboardupt",upt);
	}
	// memo 게시판 삭제처리	
	public Integer deletememoboard(int no) {
		return tpl.delete("boardDAO.deletememoboard",no);
	}
	// memo 게시판 선택삭제처리	
	public int checkdelete(String no) {
		return tpl.delete("boardDAO.ckeckdelete",no);
	}
	// memo 회원정보 수정
	public Integer updatemember(memo_member upt) {
		return tpl.update("boardDAO.updatemember", upt);
	}
	// memo 게시판
	public List<memo_member> getmemomemberlist (memo_membersch sch){
		return tpl.selectList("boardDAO.getmemomemberlist",sch);
	}	
	// memo 게시판 상세
	public memo_member detailmemomember(int user_no) {
		return tpl.selectOne("boardDAO.detailmemomember", user_no);
	}	
	// memo 게시판 삭제처리	
	public Integer deletememomember(int user_no) {
		return tpl.delete("boardDAO.deletememomember",user_no);
	}	
	// memo 회원정보 권한수정
	public Integer updatememberSts(memo_member upt) {
		return tpl.update("boardDAO.updatememberSts", upt);
	}
	// memo 회원정보리스트 전체개수
	public Integer getmemomemberlisttotcnt(memo_membersch sch) {
		return tpl.selectOne("boardDAO.getmemomemberlisttotcnt",sch);
	}	
	// memo 게시판 선택삭제처리	
	public int ckeckmemberdelete(String user_no) {
		return tpl.delete("boardDAO.ckeckmemberdelete",user_no);
	}
	// memo 회원가입 아이디중복처리
	public int overlappedID(memo_member ck) {
		return tpl.selectOne("boardDAO.overlappedID",ck);
	}
	// memo 정보수정 비밀번호 중복처리
	public int overlappedPass(memo_member ck) {
		return tpl.selectOne("boardDAO.overlappedPass",ck);
	}	
}