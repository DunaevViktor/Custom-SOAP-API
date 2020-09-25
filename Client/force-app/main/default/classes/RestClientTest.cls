//Class for testing RestClient class
@IsTest public with sharing class RestClientTest {
    
    private static String SENSOR_ID = 'sensorID';
    private static Integer X = 1;
    private static Integer Y = 2;
    private static Integer Z = 3;
    
    private static String WRONG_STATUC_CODE = 'Actual status code does not equal to expected';
    
    @IsTest public static void testStandardRestRequest() {
        Test.setMock(HttpCalloutMock.class, new RestClientMock()); 
        HttpResponse response = RestClient.makeRestRequest(new SensorEventData(SENSOR_ID, X, Y, Z));
        System.assertEquals(200, response.getStatusCode());
    }
}