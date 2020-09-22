@IsTest public with sharing class RestClientTest {

    private static String TEST_TOKEN = 'test_token';
    private static String ACCOUNT_ID = 'accId';
    private static String SENSOR_NAME = 'sensor_name';
    private static Integer[] COORDINATES = new Integer[]{1,3,3,7,4,8};

    private static String WRONG_STATUC_CODE = 'Actual status code does not equal to expected';

    @IsTest public static void testRestRequest() {
        Test.setMock(HttpCalloutMock.class, new RestClientMock()); 
        HttpResponse response = RestClient.makeRestRequest(TEST_TOKEN, SENSOR_NAME, ACCOUNT_ID, COORDINATES);
        System.assertEquals(200, response.getStatusCode());
    }
}