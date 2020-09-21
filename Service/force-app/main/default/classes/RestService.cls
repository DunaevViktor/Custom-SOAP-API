@RestResource(urlMapping = '/sensorEvent')
global with sharing class RestService {
    
    @HttpPut
    global static void upsertSensorEvents() {
        SensorData sensorData = (SensorData) JSON.deserialize(RestContext.request.requestBody.toString(), SensorData.class);

        MainService service = new MainService();
        service.insertSensorEventsData(sensorData);
    }

}