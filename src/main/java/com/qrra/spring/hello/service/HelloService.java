package com.qrra.spring.hello.service;

import com.qrra.spring.hello.model.Response;

import org.springframework.stereotype.Service;

import java.util.Random;

@Service
public class HelloService {

    public static final String[] GREET = new String[] {
        "Hello",
        "Hi",
        "Hey",
        "Ola",
        "Hallo",
        "Bonjour",
        "Konnichiwa",
        "AnnyeongHaseyo"
    };

    private static final Random RANDOM = new Random();

    private static final int MIN = 0;

    private static final int MAX = GREET.length - 1;

    public Response getGreeting(String guestName) {
        String greeting = GREET[RANDOM.nextInt(MAX - MIN + 1) + MIN] + " " + guestName;
        return new Response(greeting);
    }
}