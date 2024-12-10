package com.hmdp.listener;

import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

@Component  //注册为Bean
public class TestListener {

    @RabbitListener(queues = "yyds")   //定义此方法为队列yyds的监听器，一旦监听到新的消息，就会接受并处理
    public void test(Message message){
        System.out.println(new String(message.getBody()));
    }
}