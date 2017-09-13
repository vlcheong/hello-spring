package com.qrra.spring.hello.web.controller;

import com.qrra.spring.hello.model.Request;
import com.qrra.spring.hello.model.Response;
import com.qrra.spring.hello.service.HelloService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

@Controller
public class HelloController {

    private static final Logger LOG = LoggerFactory.getLogger(HelloController.class);

    private final HelloService helloService;

    @Inject
    public HelloController(final HelloService helloService) {
        this.helloService = helloService;
    }

    @RequestMapping(value = "/guest-greeting", method = RequestMethod.POST)
    @ResponseBody
    public Response greeting(@RequestParam(name = "guestName", required = false, defaultValue = "Guest") String guestName) {
        LOG.info("RequestParam - guestName: {}", guestName);
        return helloService.getGreeting(guestName);
    }

    @RequestMapping(value = "/greeting", method = RequestMethod.POST)
    @ResponseBody
    public Response postGreeting(Request request) {
        LOG.info("ResponseBody - post request: {}", request);
        return helloService.getGreeting(request.getGuestName());
    }

    @RequestMapping(value = "/greeting", method = RequestMethod.GET)
    @ResponseBody
    public Response getGreeting(Request request) {
        LOG.info("ResponseBody - get request: {}", request);
        return helloService.getGreeting(request.getGuestName());
    }

    @RequestMapping(value = "/{guestName}", method = RequestMethod.GET)
    public String getPage(@PathVariable("guestName") String guestName, ModelMap model) {
        LOG.info("PathVariable - guestName: {}", guestName);
        model.addAttribute("response", helloService.getGreeting(guestName));
        return "page";
    }

    @RequestMapping(value = "/page", method = RequestMethod.GET)
    public String getPage(HttpServletRequest request) {
        final String guestName = request.getParameter("guestName");
        LOG.info("HttpServletRequest - guestName: {}", guestName);
        request.setAttribute("response", helloService.getGreeting(guestName));
        return "page";
    }
}