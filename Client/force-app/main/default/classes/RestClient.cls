public with sharing class RestClient {
    
    //RestClient.makeRestRequestOLD(AccessToService.getToken(), 'rest name', '0012w00000M5XnEAAV', new Integer[]{1,3,3,7,4,8});
    
    //2 callbackUrl: authorization and request
    //OAuth policies: Relax Ip Restriction (for IP not from the range of the organization)
    //0012w00000M5XnEAAV - real acc id
    //a002w00000BxPMoAAN - real sensor id
    
    //RestClient.makeRestRequest(AccessToService.getToken(), new SensorEventData('a002w00000BxPMoAAN', 1,2,3));
    
    public static HttpResponse makeRestRequest(String token, SensorEventData event) {
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();  
        request.setEndpoint(AccessToService.SERVER_BASE_URL + '/services/data/v49.0/sobjects/Sensor_Event__c');  
        request.setMethod('POST');    
        request.setHeader('Authorization', 'Bearer ' + token);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody(JSON.serialize(event).replaceAll('End', '__c')); 
        
        HttpResponse responce = http.send(request);
        return responce;
    }
    
    //SensorData class delete?
    //public static HttpResponse makeRestRequestOLD(String token, String sensorName, String accountId, Integer[] coordinates) {
    //    
    //    SensorData sensorData = new SensorData(accountId, sensorName, coordinates);
    //    
    //    Http http = new Http();
    //    HttpRequest request = new HttpRequest();  
    //    request.setEndpoint(AccessToService.SERVER_BASE_URL + '/services/apexrest/sensorEvent');  
    //    request.setMethod('PUT');    
    //    request.setHeader('Authorization', 'Bearer ' + token);
    //    request.setHeader('Content-Type', 'application/json;charset=UTF-8');
    //    request.setBody(JSON.serialize(sensorData));      
    //    HttpResponse responce = http.send(request);
    //    return responce;
    //}
    
}