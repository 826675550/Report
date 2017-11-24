package com.baidu.repository;

import com.baidu.domain.Upload;
import org.springframework.stereotype.Repository;

/**
 * Created by null on 2017/11/23.
 */
@Repository
public interface FileRepository {
    int addFile(Upload upload);

}
