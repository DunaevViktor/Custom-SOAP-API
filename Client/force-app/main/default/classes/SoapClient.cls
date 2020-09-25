//Class for making SOAP requests to service
public with sharing class SoapClient {

    //SoapClient.makeSoapRequest('sensor name', '0012w00000M5XnEAAV', new Integer[]{1,1,1,2,2,2});
    
    public static void makeSoapRequest(String sensorName, String accountId, Integer[] coordinates) {
        
        SensorData data = new SensorData(accountId, sensorName, coordinates);
        
        wsdlFromSoapService.SoapService service = new wsdlFromSoapService.SoapService();
        service.endpoint_x = 'callout:Service_SOAP_API/services/Soap/class/SoapService';
        service.SessionHeader = new wsdlFromSoapService.SessionHeader_element();
        service.SessionHeader.sessionId = '{!$Credential.OAuthToken}';
        service.upsertData(JSON.serialize(data));
    }
}