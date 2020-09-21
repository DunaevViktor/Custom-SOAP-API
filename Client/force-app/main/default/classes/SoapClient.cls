public with sharing class SoapClient {

    //SoapClient.makeSoapRequest();

    //0012w00000M5XnEAAV
    public static String ACCOUNT_ID = '0012w00000M5XnEAAV';
    public static String SENSOR_ID = '200';

    @future(callout=true)
    public static void makeSoapRequest() {
        Integer[] coordinates = new Integer[]{};
        for(Integer i = 0; i < 6; i++ ){
            coordinates.add(i);
        }
        
        SensorData data = new SensorData(ACCOUNT_ID, SENSOR_ID, coordinates);

        //wsdlFromSoapService
        wsdlFromSoapService.SoapService service = new wsdlFromSoapService.SoapService();
        service.SessionHeader = new wsdlFromSoapService.SessionHeader_element();
        service.SessionHeader.sessionId = AccessToService.getToken();
        service.upsertData(JSON.serialize(data));
    }
}