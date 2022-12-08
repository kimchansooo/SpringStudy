package main;

import org.springframework.context.support.GenericXmlApplicationContext;

import spring.Client;

public class Program {

	public static void main(String[] args) {
		
		//Client client = new Client("192.168.0.115");
		//client.setHost("192.168.1.1");
		
		
		GenericXmlApplicationContext context = 
				new GenericXmlApplicationContext("classpath:ApplicationContext.xml");
		//bean 만들고 injection 끝나고 초기화 함수 호출된다.
		
		//여기서 부터 컨테이너 안에서 필요한거 끄집어낸다.
		Client client = context.getBean("client", Client.class);
		client.send();
		context.close(); //컨테이너 종료
		
		
	}

}
