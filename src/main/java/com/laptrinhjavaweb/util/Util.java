package com.laptrinhjavaweb.util;

import org.springframework.stereotype.Component;

@Component
public class Util {
	
	public String takeId(String str) {
		String[] tu = str.split(" ");
        String value = "";
        for (String s : tu) {
            if (!s.equals("") && !s.equals(null)) {
                value = value.concat(String.valueOf(s.charAt(0)));
            }
        }
		return value;
	}
	
}
