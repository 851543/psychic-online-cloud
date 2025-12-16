package com.psychic.media.api;

import com.psychic.base.model.PageParams;
import com.psychic.base.model.PageResult;
import com.psychic.media.model.dto.QueryMediaParamsDto;
import com.psychic.media.model.dto.UploadFileParamsDto;
import com.psychic.media.model.dto.UploadFileResultDto;
import com.psychic.media.model.po.MediaFiles;
import com.psychic.media.service.MediaFileService;
import com.psychic.media.util.SecurityUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * @description 媒资文件管理接口
 * @author Mr.M
 * @date 2022/9/6 11:29
 * @version 1.0
 */
 @Api(value = "媒资文件管理接口",tags = "媒资文件管理接口")
 @RestController
public class MediaFilesController {


  @Autowired
  MediaFileService mediaFileService;


 @ApiOperation("媒资列表查询接口")
 @PostMapping("/files")
 public PageResult<MediaFiles> list(PageParams pageParams, @RequestBody QueryMediaParamsDto queryMediaParamsDto){
  SecurityUtil.XcUser user = SecurityUtil.getUser();
  String companyId = user.getCompanyId();
  return mediaFileService.queryMediaFiels(Long.valueOf(companyId),pageParams,queryMediaParamsDto);

 }

    @ApiOperation("上传文件")
    @RequestMapping(value = "/upload/coursefile",consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    @ResponseBody
    public UploadFileResultDto upload(@RequestPart("filedata") MultipartFile filedata,@RequestParam(value = "folder",required=false) String folder,@RequestParam(value = "objectName",required=false) String objectName,@RequestParam(value = "companyId",required=false) String companyId) throws IOException {
        if (StringUtils.isEmpty(companyId)){
            SecurityUtil.XcUser user = SecurityUtil.getUser();
            companyId = user.getCompanyId();
        }

        UploadFileParamsDto uploadFileParamsDto = new UploadFileParamsDto();
        //文件大小
        uploadFileParamsDto.setFileSize(filedata.getSize());
        //图片
        uploadFileParamsDto.setFileType("001001");
        //文件名称
        uploadFileParamsDto.setFilename(filedata.getOriginalFilename());//文件名称
        //文件大小
        long fileSize = filedata.getSize();
        uploadFileParamsDto.setFileSize(fileSize);
        //创建临时文件
        File tempFile = File.createTempFile("minio", "temp");
        //上传的文件拷贝到临时文件
        filedata.transferTo(tempFile);
        //文件路径
        String absolutePath = tempFile.getAbsolutePath();
        //上传文件
        UploadFileResultDto uploadFileResultDto = mediaFileService.uploadFile(Long.valueOf(companyId), uploadFileParamsDto, absolutePath,objectName);

        return uploadFileResultDto;
    }

}
