package com.us.uni.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.us.uni.board.model.service.BoardService;
import com.us.uni.board.model.vo.Board;
import com.us.uni.board.model.vo.Reply;
import com.us.uni.common.model.vo.Attachment;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.common.template.Pagination;

@Controller
public class BoardController {
	
	
	@Autowired
	private BoardService bService;
	
	// 커뮤니티 리스트
	@RequestMapping("list.bo")
	public ModelAndView selectList(@RequestParam(value="cpage",defaultValue="1")int currentPage, ModelAndView mv) {
		
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Board> list = bService.selectList(pi);
		
		//System.out.println(list);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("board/boardListView");
		
		return mv;
	}
	
	//커뮤니티 검색
	@RequestMapping("search.bo")
	public ModelAndView searchList(@RequestParam(value="cpage")int currentPage, String condition, String keyword, ModelAndView mv) {
			

		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int searchCount = bService.selectSearchCount(map); 
		//현재 검색결과에 맞는 게시글 총갯수 

		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 5);
		ArrayList<Board> list = bService.selectSearchList(map, pi);
			
			//System.out.println(searchCount);
			//System.out.println(map);
			
			mv.addObject("pi", pi)
			  .addObject("list", list)
			  .addObject("condition", condition)
			  .addObject("keyword", keyword)
			  .setViewName("board/boardListView");
			  
			  return mv;
		}
	
	
	//카테고리별 조회
	@RequestMapping("keyword.bo")
	public ModelAndView selectKeyword(@RequestParam(value="cpage",defaultValue="1")int currentPage,int bokeyword, ModelAndView mv) {
		
		
		//System.out.println(bokeyword);
		
		
		int listCount = bService.selectKeywordListCount(bokeyword);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Board> list = bService.selectKeyword(pi,bokeyword);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("board/boardListView");
		
		return mv;
	}
	
	//커뮤니티 등록
	@RequestMapping("enrollForm.bo")
	public String enrollForm() {
		
		return "board/boardForm";
	}
	
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, MultipartFile upfile, HttpSession session, Model model) {
		
		
		Attachment at = new Attachment();
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			// 원본명, 서버업로드된경로를 Attatchment 에 이어서 담기
			at.setOriginName(upfile.getOriginalFilename());
			at.setChangeName(changeName);
			at.setPath("resources/uploadFiles/board/"+ changeName);
		} 
		
		int result = bService.insertBoard(b, at);
		//System.out.println(b);
		
		if(result > 0) { // 성공 => 게시글 리스트페이지 (list.bo  url재요청)
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "redirect:list.bo";
		}else { // 실패 => 에러페이지 포워딩
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "board/boardListView";
		}
		
	}
	
	
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {
		// bno에는 상세조회하고자하는 해당 게시글 번호 담겨있음
		
		Attachment at = new Attachment();
		// 해당 게시글 조회수 증가용 서비스 호출 결과 받기 (update하고 옴)
		int result = bService.increaseCount(bno);	
		if(result > 0) {
		
			Board b = bService.selectBoard(bno);
			System.out.println(b);
			if(at != null) {
				at = bService.selectAttachBoard(bno);
			}
			
				mv.addObject("b", b)
				  .addObject("at",at)
				  .setViewName("board/boardDetailView");
				
			//System.out.println("상세ctr:"+ at);
			
		}else {
		
			mv.addObject("errorMsg", "상세조회 실패").setViewName("common/boardListView");
		}
		
		return mv;
	}
	

		@RequestMapping("delete.bo")
		public String deleteBoard(int bno, String filePath, HttpSession session, Model model) {
		
			//System.out.println(bno);
			//System.out.println(filePath);
			
			
		int result = bService.deleteBoard(bno);
		
		if(result > 0) {
			
			// 첨부파일이 있었을 경우 => 파일 삭제
			if(!filePath.equals("")) {  
				int atresult = bService.deleteAttachBoard(bno);
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			
			// 게시판 리스트페이지   list.bo  url재요청
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			return "redirect:list.bo";
			
		}else {
			// 삭제 실패
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "redirect:/";
		}
		
		
	}

		@RequestMapping("updateForm.bo")
		public String updateForm(int bno, Model model) {
			
			model.addAttribute("b", bService.selectBoard(bno));
			model.addAttribute("at", bService.selectAttachBoard(bno));
			
			return "board/boardUpdateView";
		}
		
		
		@RequestMapping("update.bo")
		public String updateBoard(Board b, Attachment at, MultipartFile reupfile, HttpSession session, Model model) {
		
			int newAtInsert = 1;
			
			// 새로 넘어온 첨부파일이 있을 경우 
			if(!reupfile.getOriginalFilename().equals("")) {
				
				// 새로넘어온 첨부파일 서버 업로드 시키기 
				String changeName = saveFile(reupfile, session);
				// b에 새로 넘어온 첨부파일에 대한 원본명, 저장경로 담기 
				at.setOriginName(reupfile.getOriginalFilename());
				at.setChangeName(changeName);
				at.setPath("resources/uploadFiles/board/" + changeName);
				
				// 기존에 첨부파일이 있었을 경우 => 기존의 첨부파일 지우기 
				if(at.getOriginName() != null) {
					new File(session.getServletContext().getRealPath(at.getPath())).delete();
					newAtInsert = bService.updateAttachBoard(at);
				}else {
					at.setRefNo(b.getBoardNo());
					newAtInsert = bService.newUpdateAttachBoard(at);
				}
								
			}
			
			int result = bService.updateBoard(b);
			
			if(result * newAtInsert > 0) { // 수정 성공 => 상세페이지   detail.bo?bno=해당게시글번호    url재요청
				session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
				return "redirect:detail.bo?bno=" + b.getBoardNo();
				
			}else { // 수정 실패 => 에러페이지
				model.addAttribute("errorMsg", "게시글 수정 실패");
				return "common/list.bo";
			}
			
		}
		
 
		
			/*대외활동 리스트 조회*/
			@RequestMapping("list.vbo")
			public ModelAndView volselectList(@RequestParam(value="cpage",defaultValue="1")int currentPage, ModelAndView mv) {
				
				int listCount = bService.volselectListCount();
				
				PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
				ArrayList<Board> list = bService.volselectList(pi);
				
				//System.out.println(list);
				
				mv.addObject("pi", pi)
				  .addObject("list", list)
				  .setViewName("volunteer/volListView");
				
				return mv;
			  }
		
				// 동아리 리스트
				@RequestMapping("list.cbo")
				public ModelAndView cirselectList(@RequestParam(value="cpage",defaultValue="1")int currentPage, ModelAndView mv) {
					
					int listCount = bService.cirselectListCount();
					
					PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
					ArrayList<Board> list = bService.volselectList(pi);
					
					//System.out.println(list);
					
					mv.addObject("pi", pi)
					  .addObject("list", list)
					  .setViewName("volunteer/circleListView");
					
					return mv;
				}
				
				// 공지 리스트
				@RequestMapping("list.nbo")
				public ModelAndView nselectList(@RequestParam(value="cpage",defaultValue="1")int currentPage, ModelAndView mv) {
					
					int listCount = bService.nselectListCount();
					
					PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
					ArrayList<Board> list = bService.nselectList(pi);
					
					//System.out.println(list);
					
					mv.addObject("pi", pi)
					  .addObject("list", list)
					  .setViewName("notice/noticeListView");
					
					return mv;
				}
		
				/*공지사항*/
				@RequestMapping("search.nbo")
				public ModelAndView nsearchList(@RequestParam(value="cpage")int currentPage, String condition, String keyword, ModelAndView mv) {
						

					HashMap<String, String> map = new HashMap<>();
					map.put("condition", condition);
					map.put("keyword", keyword);
						
					int searchCount = bService.nselectSearchCount(map); // 현재 검색결과에 맞는 게시글 총갯수 

					PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 10);
					ArrayList<Board> list = bService.nselectSearchList(map, pi);
						
						mv.addObject("pi", pi)
						  .addObject("list", list)
						  .addObject("condition", condition)
						  .addObject("keyword", keyword)
						  .setViewName("notice/noticeListView");
						
						return mv;
					}
	
				//공지등록
				@RequestMapping("enrollForm.nbo")
				public String nenrollForm() {
					
					return "notice/noticeForm";
				}
				
				@RequestMapping("insert.nbo")
				public String ninsertBoard(Board b, MultipartFile upfile, HttpSession session, Model model) {
					Attachment at = new Attachment();
					
					if(!upfile.getOriginalFilename().equals("")) {
						String changeName = saveFile(upfile, session);
						// 원본명, 서버업로드된경로를 Attatchment 에 이어서 담기
						at.setOriginName(upfile.getOriginalFilename());
						at.setChangeName(changeName);
						at.setPath("resources/uploadFiles/board/"+ changeName);
					} 
					
					int result = bService.insertBoard(b, at);
					//System.out.println(b);
					
					if(result > 0) { // 성공 => 게시글 리스트페이지 (list.bo  url재요청)
						session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
						return "redirect:list.nbo";
					}else { // 실패 => 에러페이지 포워딩
						model.addAttribute("errorMsg", "게시글 등록 실패");
						return "notice/noticeListView";
					}
					
				}
				
				@RequestMapping("detail.nbo")
				public ModelAndView nselectBoard(int bno, ModelAndView mv) {
					// bno에는 상세조회하고자하는 해당 게시글 번호 담겨있음
					
					Attachment at = new Attachment();
					// 해당 게시글 조회수 증가용 서비스 호출 결과 받기 (update하고 옴)
					int result = bService.increaseCount(bno);	
					if(result > 0) {
					
						Board b = bService.selectBoard(bno);
						
						if(at != null) {
							at = bService.selectAttachBoard(bno);
						}
						
							mv.addObject("b", b)
							  .addObject("at",at)
							  .setViewName("notice/noticeDetailView");
							
						//System.out.println("상세ctr:"+ at);
						
					}else {
					
						mv.addObject("errorMsg", "상세조회 실패").setViewName("notice/noticeListView");
					}
					
					return mv;
				}
	
				
			
				@RequestMapping("update.nbo")
				public String nupdateBoard(Board b, Attachment at, MultipartFile reupfile, HttpSession session, Model model) {
				
					int newAtInsert = 1;
					
					// 새로 넘어온 첨부파일이 있을 경우 
					if(!reupfile.getOriginalFilename().equals("")) {
						
						// 새로넘어온 첨부파일 서버 업로드 시키기 
						String changeName = saveFile(reupfile, session);
						// b에 새로 넘어온 첨부파일에 대한 원본명, 저장경로 담기 
						at.setOriginName(reupfile.getOriginalFilename());
						at.setChangeName(changeName);
						at.setPath("resources/uploadFiles/board/" + changeName);
						
						// 기존에 첨부파일이 있었을 경우 => 기존의 첨부파일 지우기 
						if(at.getOriginName() != null) {
							new File(session.getServletContext().getRealPath(at.getPath())).delete();
							newAtInsert = bService.updateAttachBoard(at);
						}else {
							at.setRefNo(b.getBoardNo());
							newAtInsert = bService.newUpdateAttachBoard(at);
						}
										
					}
					
					int result = bService.nupdateBoard(b);
					
					if(result * newAtInsert > 0) { // 수정 성공 => 상세페이지   detail.bo?bno=해당게시글번호    url재요청
						session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
						return "redirect:detail.nbo?bno=" + b.getBoardNo();
						
					}else { // 수정 실패 => 에러페이지
						model.addAttribute("errorMsg", "게시글 수정 실패");
						return "notice/noticeListView";
					}
					
				}
				
				
				/*대외활동*/
				
				//대외활동 등록
				@RequestMapping("enrollForm.vbo")
				public String venrollForm() {
					
					return "volunteer/volForm";
				}
				
				@RequestMapping("insert.vbo")
				public String vinsertBoard(Board b, MultipartFile upfile, HttpSession session, Model model) {
					
					int result = bService.vinsertBoard(b);
					//System.out.println(b);
					
					if(result > 0) { // 성공 => 게시글 리스트페이지 (list.bo  url재요청)
						session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
						return "redirect:list.vbo";
					}else { // 실패 => 에러페이지 포워딩
						model.addAttribute("errorMsg", "게시글 등록 실패");
						return "volunteer/volListView";
					}
					
				}
	
				
				@RequestMapping("detail.vbo")
				public ModelAndView vselectBoard(int bno, ModelAndView mv) {
					// bno에는 상세조회하고자하는 해당 게시글 번호 담겨있음
					
					Attachment at = new Attachment();
					// 해당 게시글 조회수 증가용 서비스 호출 결과 받기 (update하고 옴)
					int result = bService.increaseCount(bno);	
					if(result > 0) {
					
						Board b = bService.vselectBoard(bno);
						
						if(at != null) {
							at = bService.selectAttachBoard(bno);
						}
						
							mv.addObject("b", b)
							  .addObject("at",at)
							  .setViewName("volunteer/volSelectForm");
					}else {
					
						mv.addObject("errorMsg", "상세조회 실패").setViewName("volunteer/volListView");
					}
					
					return mv;
				}
				
				@RequestMapping("update.vbo")
				public String vupdateBoard(Board b, Attachment at, MultipartFile reupfile, HttpSession session, Model model) {
				
					int newAtInsert = 1;
					
					// 새로 넘어온 첨부파일이 있을 경우 
					if(!reupfile.getOriginalFilename().equals("")) {
						
						// 새로넘어온 첨부파일 서버 업로드 시키기 
						String changeName = saveFile(reupfile, session);
						// b에 새로 넘어온 첨부파일에 대한 원본명, 저장경로 담기 
						at.setOriginName(reupfile.getOriginalFilename());
						at.setChangeName(changeName);
						at.setPath("resources/uploadFiles/board/" + changeName);
						
						// 기존에 첨부파일이 있었을 경우 => 기존의 첨부파일 지우기 
						if(at.getOriginName() != null) {
							new File(session.getServletContext().getRealPath(at.getPath())).delete();
							newAtInsert = bService.updateAttachBoard(at);
						}else {
							at.setRefNo(b.getBoardNo());
							newAtInsert = bService.newUpdateAttachBoard(at);
						}
										
					}
					
					int result = bService.updateBoard(b);
					
					if(result * newAtInsert > 0) { // 수정 성공 => 상세페이지   detail.bo?bno=해당게시글번호    url재요청
						session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
						return "redirect:detail.vbo?bno=" + b.getBoardNo();
						
					}else { // 수정 실패 => 에러페이지
						model.addAttribute("errorMsg", "게시글 수정 실패");
						return "volunteer/volListView";
					}
					
				}
				
				
				/*동아리*/
				//동아리 등록
				@RequestMapping("enrollForm.cbo")
				public String cenrollForm() {
					
					return "volunteer/circleForm";
				}
				
				@RequestMapping("insert.cbo")
				public String cinsertBoard(Board b, MultipartFile upfile, HttpSession session, Model model) {
					
					int result = bService.cinsertBoard(b);
					//System.out.println(b);
					
					if(result > 0) { // 성공 => 게시글 리스트페이지 (list.bo  url재요청)
						session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
						return "redirect:list.cbo";
					}else { // 실패 => 에러페이지 포워딩
						model.addAttribute("errorMsg", "게시글 등록 실패");
						return "volunteer/circleListView";
					}
				}
	
				//대외활동 검색
				@RequestMapping("search.vbo")
				public ModelAndView searchvList(@RequestParam(value="cpage")int currentPage, String condition, String keyword, ModelAndView mv) {
						

					HashMap<String, String> map = new HashMap<>();
					map.put("condition", condition);
					map.put("keyword", keyword);
						
					int searchCount = bService.selectvSearchCount(map); // 현재 검색결과에 맞는 게시글 총갯수 

					PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 10);
					ArrayList<Board> list = bService.selectvSearchList(map, pi);
						
						mv.addObject("pi", pi)
						  .addObject("list", list)
						  .addObject("condition", condition)
						  .addObject("keyword", keyword)
						  .setViewName("volunteer/volListView");
						
						return mv;
					}
				
				//대외활동 검색
				@RequestMapping("search.cbo")
				public ModelAndView searchcList(@RequestParam(value="cpage")int currentPage, String condition, String keyword, ModelAndView mv) {
						

					HashMap<String, String> map = new HashMap<>();
					map.put("condition", condition);
					map.put("keyword", keyword);
						
					int searchCount = bService.selectcSearchCount(map); // 현재 검색결과에 맞는 게시글 총갯수 

					PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 10, 10);
					ArrayList<Board> list = bService.selectcSearchList(map, pi);
						
						mv.addObject("pi", pi)
						  .addObject("list", list)
						  .addObject("condition", condition)
						  .addObject("keyword", keyword)
						  .setViewName("volunteer/circleListView");
						
						return mv;
					}
				
				
				@RequestMapping("detail.cbo")
				public ModelAndView cselectBoard(int bno, ModelAndView mv) {
					// bno에는 상세조회하고자하는 해당 게시글 번호 담겨있음
					
					Attachment at = new Attachment();
					// 해당 게시글 조회수 증가용 서비스 호출 결과 받기 (update하고 옴)
					int result = bService.increaseCount(bno);	
					if(result > 0) {
					
						Board b = bService.cselectBoard(bno);
						
						if(at != null) {
							at = bService.selectAttachBoard(bno);
						}
						
							mv.addObject("b", b)
							  .addObject("at",at)
							  .setViewName("volunteer/circleSelectForm");
							
						//System.out.println("상세ctr:"+ at);
						
					}else {
					
						mv.addObject("errorMsg", "상세조회 실패").setViewName("volunteer/circleListView");
					}
					
					return mv;
				}

				// 공지 수정 삭제
				@RequestMapping("delete.nbo")
				public String ndeleteBoard(int bno, String filePath, HttpSession session, Model model) {

				int result = bService.deleteBoard(bno);
				
				if(result > 0) {
					
					// 첨부파일이 있었을 경우 => 파일 삭제
					if(!filePath.equals("")) {  
						int atresult = bService.deleteAttachBoard(bno);
						new File(session.getServletContext().getRealPath(filePath)).delete();
					}
					
					// 게시판 리스트페이지   list.bo  url재요청
					session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
					return "redirect:list.nbo";
					
				}else {
					// 삭제 실패
					model.addAttribute("errorMsg", "게시글 삭제 실패");
					return "redirect:/";
				}
				
				
			}

			
				@RequestMapping("updateForm.nbo")
				public String nupdateForm(int bno, Model model) {
					
					model.addAttribute("b", bService.selectBoard(bno));
					model.addAttribute("at", bService.selectAttachBoard(bno));
					
					return "notice/noticeUpdateForm";
				}

				
				//대외 수정삭제
				@RequestMapping("delete.vbo")
				public String vdeleteBoard(int bno, String filePath, HttpSession session, Model model) {

				int result = bService.deleteBoard(bno);
				
				if(result > 0) {
					
					// 첨부파일이 있었을 경우 => 파일 삭제
					if(!filePath.equals("")) {  
						int atresult = bService.deleteAttachBoard(bno);
						new File(session.getServletContext().getRealPath(filePath)).delete();
					}
					
					// 게시판 리스트페이지   list.bo  url재요청
					session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
					return "redirect:list.vbo";
					
				}else {
					// 삭제 실패
					model.addAttribute("errorMsg", "게시글 삭제 실패");
					return "redirect:/";
				}
				
			}

				@RequestMapping("updateForm.vbo")
				public String vupdateForm(int bno, Model model) {
					
					model.addAttribute("b", bService.selectBoard(bno));
					model.addAttribute("at", bService.selectAttachBoard(bno));
					
					return "volunteer/volUpdateView";
				}

				
				//동아리 수정삭제
				@RequestMapping("delete.cbo")
				public String cdeleteBoard(int bno, String filePath, HttpSession session, Model model) {

				int result = bService.deleteBoard(bno);
				
				if(result > 0) {
					if(!filePath.equals("")) {  
						int atresult = bService.deleteAttachBoard(bno);
						new File(session.getServletContext().getRealPath(filePath)).delete();
					}
					session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
					return "redirect:list.cbo";
				}else {
					model.addAttribute("errorMsg", "게시글 삭제 실패");
					return "redirect:/";
				}
			}

				@RequestMapping("updateForm.cbo")
				public String cupdateForm(int bno, Model model) {
					
					model.addAttribute("b", bService.selectBoard(bno));
					model.addAttribute("at", bService.selectAttachBoard(bno));
					
					return "volunteer/cirUpdateView";
				}
				
				@RequestMapping("update.cbo")
				public String cupdateBoard(Board b, Attachment at, MultipartFile reupfile, HttpSession session, Model model) {
				
					int newAtInsert = 1;
					
					// 새로 넘어온 첨부파일이 있을 경우 
					if(!reupfile.getOriginalFilename().equals("")) {
						// 새로넘어온 첨부파일 서버 업로드 시키기 
						String changeName = saveFile(reupfile, session);
						// b에 새로 넘어온 첨부파일에 대한 원본명, 저장경로 담기 
						at.setOriginName(reupfile.getOriginalFilename());
						at.setChangeName(changeName);
						at.setPath("resources/uploadFiles/board/" + changeName);
						
						// 기존에 첨부파일이 있었을 경우 => 기존의 첨부파일 지우기 
						if(at.getOriginName() != null) {
							new File(session.getServletContext().getRealPath(at.getPath())).delete();
							newAtInsert = bService.updateAttachBoard(at);
						}else {
							at.setRefNo(b.getBoardNo());
							newAtInsert = bService.newUpdateAttachBoard(at);
						}
										
					}
					
					int result = bService.updateBoard(b);
					
					if(result * newAtInsert > 0) { // 수정 성공 => 상세페이지   detail.bo?bno=해당게시글번호    url재요청
						session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
						return "redirect:detail.cbo?bno=" + b.getBoardNo();
						
					}else { // 수정 실패 => 에러페이지
						model.addAttribute("errorMsg", "게시글 수정 실패");
						return "volunteer/circleListView";
					}
					
				}

				
				//댓글작성
				@ResponseBody
				@RequestMapping(value="rlist.bo", produces="application/json; charset=utf-8")
				public String ajaxSelectReplyList(int bno) {
					
					ArrayList<Reply> list =bService.selectReplyList(bno);
					//System.out.println(list);
					return new Gson().toJson(list);
				}
				
				//댓글등록
				@ResponseBody
				@RequestMapping(value="rinsert.bo")
				public String ajaxInsertReply(Reply r) {
					
					int result = bService.insertReply(r);
					
					return result>0 ? "success":"fail";
				}
				
				//댓글삭제
				@ResponseBody
				@RequestMapping(value="replyDelete",produces="application/json; charset=utf-8")
				public int ajaxdeleteReply(int replyNo) {
					int result = bService.deleteReply(replyNo);
					
					return result;
				}
 	 
		
				
				
				public String saveFile(MultipartFile upfile, HttpSession session) {
					String originName = upfile.getOriginalFilename(); // "flower.png"
					
					String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // "20220118103507"(년월일시분초)
					int ranNum = (int)(Math.random() * 90000 + 10000); // 23152 (5자리 랜덤값)
					String ext = originName.substring(originName.lastIndexOf(".")); // ".png"
					
					String changeName = currentTime + ranNum + ext;
							
					// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
					String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/board/");
					
						try {
							upfile.transferTo(new File(savePath + changeName));
						} catch (IllegalStateException | IOException e) {
							e.printStackTrace();
						}
						
					
					return changeName;
				}
				
	}
	
	

	
	
	
	

