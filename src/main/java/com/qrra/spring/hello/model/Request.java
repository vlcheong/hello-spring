package com.qrra.spring.hello.model;

import java.io.Serializable;

public class Request implements Serializable {

    private static final long serialVersionUID = 1L;

    private String guestName;

    public String getGuestName() {
        return guestName;
    }

    public void setGuestName(String guestName) {
        this.guestName = guestName;
    }

    @Override
    public String toString() {
        return guestName;
    }
}