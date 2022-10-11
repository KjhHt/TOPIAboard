package com.topia.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.topia.board.service.boardServiceImpl;
import com.topia.board.vo.Board;
import com.topia.board.vo.memo_board;
import com.topia.board.vo.memo_boardsch;
import com.topia.board.vo.memo_member;
import com.topia.board.vo.memo_membersch;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	boardServiceImpl service;
	
	@RequestMapping(value = "/")
	public String home( Model model) {
		model.addAttribute("blist",service.getboardlist());
		return "boardlist";
	}
	
	@RequestMapping(value = "/ins")
	public String boardins(Model model,Board board) {
		service.insertboard(board);
		model.addAttribute("isInsert","Y");
		return "boardIns";
	}
	@RequestMapping(value = "/insform")
	public String boardinsform() {
		return "boardIns";
	}
	
	@RequestMapping(value = "/detail")
	public String boarddetail(@RequestParam("no") int no, Model model) {
		model.addAttribute("board",service.getboarddetail(no));
		return "boardDetail";
	}
	@RequestMapping(value = "/update")
	public String boardupdate(Model model,Board upt) {
		model.addAttribute("proc", "upt");
		model.addAttribute("board",service.updateboard(upt));
		return "redirect:/detail?no="+upt.getNo();
	}
	@RequestMapping(value = "/delete")
	public String boarddelete(@RequestParam("no") int no, Model model) {
		service.deleteboard(no);
		model.addAttribute("proc", "del");
		return "boardDetail";
	}
	//------------------------------------------------------------
	// 메모 로그인
	@RequestMapping(value = "/memo_login")
	public String memo_login(@ModelAttribute memo_member m, Model model,
							HttpServletRequest request) {
		if (m.getUser_id() != null && m.getUser_password() != null) {
			memo_member mem = service.memberlogin(m);
			HttpSession session = request.getSession();
			if (mem != null && mem.getUser_status().equals("ADMIN") ) {
				session.setAttribute("mem", mem);
				return "redirect:memo_board";
			} else if (mem != null && mem.getUser_status().equals("USER")) {
				session.setAttribute("mem", mem);
				return "redirect:memo_board";
			} else if (mem != null && mem.getUser_status().equals("MASTER")) {
				session.setAttribute("mem", mem);
				return "redirect:memo_board";
			} else {
				return "redirect:memo_login";
			}
		}
		return "memo//memo_login";
	}
	// 로그인 체크
	
	@ResponseBody
	@RequestMapping(value = "/loginCheck")
	public String loginCheck(@ModelAttribute memo_member member) throws Exception {
		memo_member login = service.memberlogin(member);
		String result = "";
		if(login != null) {
			result = "pass";
		}else {
			result = "fail";
		}
		return result;
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout")
	public String logout(memo_member m, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("mem");
		return "redirect:memo_board";
	}	
	// 메모 회원가입
	@RequestMapping(value = "/jmember")
	public String joinmember(Model model,memo_member member) {
		service.memberjoin(member);
		model.addAttribute("isInsert","Y");
		return "memo//memo_joinmember";
	}
	@RequestMapping(value = "/jmemberform")
	public String joinmemberform() {
		return "memo//memo_joinmember";
	}
	// 메모 게시판
	@RequestMapping(value = "/memo_board")
	public String memo_board( Model model,HttpServletRequest request,
								memo_boardsch sch) {
		//memo_member curMem = (memo_member)request.getSession().getAttribute("mem");
		
		model.addAttribute("req", sch);
		model.addAttribute("mlist",service.getmemoboardlist(sch));
		return "memo//memo_board";
	}
	// 메모게시판 등록 
	@RequestMapping(value = "/memo_boardinsert")
	public String memo_board_insert(memo_board ins,Model model,HttpServletRequest request) {
		
		service.insertmemoboard(ins, request);
		model.addAttribute("isInsert","Y");
		return "memo//memo_board_insert";
	}
	@RequestMapping(value = "/memo_boardinsertForm")
	public String memo_board_insertForm() {
		return "memo//memo_board_insert";
	}
	// 메모게시판 상세
	@RequestMapping(value = "/memo_boarddetail")
	public String detailmemoboard(@RequestParam("no") int no,Model model) {
		model.addAttribute("memoboard",service.detailmemoboard(no));
		return "memo//memo_board_detail";
	}
	// 메모게시판 수정페이지
	@RequestMapping(value = "/memo_boardUpdate")
	public String updatememoboard(@RequestParam("no") int no, Model model) {
		model.addAttribute("memoboard",service.updatememoboard(no));
		return "memo//memo_board_update";
	}
	// 메모게시판 수정페이지처리	
	@RequestMapping(value = "/memoboardupdate")
	public String updatememoboardupt(Model model,memo_board upt,HttpServletRequest request) {
		model.addAttribute("memoboard",service.updatememoboardupt(upt,request));
		model.addAttribute("isUpdate","Y");
		return "redirect:/memo_boardUpdate?no="+upt.getNo();
	}
	// 메모게시판 수정페이지삭제처리
	@RequestMapping(value = "/memoboarddelete")
	public String updatememoboardupt(@RequestParam("no") int no, Model model) {
			service.deletememoboard(no);
			model.addAttribute("proc", "del");
		return "memo//memo_board_detail";
	}
	// 메모게시판 선택삭제
	@RequestMapping(value = "/checkdelete")
	public String ajaxTest(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			service.checkdelete(ajaxMsg[i]);
		}
		return "redirect:memo_board";
	}
	// 메모게시판 회원정보 수정
	@RequestMapping(value = "/memberupdate")
	public String memberupdate(Model model,memo_member upt,HttpSession session) {
		Integer upt2 = service.updatemember(upt);
		session.removeAttribute("mem");
		session.setAttribute("mem", upt);
		model.addAttribute("isUpdate","Y");
		return "memo/memo_memberupdate";
	}
	@RequestMapping(value = "/memberupdateform")
	public String memberupdate() {
		return "memo/memo_memberupdate";
	}
	// 메모 회원정보리스트
	@RequestMapping(value = "/memberlist")
	public String memberlist( Model model,HttpServletRequest request,
								memo_membersch sch) {
		//memo_member curMem = (memo_member)request.getSession().getAttribute("mem");
		model.addAttribute("req", sch);
		model.addAttribute("mlist",service.getmemomemberlist(sch));
		return "memo/memo_memberlist";
	}
	// 메모 회원정보리스트 상세페이지
	@RequestMapping(value = "/memberdetail")
	public String memberdetail(@RequestParam("user_no") int user_no,Model model) {
		model.addAttribute("mem",service.detailmemomember(user_no));
		return "memo/memo_memberdetail";
	}
	// 메모 회원정보리스트 상세페이지 삭제버튼
	@RequestMapping(value = "/memberdelete")
	public String memberdelete(@RequestParam("user_no") int user_no, Model model) {
		service.deletememomember(user_no);
		model.addAttribute("proc", "del");
		return "memo/memo_memberdetail";
	}
	// 메모 회원정보리스트 권한설정
	@RequestMapping(value = "/updatememberSts")
	public String updatememberSts(Model model,memo_member upt,HttpSession session) {
		
		Integer upt3 = service.updatememberSts(upt);
		
		model.addAttribute("isUpdate","Y");
		return "memo/memo_memberdetail";
	}
	// 회원리스트게시판 선택삭제
	@RequestMapping(value = "/checkmemberdelete")
	public String ajaxTest2(HttpServletRequest request) {
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			service.ckeckmemberdelete(ajaxMsg[i]);
		}
		return "redirect:memberlist";
	}
}
