package com.ruoyi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 * 
 * @author ruoyi
 */
@SpringBootApplication
@EnableAutoConfiguration(exclude = { DataSourceAutoConfiguration.class })
public class RuoYiApplication
{
    public static void main(String[] args)
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
}