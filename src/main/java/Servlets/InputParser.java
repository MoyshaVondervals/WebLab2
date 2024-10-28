package Servlets;



import jakarta.servlet.http.HttpServletRequest;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class InputParser {

    public Map<String, Number> parse(HttpServletRequest request) throws IOException {
        Map<String, Number> map = new HashMap<>();

        StringBuilder jsonData = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonData.append(line);
        }



        return map;
    }
}
