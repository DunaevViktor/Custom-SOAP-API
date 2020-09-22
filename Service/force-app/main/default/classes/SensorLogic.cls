//Class with methods for Sensor
public with sharing class SensorLogic {
    
    private static String NO_SUCH_ACCOUNT = 'Couldn\'t find account with specified id';
    
    //Checks the accountId for validity
    public Boolean isAccountExists(String id) {
        List<Account> accounts = [SELECT Name FROM Account WHERE Id =: id];
        if(accounts.size() == 0) {
            return false;
        }
        return true;
    }
    
    //Searches for an Sensor by the specified parameters
    public Sensor__c findSensor(String sensorName, String accountId) {
        
        if(!isAccountExists(accountId)) {
            throw new System.IllegalArgumentException(NO_SUCH_ACCOUNT);
        }
        
        List<Sensor__c> sensors = [SELECT Name FROM Sensor__c WHERE Name =: sensorName
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