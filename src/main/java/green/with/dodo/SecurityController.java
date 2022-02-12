package green.with.dodo;

import java.util.List;
import java.util.Map;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.ChallengeService;
import service.MemberService;
import service.ReplyService;
import vo.MemberVO;
import vo.PageVO;
import vo.ReplyVO;

@Controller
public class SecurityController {
	
	@Autowired
	MemberService service;
	
	@Autowired
	ReplyService rService;
	
	@Autowired
	ChallengeService cService;
	
	@GetMapping("/adminLogin")
	public String adminLogin(HttpServletRequest request, String message, Model model) {
		/*
		// 기존 member용 아이디 logout
        HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		*/
		
		request.setAttribute("secAdmin", "admin");
		System.out.println("setAttribute: secAdmin, admin 설정"); //관리자 attribute 부여
		
		if(message != null) {
			model.addAttribute("error", "관리자 로그인 에러 : 계정확인");
		}
		if(message != null) {
			model.addAttribute("logout", "로그아웃되지 않은 상태입니다");
		}
		return "admin/adminLogin";
	}
	

	@RequestMapping(value="/adminLogout")
	public String aLogout() {
		System.out.println("관리자 로그아웃");
		return "redirect:/";
	}
	
	@Secured({"ROLE_ADMIN"})
	@GetMapping("/adminList")
	public ModelAndView adminMList(ModelAndView mv, PageVO<MemberVO> pvo) {
		
		int currPage = 1;
		if(pvo.getCurrPage() > 1) {
			currPage = pvo.getCurrPage();
		} else {
			pvo.setCurrPage(currPage);
		}
		int sno = (currPage - 1) * pvo.getRowsPerPage();
		int eno = sno + pvo.getRowsPerPage() - 1;
		pvo.setSno(sno);
		pvo.setEno(eno);
		pvo = service.pageList(pvo);
		int totalPageNo = pvo.getTotalRowCount()/pvo.getRowsPerPage();
		if (pvo.getTotalRowCount()%pvo.getRowsPerPage() != 0) {
			totalPageNo += 1;
		}
		int sPageNo = ((currPage - 1) / pvo.getPageNoCount()) * pvo.getPageNoCount() + 1;
		int ePageNo = sPageNo + pvo.getPageNoCount() - 1;
		if(ePageNo > totalPageNo) {
			ePageNo = totalPageNo;
		}
		mv.addObject("sPageNo", sPageNo);
		mv.addObject("ePageNo", ePageNo);
		mv.addObject("pageNoCount", pvo.getPageNoCount());
		
		mv.addObject("currPage", currPage);
		mv.addObject("totalPageNo", totalPageNo);
		mv.addObject("memList", pvo.getList());
				
		mv.setViewName("admin/memberList");
		return mv;
	}
	
	@Secured({"ROLE_ADMIN"})
	@GetMapping("/mdetail")
	public ModelAndView memberDetail(HttpServletRequest request, ModelAndView mv, MemberVO vo) throws ServletException, IOException{
	
		String id = vo.getId();
		vo.setId(id);
		vo = service.selectOne(vo);
		mv.addObject("selectedMember", vo);
		mv.setViewName("admin/memberDetail");
		
		List<ReplyVO> rvo = rService.reportedList(vo.getNick());
		
		mv.addObject("reportedReplies", rvo);
		
		return mv;
	}
	
    @RequestMapping(value = "/adminMdelete")
    public ModelAndView adminMdelete(HttpServletRequest request, 
    		ModelAndView mv, MemberVO vo, RedirectAttributes rttr, PageVO<MemberVO> pvo) {
    	
    	String id = vo.getId();
    	String loginid = null;
    	
    	vo.setId(id);
    	
    	HttpSession session = request.getSession(false);

    	if (session != null && session.getAttribute("loginID")!=null ) {
    		loginid = (String)session.getAttribute("loginID");
    		if(!id.equals(loginid)) {
    			if(service.delete(vo)>0) {
    				System.out.println("탈퇴성공: " + id);
    				mv.addObject("message", "회원이 탈퇴처리되었습니다.");
    				mv = adminMList(mv, pvo);
    			} else {
    				System.out.println("service.delete실패");
    				mv.addObject("탈퇴 오류");
    			}
    		} else {
    			System.out.println("아이디 똑같아서 탈퇴불가");
				mv.addObject("message", "현재 로그인 중인 계정은 탈퇴처리할 수 없습니다. 회원 계정을 로그아웃하세요.");
    		    try {
					mv = memberDetail(request, mv, vo);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
    		}
    		
    	}
    	
    	//mv.setViewName("admin/memberList");
    	return mv;
    } //mdelete
	
	

} // class
