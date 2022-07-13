package kh.spring.grougle.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

@Component
@Aspect
public class AdviceLog {
	private static final Logger logger = LoggerFactory.getLogger(AdviceLog.class);
	
	@Pointcut("execution(public * kh.spring.grougle..*Dao.*(..))")
	public void commonDaoPointCut() {}
	@Pointcut("execution(public * kh.spring.grougle..*ServiceImpl.*(..))")
	public void commonServicePointCut() {}
	@Pointcut("execution(public * kh.spring.grougle..*Controller.*(..))")
	public void commonControllerPointCut() {}
	
	@Around("commonDaoPointCut()")
	public Object aroundLogMethod(ProceedingJoinPoint pjp) throws Throwable {
		Object ro = null; // 타겟메소드로부터 return 받은 값을 저장함
		
		logger.debug("\t\t▶▶▶["+pjp.getTarget()+":"+pjp.getSignature().getName()+"]");
		Object[] args = pjp.getArgs();
		for(int i=0; i<args.length; i++) {
			logger.debug("\t\t▶--args["+i+"] "+args[i]);
		}
		
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		
		// 타겟메소드 실행
		ro = pjp.proceed();
		
		stopWatch.stop();
		
		// 타겟메소드의 return 값
		logger.info("\t\t▶▶▶[DAO Ret:"+stopWatch.getTotalTimeMillis()+"ms] "+ ro);
		
		return ro;
	}
//	@Around("commonServicePointCut()")
//	public Object aroundLogServiceMethod(ProceedingJoinPoint pjp) throws Throwable {
//		Object ro = null; // 타겟메소드로부터 return 받은 값을 저장함
//		
//		logger.debug("\t\t["+pjp.getTarget()+":"+pjp.getSignature().getName()+"]");
//		Object[] args = pjp.getArgs();
//		for(int i=0; i<args.length; i++) {
//			logger.debug("\t\t--args["+i+"] "+args[i]);
//		}
//		
//		StopWatch stopWatch = new StopWatch();
//		stopWatch.start();
//		
//		// 타겟메소드 실행
//		ro = pjp.proceed();
//		
//		stopWatch.stop();
//		
//		// 타겟메소드의 return 값
//		logger.info("\t\t[Service Ret:"+stopWatch.getTotalTimeMillis()+"ms] "+ ro);
//		
//		return ro;
//	}
	@Around("commonControllerPointCut()")
	public Object aroundLogCtrlMethod(ProceedingJoinPoint pjp) throws Throwable {
		Object ro = null; // 타겟메소드로부터 return 받은 값을 저장함
		
		logger.debug("\t▶▶▶["+pjp.getTarget()+":"+pjp.getSignature().getName()+"]");
		Object[] args = pjp.getArgs();
		for(int i=0; i<args.length; i++) {
			logger.debug("\t▶--args["+i+"] "+args[i]);
		}
		
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		
		// 타겟메소드 실행
		ro = pjp.proceed();
		
		stopWatch.stop();
		
		// 타겟메소드의 return 값
		logger.info("\t▶▶▶[CTRL Ret:"+stopWatch.getTotalTimeMillis()+"ms] "+ ro);
		
		return ro;
	}
}
