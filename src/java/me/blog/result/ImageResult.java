package me.blog.result;

/**
 * Created by guyu on 2016/11/12.
 */
public class ImageResult {
    private int success;
    private String message;
    private String url;

    public ImageResult(int success, String message, String url) {
        this.success = success;
        this.message = message;
        this.url = url;
    }

    public int getSuccess() {
        return success;
    }

    public void setSuccess(int success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
