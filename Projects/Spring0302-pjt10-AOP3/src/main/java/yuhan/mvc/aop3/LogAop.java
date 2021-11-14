package yuhan.mvc.aop3;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

//시작, 끝 프로세스 타임 체크하는 AOP Class

@Component
@Aspect
public class LogAop {
	@Pointcut("within(yuhan.mvc.aop3.*)")
	private void PointcutMethod() {
		
	}
	
	@Around("PointcutMethod()")
	public Object loggerAop(ProceedingJoinPoint joinPoint) throws Throwable {
		String signatureStr = joinPoint.getSignature().toShortString();	// getSignature() : 어떤 메소드를 호출할 때 해당 메소드의 정보를 얻어오는 메소드
		
		System.out.println(signatureStr + "is Start");
		
		long start = System.currentTimeMillis();	// currentTimeMillis() : 100만분의 1초를 계산
		
		try {
			Object object = joinPoint.proceed();
			return object;
		} finally {
			long end = System.currentTimeMillis();
			System.out.println(signatureStr + "is Finished");
			System.out.println(signatureStr + "경과시간 : " + (end - start));
		}

	}
}
