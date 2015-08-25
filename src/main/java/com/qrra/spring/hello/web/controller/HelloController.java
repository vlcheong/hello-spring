package com.qrra.spring.hello.web.controller;

import javax.servlet.http.HttpServletRequest;

import com.qrra.spring.hello.model.Request;
import com.qrra.spring.hello.model.Response;
import com.qrra.spring.hello.service.HelloService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {

    private static final Logger LOG = LoggerFactory.getLogger(HelloController.class);

    private final HelloService helloService;

    @Autowired
    public HelloController(final HelloService helloService) {
        this.helloService = helloService;
    }

    @RequestMapping(value = "/greeting", method = RequestMethod.POST)
    @ResponseBody
    public Response greeting(
        @RequestParam(name = "guestName", required = false, defaultValue = "Guest") String guestName) {
        LOG.info("RequestParam - guestName: {}", guestName);
        return helloService.getGreeting(guestName);
    }

    @RequestMapping(value = "/{guestName}", method = RequestMethod.GET)
    public String getPage(@PathVariable("guestName") String guestName, ModelMap model) {
        LOG.info("PathVariable - guestName: {}", guestName);
        model.addAttribute("response", helloService.getGreeting(guestName));
        return "page";
    }

    @RequestMapping(value = "/greeting", method = RequestMethod.GET)
    @ResponseBody
    public Response greeting(Request request) {
        LOG.info("ResponseBody - request: {}", request);
        return helloService.getGreeting(request.getGuestName());
    }

    @RequestMapping(value = "/page", method = RequestMethod.GET)
    public String getPage(HttpServletRequest request) {
        final String guestName = request.getParameter("guestName");
        LOG.info("HttpServletRequest - guestName: {}", guestName);
        request.setAttribute("response", helloService.getGreeting(guestName));
        return "page";
    }
}