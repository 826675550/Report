package com.baidu.services;

import com.baidu.domain.Word;
import com.baidu.repository.WordsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by null on 2017/11/23.
 */
@Service
public class WordsServices {
    @Autowired
    private  WordsRepository repository;


    public int addWords(Word word){
        return repository.addWords(word);
    }


}
