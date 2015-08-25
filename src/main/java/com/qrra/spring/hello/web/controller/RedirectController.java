package com.qrra.spring.hello.web.controller;

import com.qrra.spring.hello.model.Request;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RedirectController {

    private static final Logger LOG = LoggerFactory.getLogger(RedirectController.class);

    @RequestMapping(value = "/redirect", method = RequestMethod.GET)
    public String redirect(String guestName, RedirectAttributes redirectAttrs) {
        LOG.info("redirect - guestName: {}", guestName);
        Request request = new Request();
        request.setGuestName(guestName);
        redirectAttrs.addFlashAttribute("request", request);
        return "redirect:/greeting";
    }
}