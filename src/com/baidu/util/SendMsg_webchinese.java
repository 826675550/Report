package com.baidu.util;

/**
 * Created by null on 2017/11/7.
 */

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import com.google.gson.*;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
/**
 * 这个checkSumBuilder的参考示例，请在官网上服务器端API上查看，有一个计算checkSum的实例
 */


/**
 * 发送验证码
 *
 * @author liuxuanlin
 */
public class SendMsg_webchinese {
    //发送验证码的请求路径URL
    private static final String
            SERVER_URL = "https://api.netease.im/sms/sendcode.action";
    //网易云信分配的账号，请替换你在管理后台应用下申请的Appkey
    private static final String
            APP_KEY = "43bd7829a0941fda177a8e8c64e0c567";
    //网易云信分配的密钥，请替换你在管理后台应用下申请的appSecret
    private static final String APP_SECRET = "a83067b0db31";
    //随机数
    private static final String NONCE = "123456";
    //短信模板ID
    private static final String TEMPLATEID = "3142024";
    //手机号
    private static final String MOBILE = "13693189078";
    //验证码长度，范围4～10，默认为4
    private static final String CODELEN = "6";

    public static void main(String[] args) throws Exception {
      List<MsgEntiy> msgEntiys=new SendMsg_webchinese().getMsg("");
        System.out.println(msgEntiys);

    }
    private static Gson gson = new Gson();
    private static JsonParser jp = new JsonParser();

    public  List<MsgEntiy> getMsg(String phoneNum) {
        List<MsgEntiy> taskBaseList = new LinkedList<>();
        try {
            //将HttpEntity装换为List<JavaBean>
                //先转为String
                String retSrc =EntityUtils.toString(fun(phoneNum));
                //转为JsonElement
                JsonElement je = jp.parse(retSrc);
                //通过JsonElement转为JsonObject
                JsonObject ja = je.getAsJsonObject();
                //根据queryMemberName 得到JsonArray
                taskBaseList.add(gson.fromJson(je, MsgEntiy.class));

        } catch (Exception e) {
            e.printStackTrace();
        }
        return taskBaseList;
    }
    public String getMsgnum(String phoneNum){
        List<MsgEntiy> list=getMsg(phoneNum);
        return  list.get(0).getObj();
    }


    public HttpEntity fun(String phoneNum) throws Exception {
        DefaultHttpClient httpClient = new DefaultHttpClient();
        HttpPost httpPost = new HttpPost(SERVER_URL);
        String curTime = String.valueOf((new Date()).getTime() / 1000L);
        /*
         * 参考计算CheckSum的java代码，在上述文档的参数列表中，有CheckSum的计算文档示例
         */
        String checkSum = CheckSumBuilder.getCheckSum(APP_SECRET, NONCE, curTime);
        // 设置请求的header
        httpPost.addHeader("AppKey", APP_KEY);
        httpPost.addHeader("Nonce", NONCE);
        httpPost.addHeader("CurTime", curTime);
        httpPost.addHeader("CheckSum", checkSum);
        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        // 设置请求的的参数，requestBody参数
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        /*
         * 1.如果是模板短信，请注意参数mobile是有s的，详细参数配置请参考“发送模板短信文档”
         * 2.参数格式是jsonArray的格式，例如 "['13888888888','13666666666']"
         * 3.params是根据你模板里面有几个参数，那里面的参数也是jsonArray格式
         */
        nvps.add(new BasicNameValuePair("templateid", TEMPLATEID));
        nvps.add(new BasicNameValuePair("mobile", phoneNum));
        nvps.add(new BasicNameValuePair("codeLen", CODELEN));

        httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));

        // 执行请求
        HttpResponse response = httpClient.execute(httpPost);
        /*
         * 1.打印执行结果，打印结果一般会200、315、403、404、413、414、500
         * 2.具体的code有问题的可以参考官网的Code状态表
         */
        return response.getEntity();
    }

}