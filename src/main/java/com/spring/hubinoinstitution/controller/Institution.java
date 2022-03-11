package com.spring.hubinoinstitution.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.hubinoinstitution.model.Training;
import com.spring.hubinoinstitution.model.Users;
import com.spring.hubinoinstitution.service.TrainingService;
import com.spring.hubinoinstitution.service.UserService;

@Controller
public class Institution {
	@Autowired
	private UserService userService;

	@Autowired
	private TrainingService trainingService;

	private String USERNAME;

	@GetMapping("/")
	public String registerUser() {
		return "welcome";

	}

	@GetMapping("/register_page")
	public String showRegistrationForm(Model model) {
		model.addAttribute("user", new Users());

		return "register";
	}

	@GetMapping("/login_page")
	public String showLoginForm(Model model) {
		model.addAttribute("user", new Users());

		return "login";
	}

	@GetMapping("/register_user")
	public String registerUser(@RequestParam(name = "username") String username,
			@RequestParam(name = "password") String password, @RequestParam(name = "c_password") String c_password,
			ModelMap model) {
		model.put("errorMsg", "some issue occured with registration");
		Users users = new Users();
		users.setUserName(username);
		users.setPassword(password);
		String str = userService.registerUser(users);
		if (str == "success")
			return "login";
		else
			return "failure";
	}

	@GetMapping("/login_user")
	public ModelAndView loginUser(@RequestParam(name = "username") String username,
			@RequestParam(name = "password") String password) {
		String value = userService.loginUser(username, password);
		if (value.equals("failure")) {
			ModelAndView modelAndView = new ModelAndView("login");
			return modelAndView;
		} else {
			USERNAME = username;
			ModelAndView modelAndView = new ModelAndView("training-list");
			modelAndView.addObject("username", USERNAME);
			return modelAndView;
		}
	}
	@GetMapping("/add_user")
	public String addUser() {
		return "training";
	}
	
	@GetMapping("/training")
	public ModelAndView training(@RequestParam(name = "id") String id, @RequestParam(name = "course") String course,
			@RequestParam(name = "trainer") String trainer, @RequestParam(name = "start_date") String start_date,
			@RequestParam(name = "end_date") String end_date, @RequestParam(name = "desc") String desc,
			@RequestParam(name = "duration") String duration) {
		Training training = new Training();
		if (!id.equals("")) {
			training.setTrainingId(Integer.parseInt(id));
		}
		training.setCourse(course);
		training.setTrainer_name(trainer);
		training.setStart_date(start_date);
		training.setEnd_date(end_date);
		training.setDescription(desc);
		training.setDuration(duration);
		return trainingService.saveTrainingDetails(training, USERNAME);
	}

	@GetMapping("/edit")
	public ModelAndView editTrainingDetails(@RequestParam(name = "id") String id) {
		Training trainingInfo = trainingService.editTrainingDetails(id).get();
		ModelAndView modelAndView = new ModelAndView("editform");
		modelAndView.addObject("trainingInfo", trainingInfo);
		return modelAndView;
	}

	@GetMapping("/delete")
	public ModelAndView deleteTrainingDetails(@RequestParam(name = "id") String id) {
		trainingService.deleteTrainingDetails(id);
		return trainingService.sendTrainingList(id);
	}
}
