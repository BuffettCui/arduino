package com.arduino.entity;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Table;
import java.util.Date;

/**
 * Created by 崔建昂
 * on 2019/5/4
 */
@Data
@Table(name = "data")
public class ArduinoData {
    private String id;
    private String temparture;
    @JSONField(format = "HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date addTime;
}
