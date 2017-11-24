package com.baidu.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by null on 2017/11/23.
 */
public class DateUtil {


    public String formatDate() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String str = sdf.format(date);
        return str;
    }
}
