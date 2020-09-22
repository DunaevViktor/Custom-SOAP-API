@IsTest public with sharing class AccessToServiceTest {
    
    private static String TEST_TOKEN = 'tOkEnFoRtEsT';
    private static String INVALID_TOKEN = 'Actual token doesn\'t equal to expected';

    @IsTest public static void testGetToken() {

        Test.setMock(HttpCalloutMock.class, new AccessToServiceMock()); 
        String token = AccessToService.getToken();

        System.assertEquals(TEST_TOKEN, token, INVALID_TOKEN);
    }
}