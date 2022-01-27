package green.with.dodo;

import java.io.IOException;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.MemberService;
import vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service ;
	
	@RequestMapping(value = "/loginf")
	public ModelAndView loginf(ModelAndView mv) {
		mv.setViewName("member/loginForm");
		return mv;
	}
	
	@RequestMapping(value = "/login")
	public ModelAndView login(HttpServletRequest request, ModelAndView mv, MemberVO vo)
			throws ServletException, IOException {
		String id = vo.getId();
		String password = vo.getPassword();
		String uri = "member/loginForm";
		
		vo = service.selectOne(vo);
		if ( vo != null ) { 
			if ( vo.getPassword().equals(password) ) {
				request.getSession().setAttribute("loginID", id);
				request.getSession().setAttribute("nickName", vo.getNick());
				request.getSession().setAttribute("loginName", vo.getName());
				request.getSession().setAttribute("loginPW", password);
				uri="redirect:home" ;
			}else if( vo.getTmpPassword().equals(password) ) {
				request.getSession().setAttribute("loginID", id);
				request.getSession().setAttribute("nickName", vo.getNick());
				request.getSession().setAttribute("loginName", vo.getName());
				request.getSession().setAttribute("loginPW", password);
				uri="redirect:pwUpdatef" ;
			} else {
				mv.addObject("message", "※ Password 오류 ※");
			}
		}else {
			mv.addObject("message", "※ ID 오류 ※");
		} 
		mv.setViewName(uri);
		return mv;
	}
	
	@RequestMapping(value = "/pwUpdatef")
	public ModelAndView pwUpdatef(ModelAndView mv) {
		mv.setViewName("member/pwUpdateForm");
		return mv;
	}
	
	@RequestMapping(value = "/pwUpdate")
	public ModelAndView pwUpdate(HttpSession session, HttpServletRequest request, ModelAndView mv, MemberVO vo, RedirectAttributes rttr)
			throws IOException {
		String uri = "redirect:loginf";
		
		if ( service.pwUpdate(vo) > 0 ) { 
			service.tmpDelete(vo);
			session.invalidate();
			rttr.addFlashAttribute("message", "※ 비밀번호 수정 완료, 다시 로그인해주세요 ※");
			mv.addObject("message", "※ 비밀번호 수정 완료, 다시 로그인해주세요 ※");
		} else {
			mv.addObject("message", "※ 비밀번호 수정 실패, 다시 시도해주세요 ※");
			uri = "member/pwUpdateForm";
		}
		mv.setViewName(uri);
		return mv;
	}
	
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mv, RedirectAttributes rttr)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
    	if (session!=null) session.invalidate();
    	// mv.addObject("message", "~~ 로그아웃 되었습니다 ~~");  -> forward
    	rttr.addFlashAttribute("message", "※ 로그아웃 되었습니다 ※"); // redirect
    	
    	//mv.setViewName("home");  // home.jsp 로 forward
    	mv.setViewName("redirect:home");  // home 요청을  redirect
		return mv;
	}
	
	@RequestMapping(value = "/joinf")
	public ModelAndView joinf(ModelAndView mv) {
		mv.setViewName("member/joinForm");
		return mv;
	}
	
	@RequestMapping(value = "/join")
	public ModelAndView join(ModelAndView mv, MemberVO vo) 
					 	throws IOException {
		String uri = "member/loginForm"; 
		service.insert(vo);
		int cnt = service.insert(vo);
		if ( cnt > 0 ) {
			 mv.addObject("message", "※ 회원가입 완료 ※");
		 }else { 
			 mv.addObject("message", "※ 회원가입 실패 ※");
			 uri="member/joinForm";
		 }
		mv.setViewName(uri);
		return mv;
	}

	@RequestMapping(value = "/findf")
	public ModelAndView findf(ModelAndView mv) {
		mv.setViewName("member/findForm");
		return mv;
	}
	
	@RequestMapping(value = "/findID")
	public ModelAndView findID(ModelAndView mv, MemberVO vo, HttpSession session) 
					 	throws IOException {
		vo = service.findID(vo);
		if ( vo != null ) { 
			System.out.println("check : 0, id => "+vo.getId());
			session.setAttribute("id", vo.getId());
		}else {
			System.out.println("※ 해당 정보와 일치하는 회원 정보 없음 ※");
			mv.addObject("message", "※ 해당 정보와 일치하는 회원 정보 없음 ※");
//			uri = "member/findForm";
		} 
		mv.setViewName("member/findForm");
		return mv;
	}
	
	@RequestMapping(value = "/findPW")
	public ModelAndView findPW(ModelAndView mv, MemberVO vo, HttpSession session) 
					 	throws IOException {
		String uri = "redirect:findf";
		vo = service.findPW(vo);
		if ( vo != null ) { 
			System.out.println("check : 0, password => "+vo.getPassword());
			session.setAttribute("findPw", vo.getPassword());
			session.setAttribute("mail", vo.getMail());
		}else {
			System.out.println("※ 해당 정보와 일치하는 회원 정보 없음 ※");
			mv.addObject("message", "※ 해당 정보와 일치하는 회원 정보 없음 ※");
			uri = "member/findForm";
		} 
		mv.setViewName(uri);
		return mv;
	}
	
	@Autowired
	private JavaMailSender mailSender;
	@RequestMapping(value = "/sendMail")
	public String mailSend(HttpServletRequest request, MemberVO vo, HttpSession session) {
		
		Random random = new Random();
		String tmpPassword = String.valueOf(random. nextInt(888888)+111111);
		vo.setTmpPassword(tmpPassword);
		
		if( service.setPassword(vo) > 0) {
			try {
				MimeMessage mimeMessage = mailSender.createMimeMessage();
			    MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	 
			    messageHelper.setFrom("togetherdodo@gmail.com"); // 보내는사람 
			    messageHelper.setTo(vo.getMail());   // 받는사람
			    messageHelper.setSubject("임시 비밀번호 발송");   // 메일제목
			    messageHelper.setText("아이디 '"+vo.getId()+"'님의 임시 비밀 번호는 "+vo.getTmpPassword()+" 입니다."); // 메일 내용
	 
			    mailSender.send(mimeMessage);
			} catch (Exception e) {
				System.out.println("메일 발송 실패 => "+e.toString());
			}
		}
		session.invalidate();
		return "member/loginForm";
	}
	
	
} //MemberController
