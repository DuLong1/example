package com.adultexample.utils;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.QuerySendDetailsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.QuerySendDetailsResponse;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.dysmsapi.transform.v20170525.SendSmsResponseUnmarshaller;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.FormatType;
import com.aliyuncs.http.HttpResponse;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * Created on 17/6/7.
 * ����API��Ʒ��DEMO����,�����а�����һ��SmsDemo�ֱ࣬��ͨ��
 * ִ��main��������������Ų�ƷAPI����(ֻ��Ҫ��AK�滻�ɿ�ͨ����ͨ��-���Ų�Ʒ���ܵ�AK����)
 * ����������2��jar��(����ڹ��̵�libsĿ¼��)
 * 1:aliyun-java-sdk-core.jar
 * 2:aliyun-java-sdk-dysmsapi.jar
 *
 * ��ע:Demo���̱������UTF-8
 * ���ʶ��ŷ���������մ�DEMO
 */
public class SmsDemo {

    //��Ʒ����:��ͨ�Ŷ���API��Ʒ,�����������滻
    static final String product = "Dysmsapi";
    //��Ʒ����,�����������滻
    static final String domain = "dysmsapi.aliyuncs.com";

    // TODO �˴���Ҫ�滻�ɿ������Լ���AK(�ڰ����Ʒ��ʿ���̨Ѱ��)
    static final String accessKeyId = "LTAI4FsXPAQwuaLmCuwj9RpG";
    static final String accessKeySecret = "O7kElS8xVuCmqJnpqan8Uibj4VayXg";

    public static SendSmsResponse sendSms(String mobile,String code) throws ClientException {

        //������������ʱʱ��
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");

        //��ʼ��acsClient,�ݲ�֧��region��
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
        DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
        IAcsClient acsClient = new DefaultAcsClient(profile);

        //��װ�������-��������������̨-�ĵ���������
        SendSmsRequest request = new SendSmsRequest();
        //����:�������ֻ���
        request.setPhoneNumbers(mobile);
        //����:����ǩ��-���ڶ��ſ���̨���ҵ�
        request.setSignName("�������ע�������֤");
        //����:����ģ��-���ڶ��ſ���̨���ҵ�
        request.setTemplateCode("SMS_185241234");
        //��ѡ:ģ���еı����滻JSON��,��ģ������Ϊ"�װ���${name},������֤��Ϊ${code}"ʱ,�˴���ֵΪ
        request.setTemplateParam("{\"code\":"+code+"}");

        //ѡ��-���ж�����չ��(�����������û�����Դ��ֶ�)
        //request.setSmsUpExtendCode("90997");

        //��ѡ:outIdΪ�ṩ��ҵ����չ�ֶ�,�����ڶ��Ż�ִ��Ϣ�н���ֵ���ظ�������
        request.setOutId("yourOutId");

        //hint �˴����ܻ��׳��쳣��ע��catch
        SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);

        return sendSmsResponse;
    }


    public static QuerySendDetailsResponse querySendDetails(String bizId) throws ClientException {

        //������������ʱʱ��
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");

        //��ʼ��acsClient,�ݲ�֧��region��
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
        DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
        IAcsClient acsClient = new DefaultAcsClient(profile);

        //��װ�������
        QuerySendDetailsRequest request = new QuerySendDetailsRequest();
        //����-����
        request.setPhoneNumber("15000000000");
        //��ѡ-��ˮ��
        request.setBizId(bizId);
        //����-�������� ֧��30���ڼ�¼��ѯ����ʽyyyyMMdd
        SimpleDateFormat ft = new SimpleDateFormat("yyyyMMdd");
        request.setSendDate(ft.format(new Date()));
        //����-ҳ��С
        request.setPageSize(10L);
        //����-��ǰҳ���1��ʼ����
        request.setCurrentPage(1L);

        //hint �˴����ܻ��׳��쳣��ע��catch
        QuerySendDetailsResponse querySendDetailsResponse = acsClient.getAcsResponse(request);

        return querySendDetailsResponse;
    }

   

}
