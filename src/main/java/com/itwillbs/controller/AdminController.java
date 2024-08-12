package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.AdminService;
import com.itwillbs.service.MemberService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Inject
	private AdminService adminService ;
	
	@GetMapping("/member/register")
    public String showRegisterPage() {
        return "/admin/member/register";
    }
	
    @PostMapping("/member/registerPro")
    public String registerMember(MemberDTO memberDTO) {
    	
    	System.out.println(memberDTO);
    	
    	adminService.registerMember(memberDTO);

        return "redirect:/admin/index";
    }
    
    @GetMapping("/member/memberlist")
	public String tables(Model model) {
		
		List<MemberDTO> memberList = adminService.getMemberList();
    	model.addAttribute("memberList", memberList);
		
		return "/admin/member/memberlist";
	}
    
    @GetMapping("/member/info")
    public String info(MemberDTO memberDTO, Model model) {
		
		MemberDTO memberDTO2 = adminService.getMemberInfo(memberDTO.getMember_id());
		
		model.addAttribute("memberDTO", memberDTO2);
		
		
        return "/admin/member/info";
    }
    
    @GetMapping("/member/update")
    public String update(MemberDTO memberDTO, Model model) {
    	
    	
    	
		MemberDTO memberDTO2 = adminService.getMemberInfo(memberDTO.getMember_id());
		
		List<MemberDTO> gradeList = adminService.getGradeList();
		System.out.println(gradeList);
		
		model.addAttribute("memberDTO", memberDTO2);
		model.addAttribute("gradeList", gradeList);
		
        return "/admin/member/update";
    }
    
    @PostMapping("/member/updatePro")
	public String updatePro(MemberDTO memberDTO) {
		System.out.println("MemberController updatePro()");
		
		
		adminService.updateMember(memberDTO);
		return "redirect:/admin/member/tables";
	}
    
    
    
        
	@GetMapping("/index")
	public String index() {
		
		return "/admin/index";
	}
	
	@GetMapping("/index2")
	public String index2() {
		
		return "/admin/index2";
	}
	
	@GetMapping("/tables")
	public String tables() {
		
		return "/admin/tables";
	}
	
	@GetMapping("/login")
	public String login() {
		
		return "/admin/login";
	}
	
	@GetMapping("/404")
	public String e404() {
		
		return "/admin/404";
	}
	
	@GetMapping("/blank")
	public String blank() {
		
		return "/admin/blank";
	}
	
	@GetMapping("/buttons")
	public String buttons() {
		
		return "/admin/buttons";
	}
	
	@GetMapping("/cards")
	public String cards() {
		
		return "/admin/cards";
	}
	
	@GetMapping("/charts")
	public String charts() {
		
		return "/admin/charts";
	}
	
	@GetMapping("/forgot-password")
	public String forgotpassword() {
		
		return "/admin/forgot-password";
	}
	
		
	@GetMapping("/register")
	public String register() {
		
		return "/admin/register";
	}
	
	@GetMapping("/utilities-animation")
	public String utilitiesanimation() {
		
		return "/admin/utilities-animation";
	}
	
	@GetMapping("/utilities-border")
	public String utilitiesborder() {
		
		return "/admin/utilities-border";
	}
	
	@GetMapping("/utilities-color")
	public String utilitiescolor() {
		
		return "/admin/utilities-color";
	}
	
	@GetMapping("/utilities-other")
	public String utilitiesother() {
		
		return "/admin/utilities-other";
	}

}
