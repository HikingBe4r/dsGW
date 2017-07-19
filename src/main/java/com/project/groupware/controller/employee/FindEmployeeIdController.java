package com.project.groupware.controller.employee;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.domain.EmployeeVO;
import com.project.groupware.service.EmployeeService;

@Controller
public class FindEmployeeIdController {
	@Autowired
	private EmployeeService service;

	@RequestMapping(value = "/findEmpId.do", method = RequestMethod.POST)
	public ModelAndView findId(@RequestParam(value = "name1") String name,
			@RequestParam(value = "email1") String email) {
		ModelAndView mv = new ModelAndView();
		EmployeeVO employee = new EmployeeVO();
		employee.setName(name);
		employee.setEmail(email);
		employee = service.findEmployeeId(employee);
		if (employee != null) {
			
			String from = "dsgroupware43@naver.com"; // 메일 보내는 사람
			String to = employee.getEmail(); // 메일 보낼사람
			String cc = ""; // 참조
			String subject = "사원 번호 조회";// 제목
			String content = "사원번호 : " + employee.getId() + " 입니다.";// 내용

			if (from.trim().equals("")) {
				System.out.println("보내는 사람을 입력하지 않았습니다.");
			} else if (to.trim().equals("")) {
				System.out.println("받는 사람을 입력하지 않았습니다.");
			} else {
				try {
					SendMail mt = new SendMail();

					// 메일보내기
					mt.sendEmail(from, to, cc, subject, content);
					System.out.println("메일 전송에 성공하였습니다.");
				} catch (MessagingException me) {
					System.out.println("메일 전송에 실패하였습니다.");
					System.out.println("실패 이유 : " + me.getMessage());
				} catch (Exception e) {
					System.out.println("메일 전송에 실패하였습니다.");
					System.out.println("실패 이유 : " + e.getMessage());
				}
			}
			
			mv.setViewName("login/findEmpId");
		} else {
			mv.setViewName("login/findFail");
		}
		return mv;
	}

	@RequestMapping(value = "/findEmpPwd.do", method = RequestMethod.POST)
	public ModelAndView findPwd(@RequestParam(value = "name2") String name,
			@RequestParam(value = "email2") String email, @RequestParam(value = "employeeId2") String employeeId) {
		ModelAndView mv = new ModelAndView();
		EmployeeVO employee = new EmployeeVO();
		employee.setName(name);
		employee.setEmail(email);
		employee = service.findEmployeeId(employee);
		if (employee.getId().equals(employeeId)) {
			
			String from = "dsgroupware43@naver.com"; // 메일 보내는 사람
			String to = employee.getEmail(); // 메일 보낼사람
			String cc = ""; // 참조
			String subject = "비밀번호 변경 인증 메일";// 제목
			String num = "";
			String content = "";
			if (from.trim().equals("")) {
				System.out.println("보내는 사람을 입력하지 않았습니다.");
			} else if (to.trim().equals("")) {
				System.out.println("받는 사람을 입력하지 않았습니다.");
			} else {
				try {
					SendMail mt = new SendMail();
					num = mt.RandomNum();//인증번호 생성
					content = "인증번호 : " + num + " 입니다.";// 내용
					// 메일보내기
					mt.sendEmail(from, to, cc, subject, content);
					System.out.println("메일 전송에 성공하였습니다.");
				} catch (MessagingException me) {
					System.out.println("메일 전송에 실패하였습니다.");
					System.out.println("실패 이유 : " + me.getMessage());
				} catch (Exception e) {
					System.out.println("메일 전송에 실패하였습니다.");
					System.out.println("실패 이유 : " + e.getMessage());
				}
			}
			
			// 인증번호 확인 화면 전환
			mv.addObject("findEmployee", employee);
			mv.addObject("authNum", num);
			mv.setViewName("login/findEmpPwd");
		} else {
			mv.setViewName("login/findFail");
		}
		return mv;
	}
}