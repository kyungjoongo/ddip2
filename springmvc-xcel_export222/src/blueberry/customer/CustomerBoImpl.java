package blueberry.customer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class CustomerBoImpl implements CustomerBo {

	public void addCustomer(){
		System.out.println("addCustomer method ");
	}
	
	public String addCustomerReturnValue(){
		System.out.println("addCustomerReturnValue() is running ");
		return "abc";
	}
	
	public void addCustomerThrowException() throws Exception {
		System.out.println("addCustomerThrowException() is running ");
		throw new Exception("Generic Error");
	}
	
	public void addCustomerAround(String name){
		System.out.println("addCustomerAround() is running, args : " + name);
	}
	
	public static void main(String[] args){
	    
	    
	    ApplicationContext appContext = new ClassPathXmlApplicationContext(new String[] { "Spring-Customer.xml" });
	    System.out.println("sdflksdlfksdlkf");
	    
	    CustomerBo customer = (CustomerBo) appContext.getBean("customerBo");
		customer.addCustomer();
	    
	}
	
	
}