package com.project.myapp.myb.disease;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class DiseaseController {

	@Autowired
	IDiseaseService diseaseService;
}
 