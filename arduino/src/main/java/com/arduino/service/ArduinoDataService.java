package com.arduino.service;

import com.arduino.entity.ArduinoData;

import java.util.List;

public interface ArduinoDataService {
    //查询全部
    List<ArduinoData> selectAll();
    //添加
    void insert(ArduinoData arduinoData);
    //查询最新的五条数据
    List<ArduinoData> selctByAddTime();
}
