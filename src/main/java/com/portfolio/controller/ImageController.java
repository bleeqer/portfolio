package com.portfolio.controller;

import com.portfolio.commons.util.UploadFileUtils;
import com.portfolio.domain.ImageVO;
import com.portfolio.mapper.ImageMapper;
import com.portfolio.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("file")
public class ImageController {

    @Autowired
    ImageService imageService;

    @PostMapping(value="upload")
    public ResponseEntity<Object> uploadFile(MultipartHttpServletRequest mtfRequest) {

        List<String> attachedImgs;

        // 파일(들)을 지정된 경로에 저장 및 경로 리스트 반환
        try {
            attachedImgs = UploadFileUtils.uploadFile(mtfRequest);

        } catch (IOException e) {

            return new ResponseEntity<>(e.getMessage(), HttpStatus.OK);

        }

        // Image DTO 리스트와 함께 OK status response code 반환
        return new ResponseEntity<>(attachedImgs, HttpStatus.OK);

    }

}
