//Class, which allow SOAP requests for org (Custom SOAP)
global with sharing class SoapService {
    
    webservice static void upsertData(String data) {
        SensorData sensorData = (SensorData) JSON.deserialize(data, SensorData.class);

        MainService service = new MainService();
        service.insertSensorEventsData(sensorData);
    }
    
}