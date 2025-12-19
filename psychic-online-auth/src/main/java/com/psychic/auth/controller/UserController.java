package com.psychic.auth.controller;

import com.psychic.ucenter.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/upload/pic/{id}",consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String pic(@PathVariable("id") String id,@RequestPart("file") MultipartFile file){
        return userService.pic(id,file);
    }

    @GetMapping("/company/{companyId}")
    public String[] getUserIds(@PathVariable String companyId){
        return userService.getUserIds(companyId);
    }
}
