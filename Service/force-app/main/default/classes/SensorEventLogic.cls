//Class with methods for SensorEvent
public with sharing class SensorEventLogic {
    
    //Builds one SensorEvent according to the specified parameters
    public Sensor_Event__c buildSensorEvent(String sensorId, Integer x, Integer y, Integer z) {
        Sensor_Event__c event = new Sensor_Event__c();
        event.x__c = x;
        event.y__c = y;
        event.z__c = z;
        event.Sensor__c = sensorId;
        return event;
    }
    
    //Creates and inserts a list of SensorEvent
    public List<Sensor_Event__c> createSensorEvents(String sensorId, Integer[] coordinates) {
        Integer amount = getCorrectAmount(coordinates);
        List<Sensor_Event__c> events = new List<Sensor_Event__c>();
        for(Integer i = 0; i <= amount; i=i+3) {
            Integer x = coordinates[i];
            Integer y = coordinates[i + 1];
            Integer z = coordinates[i + 2];
            Sensor_Event__c event = this.buildSensorEvent(sensorId, x, y, z);
            events.add(event);
        }
        insert events;
        return events;
    }
    
    //Gets the correct number of value sets {x,y,z}
    private Integer getCorrectAmount(Integer[] coordinates) {
        if(Math.mod(coordinates.size(), 3) == 0) {
            return coordinates.size() - 3;
        } 
        return coordinates.size()  - (Math.mod(coordinates.size(), 3) + 3);
    }
    
    //Initializes the Previous_Event__c fields
    public List<Sensor_Event__c> linkEvents(List<Sensor_Event__c> events){
        for(Integer i = 1; i < events.size(); i++) {
            events[i].Previous_Event__c = events[i - 1].Id;
        }
        upsert events;
        return events;
    }
    
}