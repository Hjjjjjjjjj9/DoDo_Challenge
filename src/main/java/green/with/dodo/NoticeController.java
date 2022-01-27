package green.with.dodo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.NoticeService;
import vo.NoticeVO;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService service;

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
	
/*	
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
