package blueberry.temp;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MapSort {
    public List<Map<String, String>> testMap() {
         List<Map<String, String>> list = new ArrayList<Map<String, String>>();
         Map<String, String> myMap1 = new HashMap<String, String>();
         myMap1.put("name", "Josh");
         Map<String, String> myMap2 = new HashMap<String, String>();
         myMap2.put("name", "Anna");

         Map<String, String> myMap3 = new HashMap<String, String>();
         myMap3.put("name", "Bernie");


         list.add(myMap1);
         list.add(myMap2);
         list.add(myMap3);

         return list;
    }

    public static void main(String[] args) {
         MapSort ms = new MapSort();
         List<Map<String, String>> testMap = ms.testMap();
         System.out.println("Before Sort: " + testMap);
         Collections.sort(testMap, new ListMapComparator());
         System.out.println("After Sort: " + testMap);
         try {
             java.util.Collections.sort(data,
                     new Comparator>() {
                         SimpleDateFormat sdf = new SimpleDateFormat(
                                 "MM/dd/yyyy");

                         public int compare(final Map map1,
                                 final Map map2) {
                             Date date1 = null, date2 = null;
                             try {
                                 date1 = sdf.parse(map1.get("Date"));
                                 date2 = sdf.parse(map2.get("Date"));
                             } catch (ParseException e) {
                                 e.printStackTrace();
                             }
                             if (date1.compareTo(date2) > 0) {
                                 return +1;
                             } else if (date1.compareTo(date2) == 0) {
                                 return 0;
                             } else {
                                 return -1;
                             }
                         }
                     });

         } catch (Exception e) {

         }
    }
    
}