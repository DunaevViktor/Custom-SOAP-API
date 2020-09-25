//Mock class for testing SoapClient class
@IsTest global with sharing class SoapClientMock implements WebServiceMock {
    global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        
        wsdlFromSoapService.upsertDataResponse_element response_x = new wsdlFromSoapService.upsertDataResponse_element();
        response.put('response_x', response_x); 
   }
}