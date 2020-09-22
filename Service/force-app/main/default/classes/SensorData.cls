//Wrapping class for JSON.deserialize
public with sharing class SensorData {
    
    public String accountId {get;set;}
    public String sensorId {get;set;}
    public Integer[] coordinates {get;set;}
    
    public SensorData(String accountId, String sensorId, Integer[] coordinates) {
        this.accountId = accountId;
        this.sensorId = sensorId;
        this.coordinates = coordinates;
    }
}