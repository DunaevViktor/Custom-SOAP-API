public with sharing class RestClient {
    
    //RestClient.makeRestRequest(AccessToService.getToken(), 'rest name', '0012w00000M5XnEAAV', new Integer[]{1,3,3,7,4,8});

    //2 callbackUrl: authorization and request
    //OAuth policies: Relax Ip Restriction (for IP not from the range of the organization)
    //0012w00000M5XnEAAV

    public static HttpResponse makeRestRequest(String token, String sensorName, String accountId, Integer[] coordinates) {
        
        SensorData sensorData = new SensorData(accountId, sensorName, coordinates);

        Http http = new Http();
        HttpRequest request = new HttpRequest();  
        request.setEndpoint(AccessToService.SERVER_BASE_URL + '/services/apexrest/sensorEvent');  
        request.setMethod('PUT');    
        request.setHeader('Authorization', 'Bearer ' + AccessToService.getToken());
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody(JSON.serialize(sensorData));      
        HttpResponse responce = http.send(request);
        return responce;
    }
}