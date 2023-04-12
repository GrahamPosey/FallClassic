Global class JestScanCallback implements copado.MCCallback {
    Global void execute(copado__Function__c function, copado__Result__c result, String status) {
        if(status == 'Failed') {
            System.debug('Failed');
            System.debug('function' + function);
            System.debug('status' + status);
            System.debug('result' + result);
        } else if(status == 'Success') {
            System.debug('Passed');
            System.debug('function' + function);
            System.debug('status' + status);
            System.debug('result' + result);
        } else {
            System.debug('still running');
        }
    }
}