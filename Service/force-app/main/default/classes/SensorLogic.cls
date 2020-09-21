//Class with methods for Sensor
public with sharing class SensorLogic {
    
    //Searches for an Sensor by the specified parameters
    public Sensor__c findSensor(String sensorId, String accountId) {
        List<Sensor__c> sensors = [SELECT Name FROM Sensor__c WHERE Name =: sensorId
                                   AND Account_Id__c =: accountId LIMIT 1];
        if(sensors.size() == 0) {
            return null;
        }
        return sensors[0];
    }
    
    //Creates and inserts a Sensor
    public Sensor__c createSensor(String name, String accountId) {
        Sensor__c sensor = new Sensor__c(Name = name, Account_Id__c = accountId);
        insert sensor;
        return sensor;
    }
    
}