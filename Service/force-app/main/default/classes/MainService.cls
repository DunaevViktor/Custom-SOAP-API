//Class, which transform and save data, which come with requests
public with sharing class MainService {
    
    public void insertSensorEventsData(SensorData sensorData) {
        SensorLogic sensorLogic = new SensorLogic();
        Sensor__c sensor = sensorLogic.findSensor(sensorData.sensorId,  sensorData.accountId);

        if(sensor == null) {
            sensor = sensorLogic.createSensor(sensorData.sensorId,  sensorData.accountId);
        }

        SensorEventLogic eventLogic = new SensorEventLogic();
        List<Sensor_Event__c> events = eventLogic.createSensorEvents(sensor.Id, sensorData.coordinates);

        eventLogic.linkEvents(events);
    }
    
}