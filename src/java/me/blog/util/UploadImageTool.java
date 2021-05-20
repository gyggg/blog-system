package me.blog.util;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;

import java.io.File;
import java.io.IOException;

/**
 * Created by guyu on 2016/10/27.
 */
public class UploadImageTool {
    final public static String ACCESS_KEY = "dgkm1oOjYU0qRx1HrDPmBH3mLD3Op67fPmOcwROA";
    final public static String SECRET_KEY = "OhLIMKNlMO9i-GWr-v78I_2IHEQerRcK-lvDiPpf";
    final public static String bucketname = "my-blog";

    //密钥配置
    public static Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
    //创建上传对象
    public static UploadManager uploadManager = new UploadManager();

    //简单上传，使用默认策略，只需要设置上传的空间名就可以了
    public static String getUpToken() {
        return auth.uploadToken(bucketname);
    }

    public static void upload(File file, String key) throws IOException {
        try {
            //调用put方法上传
            Response res = uploadManager.put(file, key, getUpToken());
            //打印返回的信息
            System.out.println(res.bodyString());
        } catch (QiniuException e) {
            Response r = e.response;
            // 请求失败时打印的异常的信息
            System.out.println(r.toString());
            try {
                //响应的文本信息
                System.out.println(r.bodyString());
            } catch (QiniuException e1) {
                //ignore
            }
        }
    }
}

