package com.baidu.controller;

import com.baidu.domain.Upload;
import com.baidu.services.FileServices;
import com.baidu.util.UpFile;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by null on 2017/11/23.
 */
@Controller
@RequestMapping("file")
public class FileController {
    @Resource
    private FileServices services;

    @RequestMapping("imageUpload")
    public void imageUpload(HttpServletRequest request, HttpServletResponse response) {
        String DirectoryName = "upload/";
        try {
            String fileName = UpFile.ckeditor(request, response, DirectoryName);
            services.addFile(new Upload(fileName));
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
