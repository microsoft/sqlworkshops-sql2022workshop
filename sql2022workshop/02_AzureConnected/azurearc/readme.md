# Exercise for configuring and using an Azure Arc-enabled SQL Server 2022

Exercise for configuring and using an Azure Arc-enabled SQL Server 2022 instance.

## Prereqs

- A virtual machine or computer with at least 2 CPUs and 8Gb RAM and be connected to Azure over the internet or proxy.**Note:** You can use an Azure Virtual Machine for this exercise if you go through the following steps: <https://learn.microsoft.com/azure/azure-arc/servers/plan-evaluate-on-azure-virtual-machine>
- SQL Server 2022 Evaluation or Developer Edition. Do not run setup. Use the steps below to run setup to configure Azure Arc.
- An account with and Azure Subscription that has permissions to either create a resource group or be a contributor role for an existing resource group.
- The following Azure Resource Providers must be registered in your Azure subscription
    - Microsoft.AzureArcData
    - Microsoft.HybridCompute<br>
Refer to the following documentation to register these resource providers: <https://learn.microsoft.com/sql/sql-server/azure-arc/connect?view=sql-server-ver16&tabs=azure%2Cwindows#prerequisites>
- SQL Server Management Studio (SSMS). The latest 18.x build or 19.x build will work.

## Use SQL Server 2022 setup to connect to Azure

Use the following steps to configure Azure Arc during the SQL Server 2020 setup process: <https://learn.microsoft.com/sql/database-engine/install-windows/install-sql-server-from-the-installation-wizard-setup?view=sql-server-ver16#install-sql-server-2022>.You can choose Pay-as-you-go Licensing first and then configure all the correct properties for the Azure Extension for SQL Server.

If you already have SQL Server 2022 installed, you can use the following process to connect to Azure: https://learn.microsoft.com/sql/sql-server/azure-arc/connect

For Linux users you can connect SQL to Azure Arc after installation. Learn more at <https://learn.microsoft.com/sql/sql-server/azure-arc/connect?view=sql-server-ver16&tabs=azure%2Clinux#when-the-machine-isnt-connected-to-an-arc-enabled-server>

## Using Azure Arc-enabled SQL Server

Go through the following examples to see capabilities with Azure Arc-enabled SQL Server. After this you can go through examples for Azure Active Directory (AAD) authentication at [aad](../aad/readme.md) or Microsoft Purview at [purview](../purview/readme.md).

### Portal and inventory

1. Login in to the Azure Portal after connecting SQL Server 2022 to Azure.
1. Search at the top of the portal for "Servers - Azure Arc". Select **Servers - Azure Arc** from Services.
1. Click in the name of your computer or VM in the list
1. Browse the Overview screen for properties of your OS and computer or VM
1. Perform the same search for "SQL Server - Azure Arc". Select **SQL Server - Azure Arc** from Services.
1. Click on the name of your computer or VM in the list
1. Browse the Overview screen to see what properties are list for the SQL Server instance.
1. On the left hand menu click on Databases. View the list of databases, including system databases, seen on your instance an and properties including Earliest Restore Time which is based on your backups detected. Click on any database. View the information about the database collected. This information is refreshed periodically every 60 minutes.
1. To see an inventory list across instances and/or databases you can use **Resource Graph Explorer**. Example scripts to inventory listed are provided including **kql_instances.txt** and **kql_databases.txt**. 
    1. Learn more about basics of using Azure Resource Graph Explorer at <https://learn.microsoft.com/azure/governance/resource-graph/first-query-portal>
    1. A full list of properties for SQL instances and databases can be found at <https://learn.microsoft.com/azure/templates/microsoft.azurearcdata/sqlserverinstances> and <https://learn.microsoft.com/azure/templates/microsoft.azurearcdata/sqlserverinstances/databases>

### Best Practices Assessment (BPA)

Best Practices Assessment (BPA) is a service to scan the configuraiton (not user data) of your SQL Server instance and databases and look for possible issues that could affect performance, availability, or security.

Carefully read and go through the sections for Prerequisites and Enable best practices assessment to setup BPA. This will require permissions to create a Log Analytics Workspace. Follow each step carefully to ensure BPA will be enabled.

1. Once BPA is enabled, click on **Run Assessment**. It could take up to 5-10 minutes before any results are available.
1. When the assessment is done, the Status field in the list will say completed. Click on the date/time of the assessment
1. You can now review all the assessment rules that were detected categorized by priority and at the instance or database level. BPA even includes trends and insights for the most common rules.

You can read more information about the API behind BPA and full list of possible rules at <https://learn.microsoft.com/sql/tools/sql-assessment-api/sql-assessment-api-overview>