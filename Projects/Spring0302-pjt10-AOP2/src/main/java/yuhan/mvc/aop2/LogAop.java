package yuhan.mvc.aop2;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;

//시작, 끝 프로세스 타임 체크하는 AOP Class
public class LogAop {
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
	
	public void beforeAdvice(JoinPoint joinPoint) {
		System.out.println("BeforeAdvice()");
		
	}
	
	public void afterReturning() {
		System.out.println("AfterReturning()");
	}
	
	public void afterAdvice() {
		System.out.println("AfterAdvice()");
		
	}
}
