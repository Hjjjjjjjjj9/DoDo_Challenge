package green.with.dodo;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.MemberService;
import vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	
	@RequestMapping(value = "/loginform")
	public ModelAndView loginf(ModelAndView mv) {
		mv.setViewName("member/loginForm");
		return mv;
	}
		
	// 로그인
	@RequestMapping(value = "/mLogin")
	public ModelAndView login(HttpServletRequest request, ModelAndView mv, MemberVO vo)
			throws ServletException, IOException {
		
		String id = vo.getId();
		String password = vo.getPassword();
		String uri = "member/loginForm";
		
		vo.setId(id);
		vo = service.selectOne(vo);
		if ( vo != null ) { // id확인
			if ( vo.getPassword().equals(password) ) { //password확인
				// Login 성공
				request.getSession().setAttribute("loginID", id);
				request.getSession().setAttribute("loginName", vo.getName());
				request.getSession().setAttribute("loginPW", password);
				request.getSession().setAttribute("loginPoint", vo.getPoint());
				uri="redirect:/";
			}else {
				// Password 오류
				mv.addObject("message", "비밀번호가 일치하지 않습니다.");
			}
		}else {	// ID 오류
			mv.addObject("message", "존재하지 않는 ID입니다.");
		}
		mv.setViewName(uri);
		return mv;
	} //login
	
	
	// 로그아웃
	@RequestMapping(value = "/mlogout")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mv, RedirectAttributes rttr) 
			throws ServletException, IOException{
		
		HttpSession session = request.getSession(false); // session이 없으면 null 리턴
		
		if (session != null) {
			session.invalidate();
		}
		rttr.addFlashAttribute("message", "로그아웃 완료");
		mv.setViewName("redirect:/");		
		
		return mv;
	} // logout
	
	
	
	//회원가입
	@RequestMapping(value = "/joinf")
	public ModelAndView joinf(ModelAndView mv) {
		mv.setViewName("member/joinForm");
		return mv;
	}
	
    @RequestMapping(value = "/join")
    public ModelAndView join(HttpServletRequest request, ModelAndView mv, MemberVO vo) 
    				 	throws IOException {
    	
    	String uri = "member/loginForm";  // 성공시 로그인폼으로
    	
    	int cnt = service.insert(vo) ;
    	if ( cnt > 0 ) {
    		 mv.addObject("message", "가입 완료되었습니다. 로그인 후 이용하세요.");
    	 }else { 
    		 mv.addObject("message", "가입에 실패하였습니다. 관리자에게 문의하세요.");
    		 uri="member/joinForm";
    	 }
    	mv.setViewName(uri);
    	return mv;
    } //join
        
    // 회원탈퇴
    @RequestMapping(value = "/mdelete")
    public ModelAndView mdelete(HttpServletRequest request, 
    		ModelAndView mv, MemberVO vo, RedirectAttributes rttr) {
    	
    	String uri = "home";
    	String id = null;
    	
    	HttpSession session = request.getSession(false);
    	
    	if (session != null && session.getAttribute("loginID")!=null ) {
    		id = (String)session.getAttribute("loginID");
    		if (!id.equals("admin")) {
    			vo.setId(id); //관리자 아닐 경우 setId
    		}
    		
    		if (service.delete(vo)>0) {
    			if (!id.equals("admin")) { 
    				session.invalidate();
    				mv.addObject("message", "탈퇴 성공");
    				uri="home";
    			}else {
    				// 관리자일 경우 home 안 가고 페이지 그대로?
    				// uri = "redirect:mlist";
    				rttr.addFlashAttribute("message", "회원 삭제 성공");
    			}
    		}else { //삭제오류
    			//uri = "redirect:mdetial";
    			rttr.addFlashAttribute("탈퇴 오류");
    		}
    	}else {
    		uri="member/loginForm";
    		mv.addObject("message", "로그인 정보 없음 : 로그인 후 탈퇴 가능");
    	}
    	mv.setViewName(uri);
    	return mv;
    } //mdelete
    
    
    @RequestMapping(value="/mUpdatef")
    public ModelAndView mUpdate(HttpServletRequest request, ModelAndView mv, MemberVO vo) 
    		throws ServletException, IOException{
    	HttpSession session = request.getSession(false);
    	
    	if(vo.getId() == null || vo.getId().length() < 1 ) {
    		if (session != null && session.getAttribute("loginID") != null) {
    			vo.setId((String)session.getAttribute("loginID"));
    		}
    	}
    	
    	String uri = "myPage/myPageUpdate";
    	vo = service.selectOne(vo);
    	
    	if (vo != null) {
    	    mv.addObject("loginUser", vo);
    	} else {
    		mv.addObject("message", request.getParameter("id") + "님의 자료는 존재하지 않습니다.");
    	}
    	mv.setViewName(uri);
    	return mv;
    }
    
    
    @RequestMapping(value="/mUpdate")
    public ModelAndView mupdate(HttpServletRequest request, ModelAndView mv, MemberVO vo, RedirectAttributes rttr) 
    		throws IOException {
    	String uri = null;
    	if ( service.update(vo) > 0 ) {
    		rttr.addFlashAttribute("message", "회원정보 수정 완료");
    		request.getSession().setAttribute("loginName",  vo.getName());
    	} else { // 실패시
    		rttr.addFlashAttribute("message", "회원정보 수정 실패");
    	}
		uri = "redirect:mUpdatef";
    	mv.setViewName(uri);
    	return mv;    	
    }
    
    
    
    @RequestMapping(value="/idcheck")
    public ModelAndView idcheck(ModelAndView mv, MemberVO vo) {
    	mv.addObject("newID", vo.getId());
    	if (service.selectOne(vo) != null) {
    		mv.addObject("canUseId", "F"); //사용불가
    		System.out.println("아이디중복됨 - 사용불가");
    	} else {
    		mv.addObject("canUseId", "T"); //사용가능
    		System.out.println("아이디중복아님 - 사용가능");
    	}
    	mv.setViewName("member/idDupCheck");
    	return mv;
    }
    
	
} //MemberController
	