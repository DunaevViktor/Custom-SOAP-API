@IsTest public with sharing class SoapServiceTest {
    
    private static String SENSOR_NAME = 'Sensor Name';
    private static String FAKE_SENSOR_NAME = 'Fake Name';
    
    private static String WRONG_SENSOR_AMOUNT = 'Actual amount of sensors does n\' equal to expected';
    private static String WRONG_SENSOR_EVENT_AMOUNT = 'Actual amount of sensor events does n\' equal to expected';

    @TestSetup static void makeData() {
        Account account = new Account(Name = 'Test Account');
        insert account;

        Sensor__c sensor = new Sensor__c(Name = SENSOR_NAME, Account_Id__c = account.Id);
        insert sensor;
    }

    @IsTest public static void checkWithExistSensor() {

        Account account = [SELECT Name FROM Account];

        List<Integer> coordinates = new List<Integer>();
        for(Integer i = 0; i < 9; i++) {
            coordinates.add(i);
        }

        SensorData sensorData = new SensorData(account.Id, SENSOR_NAME, coordinates);

        Test.startTest();
        SoapService.upsertData(JSON.serialize(sensorData));
        Test.stopTest();

        List<Sensor__c> sensors = [SELECT Name FROM Sensor__c];
        System.assertEquals(1, sensors.size(), WRONG_SENSOR_AMOUNT);

        List<Sensor_Event__c> events = [SELECT Name FROM Sensor_Event__c];
        System.assertEquals(coordinates.size() / 3, events.size(), WRONG_SENSOR_EVENT_AMOUNT);
    }

    @IsTest public static void checkWithUnxistSensor() {

        Account account = [SELECT Name FROM Account];

        List<Integer> coordinates = new List<Integer>();
        for(Integer i = 0; i < 9; i++) {
            coordinates.add(i);
        }

        SensorData sensorData = new SensorData(account.Id, FAKE_SENSOR_NAME, coordinates);

        Test.startTest();
        SoapService.upsertData(JSON.serialize(sensorData));
        Test.stopTest();

        List<Sensor__c> sensors = [SELECT Name FROM Sensor__c];
        System.assertEquals(2, sensors.size(), WRONG_SENSOR_AMOUNT);

        List<Sensor_Event__c> events = [SELECT Name FROM Sensor_Event__c];
        System.assertEquals(coordinates.size() / 3, events.size(), WRONG_SENSOR_EVENT_AMOUNT);
    }
    
    @IsTest public static void checkWithUncorrectLine() {

        Account account = [SELECT Name FROM Account];

        List<Integer> coordinates = new List<Integer>();
        for(Integer i = 0; i < 10; i++) {
            coordinates.add(i);
        }

        SensorData sensorData = new SensorData(account.Id, SENSOR_NAME, coordinates);

        Test.startTest();
        SoapService.upsertData(JSON.serialize(sensorData));
        Test.stopTest();

        List<Sensor_Event__c> events = [SELECT Name FROM Sensor_Event__c];
        System.assertEquals(coordinates.size() / 3, events.size(), WRONG_SENSOR_EVENT_AMOUNT);
    }
    
}