package com.web.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.web.dao.MybatisDAO;
import com.web.vo.BoardList;
import com.web.vo.BoardVO;
import com.web.vo.DynamicParam;
import com.web.vo.JuminParam;
import com.web.vo.Param;



@Controller
public class HomeController {
	
	@Autowired
	public SqlSession sqlSession;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "redirect:list";
	}
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(HttpServletRequest request , Model model) {
		
		return "insert";
	}
	
	private static final String FILE_SERVER_PATH = "C:\\Users\\bid\\Desktop\\spring\\workspace\\board\\src\\main\\webapp\\WEB-INF\\file\\";
	
	@RequestMapping("/download")
	public ModelAndView download(@RequestParam HashMap<Object, Object> params, ModelAndView mv) {
		System.out.println("컨트롤러의 download() 메소드 실행");
		String fileName = (String) params.get("fileName");
		String fullPath = FILE_SERVER_PATH + "/" + fileName;
		
		File file = new File(fullPath);
		System.out.println(fullPath);
		mv.setViewName("downloadView");
		mv.addObject("downloadFile", file);
		return mv;
	}
	
/*	
	@RequestMapping("/fileUpload")
	public String fileUpload(Model model, @RequestParam("file") MultipartFile file1, 
			@RequestParam("exelFile") MultipartFile file2, @RequestParam("wordFile") MultipartFile file3) throws IOException {
		System.out.println("컨트롤러의 fileUpload() 메소드 실행");
		String path1 = "C:/Users/bid/Desktop/spring/workspace/board/src/main/webapp/WEB-INF/profile/";
		String path2 = "C:/Users/bid/Desktop/spring/workspace/board/src/main/webapp/WEB-INF/file/";
		String path3 = "C:/Users/bid/Desktop/spring/workspace/board/src/main/webapp/WEB-INF/file/";
		ArrayList<MultipartFile> list = new ArrayList<MultipartFile>();
		list.add(file1);
		list.add(file2);
		list.add(file3);
		//받은 파일 리스트에 넣어서 리스트 안의 아이템들 불러와서 저장시킨다.
				for(MultipartFile item : list) {
					//확장자 따기
					int pos = item.getOriginalFilename().lastIndexOf(".");
					System.out.println(item.getOriginalFilename().substring(pos+1));
					//확장자에 따라서 저장되는 경로 변경
					if(item.getOriginalFilename().substring(pos+1).equals("jpg")) {
						System.out.println("사진");
						File target = new File(path1+item.getOriginalFilename()); 	// 만약 파일 이름을 바꿔서 저장시키고 싶으면 path1 + 새로운파일이름 + 확장자 
				        FileCopyUtils.copy(item.getBytes(), target);
					}else if(item.getOriginalFilename().substring(pos+1).equals("xlsx")){
						System.out.println("엑셀");
						File target = new File(path2+item.getOriginalFilename());
				        FileCopyUtils.copy(item.getBytes(), target);
					}else if(item.getOriginalFilename().substring(pos+1).equals("hwp")) {
						System.out.println("한글");
						File target = new File(path3+item.getOriginalFilename());
				        FileCopyUtils.copy(item.getBytes(), target);
					}
				}
		return "insert";
	}
*/
	
	@RequestMapping(value = "/insertOK", method = RequestMethod.POST)
	public String insertOK(@RequestParam("file") MultipartFile file1, @RequestParam("exelFile") MultipartFile file2, @
			RequestParam("wordFile") MultipartFile file3, 
			HttpServletRequest request , Model model, BoardVO vo) throws IOException {
		
		System.out.println("컨트롤러의 insertOK() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		System.out.println(vo);
		mapper.insert(vo);
		vo.setNo(mapper.getSelectNo());

		
		String path1 = "C:/Users/bid/Desktop/spring/workspace/board/src/main/webapp/WEB-INF/profile/";
		String path2 = "C:/Users/bid/Desktop/spring/workspace/board/src/main/webapp/WEB-INF/file/";
		String path3 = "C:/Users/bid/Desktop/spring/workspace/board/src/main/webapp/WEB-INF/file/";
		
		ArrayList<MultipartFile> list = new ArrayList<MultipartFile>();
		list.add(file1);
		list.add(file2);
		list.add(file3);
		String savedFileName = "";
		
		//받은 파일 리스트에 넣어서 리스트 안의 아이템들 불러와서 저장시킨다.
		for(MultipartFile item : list) {
			//확장자 따기
			int pos = item.getOriginalFilename().lastIndexOf(".");
			System.out.println(item.getOriginalFilename().substring(pos+1));
			//확장자에 따라서 저장되는 경로 변경
			if(item.getOriginalFilename().substring(pos+1).equals("jpg")) {
				System.out.println("사진");
				savedFileName = vo.getNo()+".jpg";
				File target = new File(path1+savedFileName); 	
		        FileCopyUtils.copy(item.getBytes(), target);
		        vo.setImage(savedFileName);
		        mapper.insertImage(vo);
		        
			}else if(item.getOriginalFilename().substring(pos+1).equals("xlsx")){
				System.out.println("엑셀");
				savedFileName = vo.getNo()+".xlsx";
				File target = new File(path2+savedFileName);
		        FileCopyUtils.copy(item.getBytes(), target);
		        vo.setExel(savedFileName);;
		        mapper.insertExel(vo);
		        
			}else if(item.getOriginalFilename().substring(pos+1).equals("hwp")) {
				System.out.println("한글");
				savedFileName = vo.getNo()+".hwp";
				File target = new File(path3+savedFileName);
		        FileCopyUtils.copy(item.getBytes(), target);
		        vo.setWord(savedFileName);;
		        mapper.insertWord(vo);
			}
		}
		System.out.println(vo);
		return "redirect:list";
	}
	@RequestMapping(value = "/list")
	public String list(Locale locale, Model model, HttpServletRequest request) {
		System.out.println("컨트롤러의 list() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		int pageSize = 5;
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) { }
		int totalCount = mapper.selectCount();
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationCTX.xml");
		BoardList boardList = ctx.getBean("BoardList", BoardList.class); // 기본 생성자로 생성된 bean
		boardList.initMvcBoardList(pageSize, totalCount, currentPage);
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", boardList.getStartNo());
		hmap.put("endNo", boardList.getEndNo());
		boardList.setBoardList(mapper.getList(hmap));
		model.addAttribute("boardList", boardList);
		
		return "list";
	
	}
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request , Model model) {
		System.out.println("컨트롤러의 update() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		int no = Integer.parseInt(request.getParameter("no"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		BoardVO vo =  mapper.selectByIdx(no);
		model.addAttribute("vo", vo);
		model.addAttribute("currentPage", currentPage);
		return "update";
	}
	
	@RequestMapping(value = "/updateOK", method = RequestMethod.POST)
	public String updateOK(@RequestParam("file") MultipartFile file1, @RequestParam("exelFile") MultipartFile file2, @
			RequestParam("wordFile") MultipartFile file3, 
			HttpServletRequest request , Model model, BoardVO vo) throws IOException {
		
		
		System.out.println("컨트롤러의 updateOK() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		System.out.println(vo);
		mapper.update(vo);
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		String path1 = "C:/Users/bid/Desktop/spring/workspace/board/src/main/webapp/WEB-INF/profile/";
		String path2 = "C:/Users/bid/Desktop/spring/workspace/board/src/main/webapp/WEB-INF/file/";
		String path3 = "C:/Users/bid/Desktop/spring/workspace/board/src/main/webapp/WEB-INF/file/";
		
		ArrayList<MultipartFile> list = new ArrayList<MultipartFile>();
		list.add(file1);
		list.add(file2);
		list.add(file3);
		String savedFileName = "";
		//받은 파일 리스트에 넣어서 리스트 안의 아이템들 불러와서 저장시킨다.
				for(MultipartFile item : list) {
					//확장자 따기
					int pos = item.getOriginalFilename().lastIndexOf(".");
					System.out.println(item.getOriginalFilename().substring(pos+1));
					//확장자에 따라서 저장되는 경로 변경
					if(item.getOriginalFilename().substring(pos+1).equals("jpg")) {
						System.out.println("사진");
						savedFileName = vo.getNo()+".jpg";
						File target = new File(path1+savedFileName); 	
				        FileCopyUtils.copy(item.getBytes(), target);
				        vo.setImage(savedFileName);
				        mapper.insertImage(vo);
				        
					}else if(item.getOriginalFilename().substring(pos+1).equals("xlsx")){
						System.out.println("엑셀");
						savedFileName = vo.getNo()+".xlsx";
						File target = new File(path2+savedFileName);
				        FileCopyUtils.copy(item.getBytes(), target);
				        vo.setExel(savedFileName);;
				        mapper.insertExel(vo);
				        
					}else if(item.getOriginalFilename().substring(pos+1).equals("hwp")) {
						System.out.println("한글");
						savedFileName = vo.getNo()+".hwp";
						File target = new File(path3+savedFileName);
				        FileCopyUtils.copy(item.getBytes(), target);
				        vo.setWord(savedFileName);;
				        mapper.insertWord(vo);
					}
				}
				System.out.println(vo);
		
		model.addAttribute("currentPage", currentPage);
		
		return "redirect:list";
	}
	
	@RequestMapping(value = "/delete")
	public String delete(HttpServletRequest request , Model model) {
		System.out.println("컨트롤러의 delete() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		String numbers = request.getParameter("numbers");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		int no = 0;
		StringTokenizer st = new StringTokenizer(numbers, ",");
		
		for(int i = 0 ; i < cnt ; i++) {
			no = Integer.parseInt(st.nextToken());  
			mapper.delete(no);
		}
		model.addAttribute("currentPage", currentPage);
		return "redirect:list";
	}
	
	@RequestMapping(value = "/searchOK")
	public String searchOK(HttpServletRequest request , Model model) {
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		String search = request.getParameter("search");
		String searchText = request.getParameter("searchText");
		int pageSize = 5;
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) { }
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationCTX.xml");
		BoardList boardList = ctx.getBean("BoardList", BoardList.class); // 기본 생성자로 생성된 bean
		Param param = ctx.getBean("Param", Param.class);
		param.setSearch(search);
		param.setSearchText(searchText);
		int totalCount = mapper.selectSearchCount(param);
		boardList.initMvcBoardList(pageSize, totalCount, currentPage);
		
		param.setStartNo(boardList.getStartNo());
		param.setEndNo(boardList.getEndNo());
		boardList.setBoardList(mapper.selectSearchList(param));
		
		System.out.println(boardList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("Param", param);	
		
		return "list";
	}
	
	@RequestMapping(value="/checkJumin", method=RequestMethod.GET)
	public @ResponseBody int checkJumin(HttpServletRequest request, Model model){
		System.out.println("컨트롤러의 checkJumin() 메소드 실행");
		String jumin_nof = request.getParameter("jumin_nof");
		String jumin_nob = request.getParameter("jumin_nob");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("jumin_nof", jumin_nof);
		hmap.put("jumin_nob", jumin_nob);
		int check = mapper.checkJumin(hmap);
		return check;
	}
	@RequestMapping(value="/UpdateCheckJumin", method=RequestMethod.GET)
	public @ResponseBody int UpdateCheckJumin(HttpServletRequest request, Model model, JuminParam juminParam){
		System.out.println("컨트롤러의 checkJumin() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		int check = mapper.UpdateCheckJumin(juminParam);
		return check;
	}
	
	
	@RequestMapping(value = "/dynamicSearch")
	public String dynamicSearch(HttpServletRequest request , Model model, DynamicParam dynamicParam) {
		System.out.println("컨트롤러의 dynamicSearch() 메소드 실행");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		int pageSize = 5;
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) { }
		
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationCTX.xml");
		BoardList boardList = ctx.getBean("BoardList", BoardList.class); // 기본 생성자로 생성된 bean
		int totalCount = mapper.selectDynamicSearchCount(dynamicParam);
		boardList.initMvcBoardList(pageSize, totalCount, currentPage);

//		System.out.println(dynamicParam);
//		System.out.println(boardList);
		
		dynamicParam.setStartNo(boardList.getStartNo());
		dynamicParam.setEndNo(boardList.getEndNo());
		boardList.setBoardList(mapper.selectDynamicSearchList(dynamicParam));
		
		System.out.println(boardList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("dynamicParam", dynamicParam);	
		
		return "list";
	}
	
	
	
}
