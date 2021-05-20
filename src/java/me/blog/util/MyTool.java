package me.blog.util;

import me.blog.been.User;
import org.springframework.ui.ModelMap;

/**
 * Created by guyu on 2016/11/12.
 */
public class MyTool {
    public static String getWebapp() {
        String classpath = new MyTool().getClass().getResource("/").getPath().replaceFirst("/", "");
        String webappRoot = classpath.replaceAll("WEB-INF/classes/", "");
        return webappRoot;
    }
    public static String getImageFromMD(String md) {
        try {
            int first = md.indexOf("![](");
            if(first < 0)
                return "#";
            int last = md.indexOf(")", first);
            return md.substring(first + 4, last);
        } catch (Exception e) {
            return "#";
        }
    }
    public static String getPreviewMD(String md) {
        String []strings = md.split("\n");
        String result = "";
        int i = 0;
        boolean flag = true;
        for(String string :strings) {
            if(i >= 7)
                break;
            if(string.indexOf("![](") >= 0)
                continue;
            if(string.indexOf("```") >= 0)
                flag = !flag;
            if(string == "\n" || string == "\r\n")
                continue;
            result = result + string + "\n";
            i++;
        }
        if(!flag)
            result = result + "```\n";
        result = result + "######……";
        return result;
    }
    static public User getCurrentUser(ModelMap modelMap) {
        return (User) modelMap.get("current_user");
    }
}
