package yuhan.mvc.aop2;

import org.springframework.context.support.GenericApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Repository;

@Repository
public class MainClass {

	public static void main(String[] args) {
		
		GenericApplicationContext ctx  = new GenericXmlApplicationContext("classpath:applicationCTX.xml");
		
		Student student = ctx.getBean("student", Student.class);
		student.getStudentInfo();
		
		System.out.println("---------------------");
		
		Worker worker = ctx.getBean("worker", Worker.class);
		worker.getWorkerInfo();
		
		System.out.println("---------------------");
		
		ctx.close();
		
		
		
		
	}

}
