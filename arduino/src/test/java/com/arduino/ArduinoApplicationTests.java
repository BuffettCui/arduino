package com.arduino;

import com.arduino.dao.ArduinoDataDAO;
import com.arduino.entity.ArduinoData;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ArduinoApplicationTests {
@Autowired
    ArduinoDataDAO arduinoDataDAO;
    @Test
    public void contextLoads() {
        List<ArduinoData> arduinoDataList = arduinoDataDAO.selectByAddTime();
        arduinoDataList.forEach(System.out::println);
    }

}
