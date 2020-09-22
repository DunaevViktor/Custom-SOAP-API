public with sharing class SoapClient {

    //SoapClient.makeSoapRequest(AccessToService.getToken(), 'soap name', '0012w00000M5XnEAAV', new Integer[]{2,2,8,2,2,7});
    //0012w00000M5XnEAAV
    
    public static void makeSoapRequest(String token, String sensorName, String accountId, Integer[] coordinates) {
        
        SensorData data = new SensorData(accountId, sensorName, coordinates);

        //wsdlFromSoapService
        wsdlFromSoapService.SoapService service = new wsdlFromSoapService.SoapService();
        service.SessionHeader = new wsdlFromSoapService.SessionHeader_element();
        service.SessionHeader.sessionId = token;
        service.upsertData(JSON.serialize(data));
    }
}