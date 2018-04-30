package br.com.viasoft.modulos.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController("teste")
public class TesteController {

    @GetMapping
    public String get() {
        return "JAVA 10";
    }
}
