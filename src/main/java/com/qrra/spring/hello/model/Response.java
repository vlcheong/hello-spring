package com.qrra.spring.hello.model;

import java.util.Date;

public class Response {

    private final String greeting;

    public Response(final String greeting) {
        this.greeting = greeting;
    }

    public String getGreeting() {
        return greeting;
    }

    public String getTime() {
        return String.format("%1$tH:%1$tM:%1$tS", new Date());
    }

    public String getDate() {
        return String.format("%1$tY-%1$tm-%1$td", new Date());
    }
}