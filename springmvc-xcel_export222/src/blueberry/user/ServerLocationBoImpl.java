/*package blueberry.user;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;

import org.springframework.stereotype.Component;

import com.maxmind.geoip.Location;
import com.maxmind.geoip.LookupService;
import com.maxmind.geoip.regionName;











@Component
public class ServerLocationBoImpl {

	public static void main(String[] args){
	    
	    ServerLocationBoImpl class2=new ServerLocationBoImpl();
	    
	    
	    URL path = ClassLoader.getSystemResource("./GeoLiteCity.dat");
	    Reader reader = new InputStreamReader(class2.getClass().getResourceAsStream("GeoLiteCity.dat") );
	    
	    reader.
	    
	    LookupService cl = null;
	    try {
		cl = new LookupService(reader.toString(), LookupService.GEOIP_MEMORY_CACHE | LookupService.GEOIP_CHECK_CACHE);
	    } catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	    }

	    Location location = cl.getLocation("39.118.160.24");
	    
	    System.out.println(location.city);
	
	    
	    
	    
	}
	
	
}*/