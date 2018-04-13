package com.student.report.service;

import com.student.report.entity.Dictionary;

import java.util.List;

/**
 */
public interface DictionaryService {

    List<Dictionary> queryByDicName(String dicName);
}
