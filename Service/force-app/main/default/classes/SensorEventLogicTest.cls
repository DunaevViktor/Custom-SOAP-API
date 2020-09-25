//Class for testing SensorEventLogic class
@IsTest public with sharing class SensorEventLogicTest {
    
    private static String SENSOR_NAME = 'Sensor Name';
    private static String FAKE_SENSOR_NAME = 'Fake Name';
    
    private static Integer X = 1;
    private static Integer Y = 2;
    private static Integer Z = 3;
    
    private static String WRONG_SENSOR_EVENT_AMOUNT = 'Actual amount of sensor events does not equal to expected';
    private static String WRONG_SENSOR_EVENT_PARENT = 'Actual sensor previos event does not equal to expected';
    
    @TestSetup static void makeData() {
        Account account = new Account(Name = 'Test Account');
        insert account;
        
        Sensor__c sensor = new Sensor__c(Name = SENSOR_NAME, Account_Id__c = account.Id);
        insert sensor;
    }
    
    @IsTest public static void testCreateSensorEvents() {
        Sensor__c sensor = [SELECT Name FROM Sensor__c];
        
        //Math.mod(coordinates.size(), 3) == 0
        List<Integer> coordinates = new List<Integer>();
        for(Integer i = 0; i < 9; i++) {
            coordinates.add(i);
        }
        
        SensorEventLogic objectOfClass = new SensorEventLogic();
        objectOfClass.createSensorEvents(sensor.Id, coordinates);
        
        List<Sensor_Event__c> events = [SELECT Name FROM Sensor_Event__c];
        
        System.assertEquals(coordinates.size() / 3, events.size(), WRONG_SENSOR_EVENT_AMOUNT);
        
        //Math.mod(coordinates.size(), 3) != 0
        List<Integer> coordNotMod3 = new List<Integer>();
        for(Integer i = 0; i < 10; i++) {
            coordNotMod3.add(i);
        }
        
        objectOfClass.createSensorEvents(sensor.Id, coordNotMod3);
        
        List<Sensor_Event__c> newEvents = [SELECT Name FROM Sensor_Event__c];
        
        Integer newSize = (coordinates.size() / 3) + (coordNotMod3.size() / 3);
        System.assertEquals(newSize, newEvents.size(), WRONG_SENSOR_EVENT_AMOUNT);
        
    }
    
    @IsTest public static void testLinkEvents() {
        Sensor__c sensor = [SELECT Name FROM Sensor__c];
        
        List<Sensor_Event__c> events = new List<Sensor_Event__c>();
        
        Sensor_Event__c firstEvent = new Sensor_Event__c(Sensor__c = sensor.Id,
                                                         x__c = X, 
                                                         y__c = Y,
                                                         z__c = Z);
        events.add(firstEvent);
        
        Sensor_Event__c secondEvent = new Sensor_Event__c(Sensor__c = sensor.Id,
                                                          x__c = X, 
                                                          y__c = Y,
                                                          z__c = Z);
        events.add(secondEvent);
        
        Sensor_Event__c thirdEvent = new Sensor_Event__c(Sensor__c = sensor.Id,
                                                         x__c = X, 
                                                         y__c = Y,
                                                         z__c = Z);
        events.add(thirdEvent);
        
        insert events;
        
        SensorEventLogic objectOfClass = new SensorEventLogic();
        List<Sensor_Event__c> resultEvents = objectOfClass.linkEvents(events);
        
        System.assertEquals(resultEvents[0].Id, resultEvents[1].Previous_Event__c, WRONG_SENSOR_EVENT_PARENT);
        System.assertEquals(resultEvents[1].Id, resultEvents[2].Previous_Event__c, WRONG_SENSOR_EVENT_PARENT);
    }
    
}