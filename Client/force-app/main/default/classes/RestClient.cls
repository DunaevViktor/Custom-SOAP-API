public with sharing class RestClient {
    
    //RestClient.makeRestRequest();

    //2 callbackUrl: authorization and request
    //OAuth policies: Relax Ip Restriction (for IP not from the range of the organization)
    //0012w00000M5XnEAAV
    public static String ACCOUNT_ID = '0012w00000M5XnEAAV';
    public static String SENSOR_ID = 'rest name';

    @future(callout=true)
    public static void makeRestRequest() {
        Integer[] coordinates = new Integer[]{};
        for(Integer i = 0; i < 6; i++ ){
            coordinates.add(i);
        }
        
        SensorData data = new SensorData(ACCOUNT_ID, SENSOR_ID, coordinates);

        Http http = new Http();
        HttpRequest request = new HttpRequest();  
        request.setEndpoint(AccessToService.SERVER_BASE_URL + '/services/apexrest/sensorEvent');  
        request.setMethod('PUT');    
        request.setHeader('Authorization', 'Bearer ' + AccessToService.getToken());
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody(JSON.serialize(data));        
        HttpResponse responce = http.send(request);
        System.debug('Body ' + responce.getBody());
        System.debug('Status ' + responce.getStatus());
        System.debug('Status code ' + responce.getStatusCode());
        
    }
}