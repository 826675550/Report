package com.baidu.services;

import com.baidu.domain.Upload;
import com.baidu.repository.FileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by null on 2017/11/23.
 */
@Service
public class FileServices {
    @Autowired
    private FileRepository repository;

    public int addFile(Upload upload){
        return repository.addFile(upload);
    }

}
