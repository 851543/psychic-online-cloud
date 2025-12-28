package com.psychic.teaching.api;

import com.psychic.base.model.RestResponse;
import com.psychic.teaching.model.dto.CodeDTO;
import com.psychic.teaching.model.vo.CodeVO;
import com.psychic.teaching.service.CodeService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/code")
public class CodeController {

    @Autowired
    CodeService codeService;

    @PostMapping("/run")
    public RestResponse<CodeVO> run(@RequestBody CodeDTO codeDTO) {
        if (codeDTO == null || StringUtils.isEmpty(codeDTO.getLanguage()) || StringUtils.isEmpty(codeDTO.getCode())) {
            return RestResponse.validfail("language/code 不能为空");
        }
        if ("java".equals(codeDTO.getLanguage())) {
            return RestResponse.success(codeService.runJava(codeDTO.getCode()));
        }
        if ("python".equals(codeDTO.getLanguage())) {
            return RestResponse.success(codeService.runPython(codeDTO.getCode()));
        }
        return RestResponse.validfail("暂不支持的 language: " + codeDTO.getLanguage());
    }
}
