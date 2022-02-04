package green.with.dodo;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@RequestMapping("/admin/*")
@Controller
public class SecurityController {
	
	@Secured({"ROLE_ADMIN"})
	@GetMapping("/adminonly")
	public ModelAndView doAdmin(ModelAndView mv) {
		System.out.println("admin only페이지 접근");
		mv.setViewName("admin/memberList");
		return mv;
	}
	
	@RequestMapping(value="/adminLogout")
	public String aLogout() {
		System.out.println("관리자 로그아웃");
		return "redirect:/";
	}
	

}
