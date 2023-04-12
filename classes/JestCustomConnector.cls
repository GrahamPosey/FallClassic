global with sharing class JestCustomConnector extends copado.AutomationConnector {
  	private copado.RunCopadoFunction.InvocableVariables functionRequest;
    global override List<copado.AutomationConnector> getConnectors(copado.AutomationConnectorContext context) {
        System.debug('Graham1');
        List<copado.AutomationConnector> connectors = new List<copado.AutomationConnector>();
        JestCustomConnector functionConnector = new JestCustomConnector();
        copado.RunCopadoFunction.InvocableVariables functionRequest = new copado.RunCopadoFunction.InvocableVariables();
        functionRequest.functionApiName = 'Jest_test';
        FunctionParameters parameters = new FunctionParameters();
        parameters.branch = 'dev1';
        //parameters.failedTestLimit = '1';
        functionRequest.parametersJSON = JSON.serialize(parameters);
        functionConnector.functionRequest = functionRequest;
        connectors.add(functionConnector);
        return connectors;
    }
    
    global override String executeAutomation() {
		String result;
        System.debug('Graham2');
        if (functionRequest != null) {
            result = copado.RunCopadoFunction.execute(new List<copado.RunCopadoFunction.InvocableVariables>{ functionRequest })[0];
        }
        return result;
    }
  
    global override String getAutomatedActionName() {
        return 'Jest Run';
    }
    private class FunctionParameters {
        private String branch;
        private String failedTestLimit;
    }

}