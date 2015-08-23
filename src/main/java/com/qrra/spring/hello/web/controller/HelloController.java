package com.qrra.spring.hello.web.controller;

import com.qrra.spring.hello.model.Response;
import com.qrra.spring.hello.service.HelloService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {

    private final HelloService helloService;

    @Autowired
    public HelloController(final HelloService helloService) {
        this.helloService = helloService;
    }

    @RequestMapping(value = "/greeting", method = RequestMethod.POST)
    @ResponseBody
    public Response greeting(
        @RequestParam(name = "guestName", required = false, defaultValue = "Guest") String guestName) {
        return helloService.getGreeting(guestName);
    }
}