package com.shused.project.user;

import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserRestController {
	
	@GetMapping("is_duplicate_id")
	public Map<String, Boolean> duplicateId(){
		
	}
}
