package com.xzixi.demo.controller;

import com.xzixi.demo.exception.ProjectException;
import com.xzixi.demo.model.po.Attachment;
import com.xzixi.demo.model.vo.AttachmentVO;
import com.xzixi.demo.model.vo.ResultVO;
import com.xzixi.demo.service.IAttachmentService;
import com.xzixi.demo.util.ModelUtil;
import com.xzixi.sftp.pool.Sftp;
import com.xzixi.sftp.pool.SftpPool;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotNull;
import java.io.IOException;
import java.util.Calendar;

import static com.xzixi.demo.model.vo.ResultVO.SUCCESS;

@RestController
@RequestMapping(value = "/file", produces = "application/json; charset=UTF-8")
@Api(tags = "文件")
@Validated
public class FileController {

    @Autowired
    private IAttachmentService attachmentService;
    @Autowired
    private SftpPool sftpPool;
    @Value("${attachment.save-dir}")
    private String saveDir;
    @Value("${attachment.address-prefix}")
    private String addressPrefix;
    @Value("${attachment.file-separator}")
    private String fileSeparator;

    @PostMapping("/{type}/{rename}")
    @ApiOperation(value = "上传文件")
    public ResultVO<AttachmentVO> upload(@RequestParam("file") @ApiParam(value = "文件", required = true) MultipartFile file,
                                         @PathVariable("type") @NotNull(message = "文件类型不能为空") @ApiParam(value = "文件类型", example = "demo", required = true) String type,
                                         @PathVariable("rename") @NotNull(message = "是否重命名不能为空") @ApiParam(value = "是否重命名", allowableValues = "1,0", defaultValue = "1", required = true) String rename) {
        String name = file.getOriginalFilename();
        if (rename.equals("1")) { // 重命名
            if (name!=null && name.contains(".")) {
                String[] arr = name.split("\\.");
                String exp = arr[arr.length-1];
                name = System.currentTimeMillis()+"."+exp;
            } else {
                name = String.valueOf(System.currentTimeMillis());
            }
        }
        Calendar calendar = Calendar.getInstance();
        // 年
        String year = String.valueOf(calendar.get(Calendar.YEAR));
        // 月
        String month = String.valueOf(calendar.get(Calendar.MONTH)+1);
        // 目录相对路径
        String relativeDir = type+fileSeparator+year+fileSeparator+month;
        // 目录绝对路径
        String absoluteDir = saveDir+(saveDir.endsWith(fileSeparator)? "": fileSeparator)+relativeDir;
        Sftp sftp = null;
        try {
            sftp = sftpPool.borrowObject();
            // 上传到ftp
            sftp.upload(absoluteDir, name, file.getInputStream());
        } catch (IOException e) {
            throw new ProjectException("保存文件时出错", e);
        } catch (Exception e) {
            throw new ProjectException("获取sftp连接出错！", e);
        } finally {
            if (sftp!=null) {
                sftpPool.returnObject(sftp);
            }
        }
        // 访问路径
        String address = addressPrefix+(addressPrefix.endsWith(fileSeparator)? "": fileSeparator)+relativeDir+fileSeparator+name;
        long now = System.currentTimeMillis();
        Attachment attachment = new Attachment();
        attachment.setAttachmentName(file.getOriginalFilename());
        attachment.setAttachmentPath(absoluteDir+fileSeparator+name);
        attachment.setAttachmentAddress(address);
        attachment.setCreateTime(now);
        attachmentService.save(attachment);
        AttachmentVO attachmentVO = (AttachmentVO) ModelUtil.copy(attachment, new ModelUtil.Mapping(Attachment.class, AttachmentVO.class, "attachmentPath"));
        return new ResultVO<>(SUCCESS, "", attachmentVO);
    }

}
