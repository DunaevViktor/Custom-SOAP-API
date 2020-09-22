@IsTest public with sharing class SensorLogicTest {
    
    private static String SENSOR_NAME = 'Sensor Name';
    private static String FAKE_SENSOR_NAME = 'Fake Name';
    
    private static String EXPECTED_GOT_NULL = 'Expected get null object';
    private static String ILLEGAL_ARGUMENT_EXCEPTION  = 'System.IllegalArgumentException';
    private static String WRONG_EXCEPTION_MESSAGE = 'Actual exception message does n\' equal to expected';
    private static String EXPECTED_EXCEPTION_MESSAGE = 'Couldn\'t find account with specified id';
    private static String WRONG_SENSOR_NAME = 'Actual sensor\'s name does n\'t equal to expected';
    private static String WRONG_SENSOR_AMOUNT = 'Actual amount of sensors does n\' equal to expected';
        
    @TestSetup static void makeData() {
        Account account = new Account(Name = 'Test Account');
        insert account;
        
        Sensor__c sensor = new Sensor__c(Name = SENSOR_NAME, Account_Id__c = account.Id);
        insert sensor;
    }
    
    @IsTest public static void testSearchWithUnexistSensor() {
        Account account = [SELECT Name FROM Account];
        
        SensorLogic objectOfClass = new SensorLogic();
        Sensor__c sensor = objectOfClass.findSensor(FAKE_SENSOR_NAME, account.Id);
        
        System.assertEquals(null, sensor, EXPECTED_GOT_NULL);
    }
    
    @IsTest public static void testSearchWithUnexistAccount() {
        Sensor__c sensor = [SELECT Name FROM Sensor__c];
        
        SensorLogic objectOfClass = new SensorLogic();
        
        try {
            objectOfClass.findSensor(sensor.Id, FAKE_SENSOR_NAME);
        } catch (Exception e) {
            System.assertEquals(ILLEGAL_ARGUMENT_EXCEPTION, e.getTypeName(),
                                'Expected exception with type NoAccessException, but got ' + e.getTypeName());
            System.assertEquals(EXPECTED_EXCEPTION_MESSAGE, e.getMessage(), WRONG_EXCEPTION_MESSAGE);
        }
    }
    
    @IsTest public static void testSearch() {
        Account account = [SELECT Name FROM Account];
        
        SensorLogic objectOfClass = new SensorLogic();
        Sensor__c sensor = objectOfClass.findSensor(SENSOR_NAME, account.Id);
        
        System.assertEquals(SENSOR_NAME, sensor.Name, WRONG_SENSOR_NAME);
    }
    
    @IsTest public static void testCreate() {
        Account account = [SELECT Name FROM Account];
        
        SensorLogic objectOfClass = new SensorLogic();
        objectOfClass.createSensor(FAKE_SENSOR_NAME, account.Id);
        
        List<Sensor__c> sensors = [SELECT Name FROM Sensor__c];
        System.assertEquals(2, sensors.size(), WRONG_SENSOR_AMOUNT);
    }
    
}