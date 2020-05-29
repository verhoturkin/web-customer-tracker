package com.example.springdemo.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import java.util.logging.Logger;

@Aspect
@Component
public class LoggingAspect {
    private Logger log = Logger.getLogger(getClass().getName());

    @Pointcut("execution(* com.example.springdemo.controller.*.*(..))")
    private void controllers() {
    }

    @Pointcut("execution(* com.example.springdemo.service.*.*(..))")
    private void services() {
    }

    @Pointcut("execution(* com.example.springdemo.repository.*.*(..))")
    private void daos() {
    }

    @Pointcut("controllers() || services() || daos()")
    private void appFlow() {
    }

    @Before("appFlow()")
    public void before(JoinPoint joinPoint) {
        log.info("=====>>> In @Before: " + joinPoint.getSignature().toShortString());

        for (Object arg : joinPoint.getArgs()) {
            log.info("=====>>> Arg: " + arg);
        }
    }

    @AfterReturning(pointcut = "appFlow()", returning = "result")
    public void afterReturn(JoinPoint joinPoint, Object result) {
        log.info("=====>>> In @AfterReturning: " + joinPoint.getSignature().toShortString());
        log.info("=====>>> Result: " + result);
    }
}
