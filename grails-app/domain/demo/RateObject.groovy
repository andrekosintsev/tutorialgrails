package demo

class RateObject {
    String day 
    String valueDol
    String valueEur
    static constraints = {
    }
    void setDay( String day ) {
    	this.day = day;
    }
    void setValueDol( String valueDol ) {
    	this.valueDol = valueDol;
    }
    void setValueEur( String valueEur ) {
    	this.valueEur = valueEur;
    }
}
