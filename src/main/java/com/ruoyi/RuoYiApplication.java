package com.ruoyi;

import javafx.application.Application;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 启动程序
 * 
 * @author ruoyi
 */
@SpringBootApplication
@EnableAutoConfiguration(exclude = { DataSourceAutoConfiguration.class })
public class RuoYiApplication
//        extends SpringBootServletInitializer
{
    public static void main(String[] args)throws IOException
    {
        SpringApplication.run(RuoYiApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                       " .----------------.  .----------------.  .----------------.\n "+
                        "| .--------------. || .--------------. || .--------------. |\n"+
                        "| |  ____  ____  | || |  _________   | || |    _______   | |\n"+
                        "| | |_  _||_  _| | || | |_   ___  |  | || |   /  ___  |  | |\n"+
                        "| |   \\ \\  / /   | || |   | |_  \\_|  | || |  |  (__ \\_|  | |\n"+
                        "| |    \\ \\/ /    | || |   |  _|  _   | || |   '.___`-.   | |\n"+
                        "| |    _|  |_    | || |  _| |___/ |  | || |  |`\\____) |  | |\n"+
                        "| |   |______|   | || | |_________|  | || |  |_______.'  | |\n"+
                        "| |              | || |              | || |              | |\n"+
                        "| '--------------' || '--------------' || '--------------' |\n"+
                          " '----------------'  '----------------'  '----------------'\n"


                             );


    }

//    @Override
//    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
//        return application.sources(RuoYiApplication.class);
//    }
}