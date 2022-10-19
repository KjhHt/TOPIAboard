package com.topia.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.topia.board.dao.boardDAO;
import com.topia.board.vo.Board;
import com.topia.board.vo.memo_board;
import com.topia.board.vo.memo_boardsch;
import com.topia.board.vo.memo_member;
import com.topia.board.vo.memo_membersch;

import util.GetIp;

@Service
public class boardServiceImpl implements boardService {
	
	@Autowired
	private boardDAO dao;
	//리스트
	@Override	
	public List<Board> getboardlist (){
		return dao.getboardlist();
	}
	//등록
	@Override
	public Integer insertboard(Board board) {
		return dao.insertboard(board);
	}
	//상세
	@Override
	public Board getboarddetail(int no) {
		return dao.getboarddetail(no);
	}
	//수정
	@Override
	public int updateboard(Board upt) {
		return dao.updateboard(upt);
	}
	//삭제
	@Override
	public Integer deleteboard(int no) {
		return dao.deleteboard(no);
	}
	//-------------------------------------------------
	// memo 로그인
	@Override
	public memo_member memberlogin(memo_member m) {
		return dao.memberlogin(m);
	}
	
	// memo 회원가입
	@Override
	public Integer memberjoin(memo_member member) {
		return dao.memberjoin(member);
	}
	// memo 리스트
	@Override
	public List<memo_board> getmemoboardlist(memo_boardsch sch){
		System.out.println("test:"+sch.getEnd());
		// 1. 전체개수 설정
		sch.setCount(	dao.memoboardtotcnt(sch) );
        // 2. 선언한 한번에 보여줄 데이터 건수(요청값)
		if(sch.getPageSize()==0) {
			sch.setPageSize(10);
		}
        sch.setPageCount( (int)Math.ceil( sch.getCount() /(double)sch.getPageSize()) );
        
        
        // 4. 클릭한 현재 페이지 번호..(요청값)
        if(sch.getCurPage()==0) {
            sch.setCurPage(1);
        }
        if(sch.getCurPage() > sch.getPageCount()){
            sch.setCurPage(sch.getPageCount());
        }
        // 5. 마지막번호(현재페이지*한번에보여주는페이지건수)
        int end = sch.getCurPage()*sch.getPageSize();
        if(end>sch.getCount()) { // 총데이터 건수보다 크면..
            sch.setEnd(sch.getCount());
        }else {
            sch.setEnd(end);
        }
        if(end == 0) {
            sch.setStart(0);
        } else {
            sch.setStart((sch.getCurPage() - 1) * sch.getPageSize() + 1);
        }
        // 1. 블럭의 크기 지정.
        sch.setBlockSize(5);
        // 2. 블럭의 번호 지정..
        int blocknum = (int)(Math.ceil(sch.getCurPage()/(double)sch.getBlockSize()));

        int endBlock = blocknum*sch.getBlockSize();
        if(endBlock>sch.getPageCount()) {
            endBlock = sch.getPageCount();
        }
        if(endBlock == 0) {
            sch.setEndBlock(1);
            sch.setStartBlock(1);
        } else {
            sch.setEndBlock(endBlock);
            sch.setStartBlock((blocknum - 1) * sch.getBlockSize() + 1);
        }
		return dao.getmemoboardlist(sch);
	}
	// memo 게시판 등록
	@Override
	public Integer insertmemoboard(memo_board ins, HttpServletRequest request) {
		String ip = GetIp.getRemoteIP(request);
		ins.setRegist_ip(ip);
		return dao.insertmemoboard(ins, request);
	}
	//  memo 게시판 상세
	@Override
	public memo_board detailmemoboard(int no) {
		return dao.detailmemoboard(no);
	}
	//  memo 게시판 수정
	@Override
	public memo_board updatememoboard(int no) {
		return dao.updatememoboard(no);
	}
	//  memo 게시판 수정
	@Override
	public Integer updatememoboardupt(memo_board upt, HttpServletRequest request) {
		String ip = GetIp.getRemoteIP(request);
		upt.setUpdate_ip(ip);	
		return dao.updatememoboardupt(upt, request);
	}
	//  memo 게시판 삭제
	@Override	
	public Integer deletememoboard(int no) {
		return dao.deletememoboard(no);
	}
	//  memo 게시판 선택삭제
	@Override
	public int checkdelete(String no) {
		return dao.checkdelete(no);
	}
	// memo 회원정보
	@Override
	public Integer updatemember(memo_member upt) {
		return dao.updatemember(upt);
	}
	// memo 회원정보리스트
	@Override
	public List<memo_member> getmemomemberlist(memo_membersch sch){
		// 1. 전체개수 설정
		sch.setCount(	dao.getmemomemberlisttotcnt(sch) );
        // 2. 선언한 한번에 보여줄 데이터 건수(요청값)
		if(sch.getPageSize()==0) {
			sch.setPageSize(10);
		}
        sch.setPageCount( (int)Math.ceil( sch.getCount() /(double)sch.getPageSize()) );
        
        
        // 4. 클릭한 현재 페이지 번호..(요청값)
        if(sch.getCurPage()==0) {
            sch.setCurPage(1);
        }
        if(sch.getCurPage() > sch.getPageCount()){
            sch.setCurPage(sch.getPageCount());
        }
        // 5. 마지막번호(현재페이지*한번에보여주는페이지건수)
        int end = sch.getCurPage()*sch.getPageSize();
        if(end>sch.getCount()) { // 총데이터 건수보다 크면..
            sch.setEnd(sch.getCount());
        }else {
            sch.setEnd(end);
        }
        if(end == 0) {
            sch.setStart(0);
        } else {
            sch.setStart((sch.getCurPage() - 1) * sch.getPageSize() + 1);
        }
        // 1. 블럭의 크기 지정.
        sch.setBlockSize(5);
        // 2. 블럭의 번호 지정..
        int blocknum = (int)(Math.ceil(sch.getCurPage()/(double)sch.getBlockSize()));

        int endBlock = blocknum*sch.getBlockSize();
        if(endBlock>sch.getPageCount()) {
            endBlock = sch.getPageCount();
        }
        if(endBlock == 0) {
            sch.setEndBlock(1);
            sch.setStartBlock(1);
        } else {
            sch.setEndBlock(endBlock);
            sch.setStartBlock((blocknum - 1) * sch.getBlockSize() + 1);
        }
		return dao.getmemomemberlist(sch);
	}
	// 회원정보 상세
	@Override
	public memo_member detailmemomember(int user_no) {
		return dao.detailmemomember(user_no);
	}
	// 회원정보 상세 삭제처리
	@Override
	public Integer deletememomember(int user_no) {
		return dao.deletememomember(user_no);
	}
	// 회원리스트 권한 수정
	@Override
	public Integer updatememberSts(memo_member upt) {
		return dao.updatememberSts(upt);
	}
	// 회원관리 선택삭제
	@Override
	public int ckeckmemberdelete(String user_no) {
		return dao.ckeckmemberdelete(user_no);
	}
	// 아이디 중복처리
	@Override
	public int overlappedID(memo_member ck) {
		return dao.overlappedID(ck);
	}

	// 비밀번호 중복처리
	@Override
	public int overlappedPass(memo_member ck) {
		return dao.overlappedPass(ck);
	}	
}
