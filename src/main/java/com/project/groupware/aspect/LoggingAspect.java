package com.project.groupware.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LoggingAspect {
	private static final Logger logger = LoggerFactory.getLogger(LoggingAspect.class);

	@Around(value = "execution(public * com.project.groupware..*.*(..))")
	public Object logging(ProceedingJoinPoint jp) throws Throwable {
		String className = jp.getTarget().getClass().getName();
		String methodName = jp.getSignature().getName();
		Object[] args = jp.getArgs();

		logger.info("[{}] {} ", className, methodName);
		logger.info("args : {}", args);

		Object retVal = null;
		try {
			retVal = jp.proceed();

		} catch (Throwable ex) {
			logger.error("error : {}", ex.toString());
			throw ex;
		} finally {
			logger.info("[{}] {} ", className, methodName);
			logger.info("retVal : {}", retVal);
		}
		return retVal;

	}

}
