package com.arduino.controller;

import com.arduino.entity.ArduinoData;
import com.arduino.service.ArduinoDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * Created by 崔建昂
 * on 2019/5/8
 */
@Controller
@RequestMapping("data")
public class ArduinoController {
    @Autowired
    ArduinoDataService arduinoDataService;

    @RequestMapping("set")
    public void insert(String tem){
        System.out.println(tem);
        ArduinoData arduinoData = new ArduinoData();
        arduinoData.setTemparture(tem);
        arduinoData.setAddTime(new Date());
        arduinoDataService.insert(arduinoData);
    }

    @RequestMapping("get")
    @ResponseBody
    public List selectByAddTime(){
        List<ArduinoData> arduinoDataList = arduinoDataService.selctByAddTime();
        System.out.println(arduinoDataList);
        return arduinoDataList;
    }
}
