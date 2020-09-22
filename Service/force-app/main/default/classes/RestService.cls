@RestResource(urlMapping = '/sensorEvent')
global with sharing class RestService {
    
    @HttpPut
    global static void upsertData() {
        SensorData sensorData = (SensorData) JSON.deserialize(RestContext.request.requestBody.toString(), SensorData.class);

        MainService service = new MainService();
        service.insertSensorEventsData(sensorData);
    }

}