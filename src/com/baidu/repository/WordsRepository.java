package com.baidu.repository;

import com.baidu.domain.Word;
import org.springframework.stereotype.Repository;

/**
 * Created by null on 2017/11/23.
 */
@Repository
public interface WordsRepository {
    int addWords(Word word);
}
