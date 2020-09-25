//Class for testing SoapClient class
@IsTest public with sharing class SoapClientTest {
    
    private static String ACCOUNT_ID = 'accId';
    private static String SENSOR_NAME = 'sensor_name';
    private static Integer[] COORDINATES = new Integer[]{1,3,3,7,4,8};

    private static String UNEXPECTED_EXCEPTION = 'Got unexpected exception during makong soap callout';

    @IsTest public static void testSoapRequest() {
        try {
            Test.setMock(WebServiceMock.class, new SoapClientMock()); 
            SoapClient.makeSoapRequest(SENSOR_NAME, ACCOUNT_ID, COORDINATES);
        } catch(System.Exception e) {
            System.assert(false, UNEXPECTED_EXCEPTION);
        }
    }  
}