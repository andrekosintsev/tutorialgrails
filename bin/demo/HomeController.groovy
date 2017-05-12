package demo

import java.util.Collections;
import java.util.Comparator;
import java.util.Locale;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TreeMap;
import java.util.Map;
import java.util.List;
import java.util.Date;
import java.util.ArrayList;
import java.lang.Double;
import groovy.json.*;

class HomeController {
	def maxDollar;
	def minDollar;
	def maxEuro;
	def minEuro;
	def metrics;
	def valueDol;
	def valueEur;
	def day;
	
    def index() { 
    	def results = demo.RateObject.list([max:30]);
    	Collections.sort(results, new Comparator<demo.RateObject>() {

			@Override
			public int compare(demo.RateObject o1, demo.RateObject o2) {
				SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy", Locale.ENGLISH);
				Calendar calendarO1 = Calendar.getInstance();
				Calendar calendarO2 = Calendar.getInstance();
				calendarO1.setTime(sdf.parse(o1.day));
				calendarO2.setTime(sdf.parse(o2.day));
				return calendarO2.compareTo(calendarO1);
			}

		});
    	
    	valueEur = results.valueEur;
    	valueDol = results.valueDol;
    	minDollar = results[0].valueDol;
    	minEuro = results[0].valueEur;
    	metrics = results.day;
    	
    	List<Double> arrayList = new ArrayList<Double>();
    	Map<String, String> month = new TreeMap<String,String>();
    	SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy", Locale.ENGLISH);
    	String toJson = "[";
		for(int i=0; i< valueEur.size() ; i++) {
			def (value1, value2, value3) = metrics.get(i).tokenize( '.' );
			String valueEurTemp = new String(valueEur.get(i).replace(',', '.'));
			String valueDolTemp = new String(valueDol.get(i).replace(',', '.'));  
			toJson = toJson.concat(Double.parseDouble(valueEurTemp)/Double.parseDouble(valueDolTemp) +",");
			def doubleE = Double.parseDouble(valueEurTemp);
			def doubleD = Double.parseDouble(valueDolTemp);
			arrayList.add(doubleE/doubleD);
		}
		toJson = toJson.substring(0,toJson.length()-1);
		toJson = toJson.concat("]");
		
		
    	
    	if (true) {
    		for (def value : results) {
    			if (value.valueDol > maxDollar) {
    				maxDollar = value.valueDol;
    			}
    			if (value.valueDol < minDollar) {
    				minDollar = value.valueDol;
    			}
    			if (value.valueEur > maxEuro) {
    				maxEuro = value.valueEur;
    			}
    			if (value.valueEur < minEuro) {
    				minEuro = value.valueEur;
    			}
    		}
    	}
    	[results:results, maxEuro:maxEuro,minEuro:minEuro, minDollar:minDollar, maxDollar:maxDollar, valueEur: toJson, coefficient :arrayList]
    }
}
