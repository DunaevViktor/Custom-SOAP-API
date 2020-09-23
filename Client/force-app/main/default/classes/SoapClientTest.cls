@IsTest public with sharing class SoapClientTest {
    private static String TEST_TOKEN = 'test_token';
    private static String ACCOUNT_ID = 'accId';
    private static String SENSOR_NAME = 'sensor_name';
    private static Integer[] COORDINATES = new Integer[]{1,3,3,7,4,8};

    private static String UNEXPECTED_EXCEPTION = 'Got unexpected exception during makong soap callout';

    @IsTest public static void testSoapRequest() {
        try {
            Test.setMock(WebServiceMock.class, new SoapClientMock()); 
            SoapClient.makeSoapRequest(TEST_TOKEN, SENSOR_NAME, ACCOUNT_ID, COORDINATES);
        } catch(System.Exception e) {
            System.assert(false, UNEXPECTED_EXCEPTION);
        }
    }
    
    //delete this classes?
    @IsTest public static void testClassFromWSDL(){
        wsdlFromSoapService.CallOptions_element callOpt = new wsdlFromSoapService.CallOptions_element();
        wsdlFromSoapService.DebuggingHeader_element debHead = new wsdlFromSoapService.DebuggingHeader_element();
        wsdlFromSoapService.location location = new wsdlFromSoapService.location();
        wsdlFromSoapService.AllowFieldTruncationHeader_element allowField = new wsdlFromSoapService.AllowFieldTruncationHeader_element();
        wsdlFromSoapService.address address = new wsdlFromSoapService.address();
        wsdlFromSoapService.DebuggingInfo_element debugInfo = new wsdlFromSoapService.DebuggingInfo_element();
        wsdlFromSoapService.LogInfo logInfo = new wsdlFromSoapService.LogInfo();
    }
}