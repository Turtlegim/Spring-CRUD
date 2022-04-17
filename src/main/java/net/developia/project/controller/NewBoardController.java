package net.developia.project.controller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;
import net.developia.project.dto.BoardDTO;
import net.developia.project.dto.NewBoardDTO;
import net.developia.project.service.NewBoardService;

@Log4j
@Controller
public class NewBoardController {

	private NewBoardService newboardService;

	public NewBoardController(NewBoardService newboardService) {
		this.newboardService = newboardService;
	}
	

	@GetMapping("/main")
	public String list(Model model) throws Exception{
		try {
			List<NewBoardDTO> list = newboardService.getNewBoardList(); 
			model.addAttribute("list",list); 
			return "board.main";  
		}catch (Exception e) {
			model.addAttribute("msg","list 출력 에러");
			model.addAttribute("url","index"); 
			return "result";
		}
	}
	
	@GetMapping("/newinsert")
	public String insertBoard() {
		return "board.newinsert";
	}	
	
	@PostMapping("/newinsert")
	public String insertBoard(@ModelAttribute NewBoardDTO newboardDTO,
		Model model) {
		
		log.info(newboardDTO.toString());
		try {
			newboardService.insertNewBoard(newboardDTO);
			return "redirect:../project/main/"; 
		} catch (Exception e) {
			model.addAttribute("msg", "입력 에러");
			model.addAttribute("url", "javascript:history.back();");
			return "result";
		}
	}
	
}
