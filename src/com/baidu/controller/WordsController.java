package com.baidu.controller;

import com.baidu.domain.Word;
import com.baidu.repository.WordsRepository;
import com.baidu.services.WordsServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by null on 2017/11/23.
 */
@Controller
@RequestMapping("words")
public class WordsController {
    @Resource
    private WordsServices services;


    @ResponseBody
    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public boolean addwords(Integer uid, String title, String context, Integer status) {
        Word word = new Word();
        word.setContext(context);
        word.setStatus(status);
        word.setUid(uid);
        word.setCreateTime(new Date());
        word.setTitle(title);
        word.setBtid(1);
        if (services.addWords(word) > 0) {
            return true;
        } else {
            return false;
        }

    }
    @RequestMapping(value = "getAllWord",method = RequestMethod.POST)
    public List getAllWord(){


        return null;
    }


}
