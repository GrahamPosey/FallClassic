{
  "recordTypeMap": {},
  "RecordSetBundles": [
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__ExtensionConfiguration__c",
            "url": "/services/data/v56.0/sobjects/copado__ExtensionConfiguration__c/a1M5w000007zXiVEAU"
          },
          "copado__AcceptanceCriteria__c": "{}",
          "copado__Active__c": true,
          "copado__ExtensionApplication__c": "Test",
          "copado__ExtensionTool__c": "CodeScan",
          "copado__Status__c": "Inactive",
          "copado__TestType__c": "CodeScan",
          "CurrencyIsoCode": "EUR",
          "Id": "a1M5w000007zXiVEAU",
          "LastReferencedDate": "2022-10-19T18:07:55.000+0000",
          "LastViewedDate": "2022-10-19T18:07:55.000+0000",
          "Name": "Code Scan"
        }
      ],
      "ObjectType": "copado__ExtensionConfiguration__c"
    },
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__Function__c",
            "url": "/services/data/v56.0/sobjects/copado__Function__c/a1S5w000004pOsUEAU"
          },
          "copado__API_Name__c": "Run_Code_Scan_1",
          "copado__Image_Name__c": "xieeoka6kixfqik4tc07hnxxigf50h-sfdx-codescan-plugin:v0.0.1-develop",
          "copado__Options__c": "[ ]",
          "copado__Parameters__c": "[ {\n  \"name\" : \"SERVER\",\n  \"defaultValue\" : \"\"\n}, {\n  \"name\" : \"PROJECT_ID\",\n  \"defaultValue\" : \"\"\n}, {\n  \"name\" : \"TOKEN\",\n  \"defaultValue\" : \"\"\n}, {\n  \"name\" : \"BRANCH\",\n  \"defaultValue\" : \"\"\n}, {\n  \"name\" : \"ORGANIZATION\",\n  \"defaultValue\" : \"\"\n}, {\n  \"name\" : \"git_json\",\n  \"defaultValue\" : \"{$Context.Repository.Credential}\"\n}, {\n  \"name\" : \"USER_STORY\",\n  \"defaultValue\" : \"\"\n} ]",
          "copado__Script__c": "#originBranch=$(jq -r '.originBranch' <<< $branchesAndFileIdJson)\n#BRANCH=\"$originBranch\"\n\n#echo \"param branchesAndFileIdJson =  $branchesAndFileIdJson\"\n#echo \"param originBranch = $originBranch\"\n\necho \"param TOKEN = $TOKEN\"\necho \"param SERVER = $SERVER\"\necho \"param PROJECT_ID = $PROJECT_ID\"\necho \"param ORGANIZATION = $ORGANIZATION\"\necho \"param BRANCH = $BRANCH\"\n\nif test -z \"${BRANCH:-}\"; then\n    BRANCH=\"feature/$USER_STORY\"\nfi\necho \"param BRANCH = $BRANCH\"\n\ncopado -p \"cloning repo...\"\ncopado-git-get $BRANCH\ncopado -p \"running codescan...\"\nexitCode=0\nsfdx codescan:run --token=$TOKEN --server=$SERVER --projectkey=$PROJECT_ID --organization=$ORGANIZATION -Dsonar.branch.name=$BRANCH --json 2>&1 | tee /tmp/result.json \\\n    || exitCode=$?\necho \"Codescan completed. exit code: $exitCode\"\ncopado -u /tmp/result.json\nexit $exitCode",
          "copado__Timeout__c": 300,
          "copado__Type__c": "Custom",
          "copado__Version__c": "1",
          "CurrencyIsoCode": "EUR",
          "Id": "a1S5w000004pOsUEAU",
          "LastReferencedDate": "2022-10-19T06:23:01.000+0000",
          "LastViewedDate": "2022-10-19T06:23:01.000+0000",
          "Name": "Run CodeScan"
        },
        {
          "attributes": {
            "type": "copado__Function__c",
            "url": "/services/data/v56.0/sobjects/copado__Function__c/a1S5w000004pPR0EAM"
          },
          "copado__ApexClass__c": "EvaluateCodeScanResult",
          "copado__API_Name__c": "Run_CodeScan_QIF",
          "copado__Callback_Type__c": "ApexClass",
          "copado__Description__c": "For the Quality Gate Engine only",
          "copado__Image_Name__c": "xieeoka6kixfqik4tc07hnxxigf50h-sfdx-codescan-plugin:v0.0.1-develop",
          "copado__Options__c": "[ ]",
          "copado__Parameters__c": "[ {\n  \"name\" : \"SERVER\",\n  \"defaultValue\" : \"\"\n}, {\n  \"name\" : \"PROJECT_ID\",\n  \"defaultValue\" : \"\"\n}, {\n  \"name\" : \"TOKEN\",\n  \"defaultValue\" : \"\"\n}, {\n  \"name\" : \"ORGANIZATION\",\n  \"defaultValue\" : \"\"\n}, {\n  \"name\" : \"git_json\",\n  \"defaultValue\" : \"{$Context.Repository.Credential}\"\n}, {\n  \"name\" : \"branchesAndFileIdJson\",\n  \"defaultValue\" : \"{$Job.PrevStep.ResultDataJson__c}\"\n} ]",
          "copado__Script__c": "originBranch=$(jq -r '.originBranch' <<< $branchesAndFileIdJson)\nBRANCH=\"$originBranch\"\n\necho \"param branchesAndFileIdJson =  $branchesAndFileIdJson\"\necho \"param originBranch = $originBranch\"\necho \"param TOKEN = $TOKEN\"\necho \"param SERVER = $SERVER\"\necho \"param PROJECT_ID = $PROJECT_ID\"\necho \"param ORGANIZATION = $ORGANIZATION\"\necho \"param BRANCH = $BRANCH\"\n\ncopado -p \"cloning repo...\"\ncopado-git-get $BRANCH\ncopado -p \"running codescan...\"\nexitCode=0\nsfdx codescan:run --token=$TOKEN --server=$SERVER --projectkey=$PROJECT_ID --organization=$ORGANIZATION -Dsonar.branch.name=$BRANCH --json 2>&1 | tee /tmp/result.json \\\n    || exitCode=$?\necho \"Codescan completed. exit code: $exitCode\"\ncopado -u /tmp/result.json\nexit $exitCode",
          "copado__Timeout__c": 300,
          "copado__Type__c": "Custom",
          "copado__Version__c": "1",
          "CurrencyIsoCode": "EUR",
          "Id": "a1S5w000004pPR0EAM",
          "LastReferencedDate": "2022-10-19T06:48:22.000+0000",
          "LastViewedDate": "2022-10-19T06:48:22.000+0000",
          "Name": "Run CodeScan QIF"
        }
      ],
      "ObjectType": "copado__Function__c"
    },
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__JobTemplate__c",
            "url": "/services/data/v56.0/sobjects/copado__JobTemplate__c/a1b5w00000EDH7UAAX"
          },
          "copado__ApiName__c": "Run_CodeScan_User_Story",
          "copado__Type__c": "Custom",
          "copado__Version__c": 1,
          "CurrencyIsoCode": "EUR",
          "Id": "a1b5w00000EDH7UAAX",
          "LastReferencedDate": "2022-10-19T12:09:39.000+0000",
          "LastViewedDate": "2022-10-19T12:09:39.000+0000",
          "Name": "Run CodeScan from User Story"
        },
        {
          "attributes": {
            "type": "copado__JobTemplate__c",
            "url": "/services/data/v56.0/sobjects/copado__JobTemplate__c/a1b5w00000EDH8UAAX"
          },
          "copado__ApiName__c": "Run_CodeScan_QIF_1",
          "copado__Type__c": "Custom",
          "copado__Version__c": 1,
          "CurrencyIsoCode": "EUR",
          "Id": "a1b5w00000EDH8UAAX",
          "LastReferencedDate": "2022-10-19T14:57:40.000+0000",
          "LastViewedDate": "2022-10-19T14:57:40.000+0000",
          "Name": "Run CodeScan QIF"
        }
      ],
      "ObjectType": "copado__JobTemplate__c"
    },
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a1a5w00001EEVmAAAX"
          },
          "copado__ApiName__c": "CodeScan_Run CodeScan_1",
          "copado__ConfigJson__c": "{\"functionName\":\"Run_Code_Scan_1\",\"parameters\":[{\"name\":\"SERVER\",\"value\":\"{$Pipeline.Property.CS_SERVER}\"},{\"name\":\"PROJECT_ID\",\"value\":\"{$Pipeline.Property.CS_PROJECT_ID}\"},{\"name\":\"TOKEN\",\"value\":\"{$Pipeline.Property.CS_TOKEN}\"},{\"name\":\"BRANCH\",\"value\":\"\"},{\"name\":\"ORGANIZATION\",\"value\":\"{$Pipeline.Property.CS_ORGANIZATION}\"},{\"name\":\"git_json\",\"value\":\"{$Context.Repository.Credential}\"},{\"name\":\"USER_STORY\",\"value\":\"{$Job.ExecutionParent.Name}\"}]}",
          "copado__CustomType__c": "Function",
          "copado__JobTemplate__c": "a1b5w00000EDH7UAAX",
          "copado__Order__c": 3,
          "copado__Type__c": "Function",
          "CurrencyIsoCode": "EUR",
          "Id": "a1a5w00001EEVmAAAX",
          "Name": "Run CodeScan"
        },
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a1a5w00001EEVrhAAH"
          },
          "copado__ApiName__c": "Run CodeScan_1_Execute PMD_3",
          "copado__ConfigJson__c": "{\"functionName\":\"Run_CodeScan_QIF\",\"parameters\":[{\"name\":\"SERVER\",\"value\":\"{$Pipeline.Property.CS_SERVER}\"},{\"name\":\"PROJECT_ID\",\"value\":\"{$Pipeline.Property.CS_PROJECT_ID}\"},{\"name\":\"TOKEN\",\"value\":\"{$Pipeline.Property.CS_TOKEN}\"},{\"name\":\"ORGANIZATION\",\"value\":\"{$Pipeline.Property.CS_ORGANIZATION}\"},{\"name\":\"git_json\",\"value\":\"{$Context.Repository.Credential}\"},{\"name\":\"branchesAndFileIdJson\",\"value\":\"{$Job.PrevStep.ResultDataJson__c}\"}]}",
          "copado__CustomType__c": "Function",
          "copado__JobTemplate__c": "a1b5w00000EDH8UAAX",
          "copado__Order__c": 4,
          "copado__Type__c": "Function",
          "CurrencyIsoCode": "EUR",
          "Id": "a1a5w00001EEVrhAAH",
          "Name": "Execute CodeScan"
        },
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a1a5w00001EEVriAAH"
          },
          "copado__ApiName__c": "Run CodeScan_1_Retrieve Branches and Ruleset File Id_2",
          "copado__ConfigJson__c": "{\"flowName\":\"copadoQuality.RetrieveBranchesAndFileIdForPMDScan\",\"parameters\":[{\"name\":\"testIds\",\"value\":\"{$Context.JobExecution__r.DataJson.testIds}\"},{\"name\":\"jobExecutionId\",\"value\":\"{$Context.JobExecution__c}\"},{\"name\":\"extensionConfigurationId\",\"value\":\"{$Context.JobExecution__r.DataJson.extensionConfigurationId}\"},{\"name\":\"consolidatedResultId\",\"value\":\"{$Context.JobExecution__r.DataJson.resultId}\"}]}",
          "copado__CustomType__c": "Salesforce Flow",
          "copado__JobTemplate__c": "a1b5w00000EDH8UAAX",
          "copado__Order__c": 3,
          "copado__Type__c": "Flow",
          "CurrencyIsoCode": "EUR",
          "Id": "a1a5w00001EEVriAAH",
          "Name": "Retrieve Branches and Ruleset File Id"
        },
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a1a5w00001EEVrjAAH"
          },
          "copado__ApiName__c": "Run CodeScan_1_Set Repository For Scan_1",
          "copado__ConfigJson__c": "{\"flowName\":\"copadoQuality.SetRepositoryForPMDScan\",\"parameters\":[{\"name\":\"testIds\",\"value\":\"{$Context.JobExecution__r.DataJson.testIds}\"},{\"name\":\"jobStepToUpdate\",\"value\":\"{$Job.Step.Execute CodeScan.Id}\"}]}",
          "copado__CustomType__c": "Salesforce Flow",
          "copado__JobTemplate__c": "a1b5w00000EDH8UAAX",
          "copado__Order__c": 1,
          "copado__Type__c": "Flow",
          "CurrencyIsoCode": "EUR",
          "Id": "a1a5w00001EEVrjAAH",
          "Name": "Set Repository For Scan"
        },
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a1a5w00001EEW1jAAH"
          },
          "copado__ApiName__c": "Run_CodeScan_QIF_1_Get Parent Execution Context_5",
          "copado__ConfigJson__c": "{\"flowName\":\"Carry_Orchastrator_Job_Execution_Context\",\"parameters\":[{\"name\":\"jobExecutionId\",\"value\":\"{$Job.FirstStep.copado__JobExecution__c}\"},{\"name\":\"testIds\",\"value\":\"{$Context.JobExecution__r.DataJson.testIds}\"},{\"name\":\"consolidatedResultId\",\"value\":\"{$Context.JobExecution__r.DataJson.resultId}\"}]}",
          "copado__CustomType__c": "Salesforce Flow",
          "copado__JobTemplate__c": "a1b5w00000EDH8UAAX",
          "copado__Order__c": 2,
          "copado__Type__c": "Flow",
          "CurrencyIsoCode": "EUR",
          "Id": "a1a5w00001EEW1jAAH",
          "Name": "Get Parent Execution Context"
        }
      ],
      "ObjectType": "copado__JobStep__c"
    }
  ],
  "blobsByUID": {}
}