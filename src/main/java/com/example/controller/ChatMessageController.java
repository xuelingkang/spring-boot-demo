package com.example.controller;

import com.example.service.IChatMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ChatMessageController {

    @Autowired
    private IChatMessageService chatMessageService;

}
