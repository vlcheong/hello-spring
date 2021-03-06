package com.qrra.spring.hello.model;

import java.io.Serializable;
import java.util.Date;

public class Response implements Serializable {

    private static final long serialVersionUID = 1L;

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