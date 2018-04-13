package com.student.report.service.impl;

import com.student.report.entity.Dictionary;
import com.student.report.mapper.DictionaryMapper;
import com.student.report.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 */
@Service
public class DictionaryServiceImpl implements DictionaryService {

    @Autowired
    private DictionaryMapper dictionaryMapper;

    @Override
    public List<Dictionary> queryByDicName(String dicName) {
        Example example = new Example(Dictionary.class);
        example.createCriteria().andEqualTo("dicName", dicName);
        example.setOrderByClause("dic_key desc");
        return dictionaryMapper.selectByExample(example);
    }
}
