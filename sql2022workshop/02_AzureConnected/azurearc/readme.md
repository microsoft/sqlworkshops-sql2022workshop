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

