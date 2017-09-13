package com.qrra.spring.hello.service;

import com.qrra.spring.hello.model.Response;

import org.springframework.stereotype.Service;

import java.util.Random;

import static org.apache.commons.lang3.StringUtils.defaultIfBlank;

@Service("helloService")
public class HelloService {

    public static final String[] GREET = new String[] {
        "Hello",
        "Hi",
        "Hey",
        "Olá",
        "Hallo",
        "Bonjour",
        "こんにちは",
        "안녕하세요",
        "Ciao",
        "你好",
        "Hej",
        "Aloha",
        "你好冇",
        "Xin chào"
    };

    private static final Random RANDOM = new Random();

    private static final int MIN = 0;

    private static final int MAX = GREET.length - 1;

    public Response getGreeting(String guestName) {
        String greeting =
            GREET[RANDOM.nextInt(MAX - MIN + 1) + MIN] +
            " " +
            defaultIfBlank(guestName, "Guest");
        return new Response(greeting);
    }
}