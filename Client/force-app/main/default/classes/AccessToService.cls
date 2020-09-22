public with sharing class AccessToService {
    
    public static String SERVER_BASE_URL = 'https://service-soap-dev-ed.my.salesforce.com';
    
    private static String CONSUMER_KEY = '3MVG9n_HvETGhr3Dhguxk_PY7SNDCMofBfsHxu1z.r_BplKJBWuhWwWVLC_7wXf334Oc9FB2hm8eRmXI6Ho66';
    private static String CONSUMER_SECRET = 'E0800B13850876100728D518400132F693D989FD58E46C74B5241ED86FFDEA12';
    private static String USERNAME = 'soap-service-wiki@none.com';
    private static String PASSWORD = 'Betelgeyze1488';
    
    private static String TOKEN_URL = 'https://login.salesforce.com/services/oauth2/token';
    
    private static Datetime lastAcsessTime = Datetime.newInstance(1998, 4, 28, 0, 0, 0);
    private static String token = '';
    
    public static String getToken() {
        Datetime expiredTime = lastAcsessTime.addMinutes(30);
        
        if(expiredTime < Datetime.now()) {
            token = refreshToken();
        }
        
        return token;
    }
    
    public static String refreshToken() {
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setHeader('Content-Type','application/x-www-form-urlencoded');
        request.setEndpoint(TOKEN_URL);
        
        String requestBody = 'grant_type=password&client_id='+ CONSUMER_KEY + 
            '&client_secret=' + CONSUMER_SECRET + 
            '&username='+ EncodingUtil.urlEncode(USERNAME, 'UTF-8') + 
            '&password='+ PASSWORD;
        
        request.setBody(requestBody);
        
        Http http = new Http();
        HTTPResponse response = http.send(request);
        System.debug(response);
        
        OAuth2 authInfo = (OAuth2) JSON.deserialize(response.getBody(), OAuth2.class);
        System.debug(authInfo.access_token);
        
        lastAcsessTime = Datetime.now();
        
        return authInfo.access_token;
    }
}