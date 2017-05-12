package myapp

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TreeMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;

class BootStrap {

    def init = { servletContext ->
           SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");
			Map<String, Map<String, String>> month = new TreeMap<String, Map<String, String>>();
			for (int mDay = 0; mDay < 31; mDay++) {
				try {
					Calendar cal = Calendar.getInstance();
					cal.add(Calendar.DAY_OF_MONTH, -mDay);
					Document doc = Jsoup
							.connect("https://www.cbr.ru/currency_base/daily.aspx?date_req=" + format.format(cal.getTime())).get();
					Elements rows = doc.select("table").get(0).select("tr");
	
					for (int i = 1; i < rows.size(); i++) { // first row is the col
															// names so skip it.
						Element row = rows.get(i);
						Elements cols = row.select("td");
						Map<String, String> curValue = new TreeMap<String, String>();
						if (cols.get(1).text().equals("EUR") || cols.get(1).text().equals("USD")) {
							curValue.put(cols.get(1).text(), cols.get(4).text());
							if (month.get(format.format(cal.getTime())) != null) {
								month.get(format.format(cal.getTime())).put(cols.get(1).text(), cols.get(4).text());
							} else {
								month.put(format.format(cal.getTime()), curValue);
							}
						}
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			for (Map.Entry<String, Map<String, String>> entry : month.entrySet()) {
				def rateObject = new demo.RateObject()
				rateObject.setDay(entry.getKey());
				for (Map.Entry<String, String> valueIn : entry.getValue().entrySet()) {
					if ("EUR".equals(valueIn.getKey())) { 
						rateObject.setValueEur(valueIn.getValue());
					} else {
						rateObject.setValueDol(valueIn.getValue());
					}
				}
				rateObject.save();
			}
    }
    def destroy = {
    }
}
