package com.arduino.service.impl;

import com.arduino.dao.ArduinoDataDAO;
import com.arduino.entity.ArduinoData;
import com.arduino.service.ArduinoDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 崔建昂
 * on 2019/5/10
 */
@Service
public class ArduinoDataServiceImpl implements ArduinoDataService {
    @Autowired
    ArduinoDataDAO arduinoDataDAO;

    @Override
    public List<ArduinoData> selectAll() {
        return arduinoDataDAO.selectAll();
    }

    @Override
    public void insert(ArduinoData arduinoData) {
        arduinoDataDAO.insert(arduinoData);
    }

    @Override
    public List<ArduinoData> selctByAddTime() {
        return arduinoDataDAO.selectByAddTime();
    }
}
