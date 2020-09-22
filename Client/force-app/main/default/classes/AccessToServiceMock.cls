@IsTest global with sharing class AccessToServiceMock implements HttpCalloutMock{
    private static String ID = 'https://test.id';
    private static String TEST_TOKEN = 'tOkEnFoRtEsT';
    private static String ISSUED_AT = '11111';
    private static String INSTANCE_URL = 'https://instance.url';
    private static String SIGNATURE = 'signature=';

    global HTTPResponse respond(HTTPRequest request) {
        OAuth2 oath2 = new OAuth2(ID, ISSUED_AT, INSTANCE_URL, SIGNATURE, TEST_TOKEN);

        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody(JSON.serialize(oath2));
        response.setStatusCode(200);
        return response;
    }
}