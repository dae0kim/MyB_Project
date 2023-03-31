package com.project.myapp.myb.disease;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DiseaseController {

	@Autowired
	IDiseaseService diseaseService;
	
	
}
 