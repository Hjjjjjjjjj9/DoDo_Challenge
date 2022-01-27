package green.with.dodo;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.ChallengeService;
import vo.ChallengeVO;


@Controller
public class ChallengeController {
	
	@Autowired
	ChallengeService service;

	@RequestMapping(value = "/cinsertf")
	public ModelAndView loginf(ModelAndView mv) {
		mv.setViewName("challenge/cinsertForm");
		return mv;
	}
	
	@RequestMapping(value = "/cinsert")
	public ModelAndView nlist(HttpServletRequest request, ModelAndView mv, ChallengeVO vo, RedirectAttributes rttr) 
			throws IOException {
		String uri = "redirect:clist";
		
		String realPath = request.getRealPath("/"); // deprecated Method
		System.out.println("** realPath => "+realPath);
		
		if (realPath.contains(".eclipse."))
			 realPath = "C:/MTest/HJWork/DoDo/src/main/webapp/resources/image/";
		// realPath = "D:/MTest/HJWork/DoDo/src/main/webapp/resources/uploadImage/"+vo.getId()+"/";
		else realPath += "resources\\image\\";
		
		File f1 = new File(realPath);
		if ( !f1.exists() ) 
			f1.mkdir();
		
		String file1, file2="resources/image/basic.jpg";
		
		MultipartFile uploadfilef = vo.getThumbnailf();
		if ( uploadfilef !=null && !uploadfilef.isEmpty() ) {
			file1=realPath + uploadfilef.getOriginalFilename();
			uploadfilef.transferTo(new File(file1));
			file2 = "resources/image/"+ uploadfilef.getOriginalFilename();
		}
		vo.setThumbnail(file2);
		
		if ( service.insert(vo) > 0 ) { 
    		rttr.addFlashAttribute("message", "※ 새글 등록 완료 ※");
    	}else {
    		mv.addObject("message", "※ 새글 등록 실패 ※");
    		uri = "challenge/cinsertForm";
    	}
		mv.setViewName(uri);
		return mv;
	} //cinsert
	
	@RequestMapping(value = "/clist")
	public ModelAndView nlist(ModelAndView mv) {
		List<ChallengeVO> list = new ArrayList<ChallengeVO>();
    	list = service.selectList();
    	if ( list!=null && list.size() > 0) 
    		 mv.addObject("banana", list);
    	else mv.addObject("message", "※ 출력 자료가 없습니다 ※");
		
    	mv.setViewName("challenge/cList");
		return mv;
	} //clist
	
	@RequestMapping(value = "/cdetail")
	public ModelAndView bdetail(HttpServletRequest request, ModelAndView mv, ChallengeVO vo) {
		String uri = "challenge/cDetail";
		vo = service.selectOne(vo);
		if ( vo != null ) {
			if ( "U".equals(request.getParameter("jcode")) ) 
    			uri = "challenge/cupdateForm";
			mv.addObject("apple", vo);
		}else {
			mv.addObject("message", "※ 글번호에 해당하는 자료가 없습니다 ※");
		}
		mv.setViewName(uri);
		return mv;
	} //cdetail
	
	@RequestMapping(value = "/checkTitle")
	public ModelAndView checkTitle(ModelAndView mv, ChallengeVO vo) {
		List<ChallengeVO> list = null;
		if ( vo.getCheck() != null ) 
			list = service.checkTitle(vo) ;
		else 
			list = service.selectList();
		
		if ( list != null && list.size()>0 ) mv.addObject("banana", list);
		else mv.addObject("message", "※ 출력할 자료가 1건도 없습니다 ※");
		
		mv.setViewName("challenge/cList");
		return mv;
	} //checkTitle
	
	@RequestMapping(value = "/checkCategory")
	public ModelAndView checkCategory(ModelAndView mv, ChallengeVO vo) {
		List<ChallengeVO> list = null;
		if ( vo.getCheck() != null ) 
			list = service.checkCategory(vo) ;
		else 
			list = service.selectList();
		
		if ( list != null && list.size()>0 ) mv.addObject("banana", list);
		else mv.addObject("message", "※ 출력할 자료가 1건도 없습니다 ※");
		
		mv.setViewName("challenge/cList");
		return mv;
	} //checkCategory
	
	@RequestMapping(value = "/cupdate")
	public ModelAndView bupdate(HttpServletRequest request, ModelAndView mv, ChallengeVO vo, RedirectAttributes rttr) 
	throws IOException {
		String uri = "challenge/cList";
		MultipartFile uploadfilef = vo.getThumbnailf();
		String file1, file2;
		if ( uploadfilef != null && !uploadfilef.isEmpty() ) {
			String realPath = request.getRealPath("/");
			if (realPath.contains(".eclipse."))
				realPath = "C:/MTest/HJWork/DoDo/src/main/webapp/resources/image/";
			// realPath = "D:/MTest/HJWork/DoDo/src/main/webapp/resources/uploadImage/"+vo.getId()+"/";
			else realPath += "resources\\image\\"; // 배포환경
			File f1 = new File(realPath);
			if ( !f1.exists() ) f1.mkdir();
			file1 = realPath + uploadfilef.getOriginalFilename();
			uploadfilef.transferTo(new File(file1));
			file2 = "resources/image/" + uploadfilef.getOriginalFilename();
			vo.setThumbnail(file2);
		}
		
		if ( service.update(vo) > 0 ) { 
    		rttr.addFlashAttribute("message", "※ 글수정 성공 ※");
    	}else {
    		rttr.addFlashAttribute("message", "※ 글수정 실패 ※");
    		uri = "redirect:cdetail?jcode=U&seq="+vo.getSeq();
    	}
		mv.setViewName(uri);
		return mv;
	} //cupdate
	
	@RequestMapping(value = "/cdelete")
	public ModelAndView bdelete(HttpServletRequest request ,ModelAndView mv, ChallengeVO vo, RedirectAttributes rttr) {
		String uri = "redirect:clist";
		if ( service.delete(vo) > 0 ) { 
			rttr.addFlashAttribute("message", "※ 글삭제 성공 ※");
    	}else {
    		rttr.addFlashAttribute("message", "※ 글삭제 실패 ※");
    		uri = "redirect:cdetail?seq="+vo.getSeq();
    	}
		mv.setViewName(uri);
		return mv;
	} //cdelete	
	
	
/*		
	@RequestMapping(value = "/nlist")
	public ModelAndView nlist(ModelAndView mv) {
		List<NoticeVO> list = new ArrayList<NoticeVO>();
    	list = service.selectList();
    	if ( list!=null && list.size()>0) 
    		 mv.addObject("banana", list);
    	else mv.addObject("message", "※ 출력 자료가 없습니다 ※");
		
    	mv.setViewName("board/notice");
		return mv;
	} //nlist

	@RequestMapping(value = "/ndetail")
	public ModelAndView ndetail(HttpServletRequest request, ModelAndView mv, NoticeVO vo) {
		String uri = "board/nDetail";
		vo = service.selectOne(vo);
    	if ( vo!=null ) {
    		String loginID = (String)request.getSession().getAttribute("loginID") ;
    		if ( !vo.getId().equals(loginID) &&    
    			 !"U".equals(request.getParameter("jcode")) ) {
    			if ( service.countUp(vo) > 0 )
    					vo.setCnt(vo.getCnt()+1) ;
    		}
    		mv.addObject("apple", vo);
    		if ( "U".equals(request.getParameter("jcode")) ) 
    			uri = "board/bupdateForm";
    	}else {
    		mv.addObject("message", "※ 글번호에 해당하는 자료가 없습니다 ※");
    	}
		mv.setViewName(uri);
		return mv;
	} //ndetail
	
	@RequestMapping(value = "/binsertf")
	public ModelAndView binsertf(ModelAndView mv) {
		mv.setViewName("board/binsertForm");
		return mv;
	} //binsertf
	
	@RequestMapping(value = "/binsert")
	public ModelAndView binsert(ModelAndView mv, BoardVO vo, RedirectAttributes rttr) {
		
		String uri = "redirect:blist";
		if ( service.insert(vo) > 0 ) { 
    		// 글등록 성공 -> blist , redirect
    		rttr.addFlashAttribute("message", "~~ 새글 등록 완료 !!! ~~");
    	}else {
    		mv.addObject("message", "~~ 새글 등록 실패 !!! ~~");
    		uri = "board/binsertForm";
    	}
		mv.setViewName(uri);
		return mv;
	} //binsert
	
	@RequestMapping(value = "/bupdate")
	public ModelAndView bupdate(ModelAndView mv, BoardVO vo, RedirectAttributes rttr) {
		
		String uri = "redirect:blist";
		if ( service.update(vo) > 0 ) { 
    		// 글수정 성공 -> blist : redirect
    		rttr.addFlashAttribute("message", "~~ 글수정 성공 !!! ~~");
    	}else {
    		rttr.addFlashAttribute("message", "~~ 글수정 실패 !!! 다시 하세요 ~~");
    		uri = "redirect:bdetail?jcode=U&seq="+vo.getSeq();
    	}
		mv.setViewName(uri);
		return mv;
	} //bupdate
	
	@RequestMapping(value = "/bdelete")
	public ModelAndView bdelete(ModelAndView mv, BoardVO vo, RedirectAttributes rttr) {
		
		String uri = "redirect:blist";
		if ( service.delete(vo) > 0 ) { 
    		// 글삭제 성공 -> blist  : redirect
			rttr.addFlashAttribute("message", "~~ 글삭제 성공 !!! ~~");
    	}else {
    		rttr.addFlashAttribute("message", "~~ 글삭제 실패 !!! ~~");
    		uri = "redirect:bdetail?seq="+vo.getSeq();
    	}
		mv.setViewName(uri);
		return mv;
	} //bdelete	
*/
	
} //class
