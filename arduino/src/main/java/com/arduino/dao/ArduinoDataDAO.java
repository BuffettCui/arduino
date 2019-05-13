package com.arduino.dao;

import com.arduino.entity.ArduinoData;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ArduinoDataDAO extends Mapper<ArduinoData> {
    //查询最新
    List<ArduinoData> selectByAddTime();
}
