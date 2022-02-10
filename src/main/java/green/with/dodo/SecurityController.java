package green.with.dodo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;
import vo.MemberVO;
import vo.PageVO;

@Controller
public class SecurityController {
	
	@Autowired
	MemberService service;
	
	@GetMapping("/adminLogin")
	public String adminLogin(String message, Model model) {
		if(message != null) {
			model.addAttribute("error", "관리자 로그인 에러 : 계정확인");
		}
		if(message != null) {
			model.addAttribute("logout", "로그아웃되지 않은 상태입니다");
		}
		return "admin/adminLogin";
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
	
	@RequestMapping(value="/adminLogout")
	public String aLogout() {
		System.out.println("관리자 로그아웃");
		return "redirect:/";
	}

}
