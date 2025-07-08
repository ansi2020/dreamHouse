public with sharing class ISCAuthService {
    private static final String TOKEN_URL = 'https://api.iscoutreach.io/auth/connect/token';
    private static final String CLIENT_ID = 'YOUR_CLIENT_ID';
    private static final String CLIENT_SECRET = 'YOUR_CLIENT_SECRET';
    private static final String GRANT_TYPE = 'client_credentials';
    private static final String SCOPE = 'api-read';

    public static String getAccessToken() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(TOKEN_URL);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        
        String body = 'client_id=' + CLIENT_ID + 
                      '&client_secret=' + CLIENT_SECRET + 
                      '&grant_type=' + GRANT_TYPE + 
                      '&scope=' + SCOPE;
        req.setBody(body);
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        
        if (res.getStatusCode() == 200) {
            Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            return (String) responseMap.get('access_token');
        } else {
            System.debug('Failed to get access token: ' + res.getBody());
            return null;
        }
    }
}