
public aspect TraceAspectSchall {

	pointcut classToTrace(): within(*App);
	
	pointcut methodToTrace(): classToTrace() && execution(String getName());  
	
	before(): methodToTrace() {
		String result = "";
		result += thisJoinPointStaticPart.getSignature() + ", ";
		result += thisJoinPointStaticPart.getSourceLocation().getLine();
		System.out.println("[BGN]" + result);
	}
	
	after(): methodToTrace() {
		
		String result = "";
		result += thisJoinPointStaticPart.getSourceLocation();
		System.out.println("[END]" + result);
	}
	
}
