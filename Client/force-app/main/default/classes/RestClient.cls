public with sharing class RestClient {
    
    //RestClient.makeRestRequest(new SensorEventData('a002w00000BxPMoAAN', 1,1,1));
    
    public static HttpResponse makeRestRequest(SensorEventData event) {
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();  
        request.setEndpoint('callout:Service_SOAP_API/services/data/v49.0/sobjects/Sensor_Event__c');  
        request.setMethod('POST');    
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody(JSON.serialize(event).replaceAll('End', '__c')); 
        
        HttpResponse responce = http.send(request);
        return responce;
    }
}