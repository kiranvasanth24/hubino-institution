package com.spring.hubinoinstitution.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.hubinoinstitution.model.Training;
import com.spring.hubinoinstitution.model.Users;
import com.spring.hubinoinstitution.repo.TrainingRepo;
import com.spring.hubinoinstitution.repo.UserRepo;

@Service
public class TrainingService {

	@Autowired
	private TrainingRepo trainingRepo;

	@Autowired
	private UserRepo userRepo;
	private Users user;
	public ModelAndView saveTrainingDetails(Training training, String username) {
		// get user id by username
		 user = userRepo.findByUserName(username);
		training.setUserId(user.getUserId());
		training.setCourse_img(getImageUrl(training.getCourse()));
		training.setReference(getRsferenceUrl(training.getCourse()));
		// update status
		training.setIs_deleted("0");
		// if(training.getTrainingId()==null)
		trainingRepo.save(training);
		/*
		 * ModelAndView modelAndView = new ModelAndView("training-list"); List<Training>
		 * trainingList = trainingRepo.findByUserId(user.getUserId());
		 * modelAndView.addObject("list", trainingList); return modelAndView;
		 */
		return sendTrainingList(String.valueOf(training.getTrainingId()));
	}
	
	public ModelAndView sendTrainingList(String id)
	{
		List<Training> tempList=new ArrayList<>();
		List<Training> trainingList = trainingRepo.findByUserId(user.getUserId());
		for(int index = 0;index < trainingList.size(); index++) {
			if(trainingList.get(index).getIs_deleted().equals("0")) {
				tempList.add(trainingList.get(index));
			}
		}
		ModelAndView modelAndView = new ModelAndView("training-list");
		modelAndView.addObject("list", tempList);
		return modelAndView;
	}

	public String getImageUrl(String course) {
		switch (course) {
		case "java":
			return "https://icons.iconarchive.com/icons/tatice/cristal-intense/256/Java-icon.png";
		case "python":
			return "https://icons.iconarchive.com/icons/cornmanthe3rd/plex/256/Other-python-icon.png";
		case "cpp":
			return "https://icons.iconarchive.com/icons/icons8/windows-8/256/Files-Cpp-icon.png";
		case "scala":
			return "https://icons.iconarchive.com/icons/papirus-team/papirus-mimetypes/256/text-x-scala-icon.png";
		default:
			return "https://icons.iconarchive.com/icons/icons8/ios7/256/Science-Classroom-icon.png";
		}
	}

	public String getRsferenceUrl(String course) {
		switch (course) {
		case "java":
			return "https://en.wikipedia.org/wiki/Java_(programming_language)";
		case "python":
			return "https://en.wikipedia.org/wiki/Python_(programming_language)";
		case "cpp":
			return "https://en.wikipedia.org/wiki/CPP";
		case "scala":
			return "https://en.wikipedia.org/wiki/Scala_(programming_language)";
		default:
			return "https://en.wikipedia.org/wiki/Programming_language";
		}
	}

	public Optional<Training> editTrainingDetails(String id) {
		return trainingRepo.findById(Integer.parseInt(id));
	}

	public void deleteTrainingDetails(String id) {
		trainingRepo.deleteTrainingDetails(Integer.parseInt(id));
	}

}
