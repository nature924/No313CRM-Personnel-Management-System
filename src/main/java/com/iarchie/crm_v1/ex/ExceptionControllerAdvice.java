package com.iarchie.crm_v1.ex;


import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 类描述信息 统一异常处理器
 *
 * @author Tomlin
 * @ClassName ExceptionControllerAdvice
 * @Description: TODO
 * @date 2018/12/24 15:53
 * @Viersion V1.0.1
 */
@ControllerAdvice
public class ExceptionControllerAdvice {
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public String errorView(Exception ex) {

        return "出现异常了" + ex.getMessage();
    }
}
