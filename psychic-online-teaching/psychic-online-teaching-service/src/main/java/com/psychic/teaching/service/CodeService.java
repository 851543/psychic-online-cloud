package com.psychic.teaching.service;

import com.psychic.teaching.model.vo.CodeVO;

public interface CodeService {
    CodeVO runJava(String code);

    CodeVO runPython(String code);
}
