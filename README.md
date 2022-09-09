
![](./sql2022workshop/graphics/microsoftlogo.png)

# Workshop: The SQL Server 2022 Workshop (Preview)

#### <i>A Microsoft Course from the SQL Server team</i>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/textbubble.png?raw=true"><b>     About this Workshop</b></h2>

Welcome to this Microsoft solutions workshop on *SQL Server 2022 Workshop*.

In this course you will learn how to solve modern data challenges with SQL Server 2022 using a hands-on lab approach.

This course is intended to be taken as a self-paced or instructor-led workshop. A supplement slide deck is available for this course in the [slides](https://github.com/microsoft/sqlworkshops-sql2022workshop/tree/master/sql2022workshop/slides) folder.

This course is designed for data professionals who have a basic working knowledge of SQL Server and the T-SQL language.

This **README.MD** file explains how the lab is structured, what you will learn, and the technologies you will use in this solution.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/checkmark.png?raw=true"><b>     Learning Objectives</b></h2>

When you complete this course, you will be able to:

- XXXXX

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2>
<img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/building1.png?raw=true"><b>     Business Applications of this Workshop</b></h2>

- Boost Database Performance with no application changes
- Ensure data is highly available to outages that can disrupt your business.
- Reduce costs of expensive data movement applications
- Learn how to extend the T-SQL language to meet the needs of your application.
- Learn tools and techniques to modernize and migrate to SQL Server 2022.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/listcheck.png?raw=true"><b>     Technologies used in this Workshop</b></h2>

 <table style="tr:nth-child(even) {background-color: #f2f2f2;}; text-align: left; display: table; border-collapse: collapse; border-spacing: 2px; border-color: gray;">

<tr><th style="background-color: #1b20a1; color: white;">Technology</th> <th style="background-color: #1b20a1; color: white;">Description</th></tr>

<tr><td><i>SQL Server</i></td><td>Database Platform released and sold by Microsoft</td></tr>
<tr><td><i>SQL Server 2022</i></td><td>Most current release of SQL Server</td></tr>
<tr><td><i>Intelligent Query Processing</i></td><td>Automated query processing enhancements in SQL Server 2022</td></tr>
<tr><td><i>Query Store</i></td><td>Built-in query performance execution statistics stored in a user database</td></tr>
<tr><td><i>Polybase</i></td><td>Data Virtualization through external tables</td></tr>
<tr><td><i>SQL Server Management Studio (SSMS)</i></td><td>Graphical User Interface Management and Query Tool</td></tr>
<tr><td><i>Azure Data Studio<i></td><td>Graphical User Interface to execute T-SQL queries, notebooks, and manage SQL Server</td></tr>

</table>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/owl.png?raw=true"><b>     Before Taking this Workshop</b></h2>

To complete this workshop you will need the following:

- Clone the workshop using git from https://github.com/microsoft/sqlworkshops-sql2022workshop.git. All the scripts and files in the labs are found in the **sql2022workshop** folder.
- Install the software as listed in the **Setup** section below

Each module of this workshop can be studied and used independently of each other or taken all as a single lab. The Modules are designed in a sequence but you can use each of them one at a time at your own pace.

<h3><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/bulletlist.png?raw=true"> 
<b>     Setup</b></h3>

In order to complete the exercises in this workshop you will need the following:

- A virtual machine or computer running Windows 10, Windows 11, Windows Server 2019, or Windows 2022 with at least **4 CPUs and 8Gbm RAM**. You will need Administrator rights on the virtual machine or computer.
- **SQL Server 2022 Evaluation Edition RC0 or later Preview** (https://aka.ms/getsqlserver2022) with the Database Engine feature installed. Exercises in Module 5 require the PolyBase Query Service for External Data Feature. In Module 5 you have the option to review Azure Data Studio notebooks instead of going through the exercises. **You must configure SQL Server for mixed mode authentication**.
- Install **SQL Server Management Studio (SSMS)** latest 18 or 19 build from https://aka.ms/ssms18 or https://aka.ms/ssms19. Several of the modules require features built only into SSMS. You may have a better experience in some modules with new features of SSMS 19.
- Install **Azure Data Studio (ADS)** from https://aka.ms/azuredatastudio. T-SQL notebooks are used in this course.
- The **WideWorldImporters** sample backup from https://aka.ms/WideWorldImporters. Many of the exercises have a script which by default restores the WideWorldImporters backup from the c:\sql_sample_databases folder.
- Download **ostress.exe** by downloading RML utilities from https://aka.ms/ostress. Install using the RMLSetup.msi file that is downloaded. Use all defaults.

Microsoft and any contributors grant you a license to the Microsoft documentation and other content
in this repository under the Creative Commons Attribution 4.0 International Public License,
see the LICENSE file, and grant you a license to any code in the repository under the MIT License, see the
LICENSE-CODE file. All license files are found in the LICENSE directory.

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/education1.png?raw=true"><b>     Workshop Details</b></h2>

This workshop uses SQL Server 2022, SQL Server Management Studio, Azure Data Studio, Azure SQL Managed Instance, Azure Synapse Analytics, Azure Active Directory (AAD), and Microsoft Purview you to learn how you can solve new challenges with SQL Server 2022.

<table style="tr:nth-child(even) {background-color: #f2f2f2;}; text-align: left; display: table; border-collapse: collapse; border-spacing: 5px; border-color: gray;">

  <tr><td style="background-color: Cornsilk; color: black; padding: 5px 5px;">Primary Audience:</td><td style="background-color: Cornsilk; color: black; padding: 5px 5px;">Data professionals looking to understand and use new capabilities of SQL Server 2022</td></tr>
  <tr><td>Secondary Audience:</td><td>Developers, Architects, IT Pros, Data Scientists, and Data Engineers</td></tr>
  <tr><td style="background-color: Cornsilk; color: black; padding: 5px 5px;">Level: </td><td style="background-color: Cornsilk; color: black; padding: 5px 5px0;">300</td></tr>
  <tr><td>Type:</td><td>Self-Paced or Instructor Led</td></tr>
  <tr><td style="background-color: Cornsilk; color: black; padding: 5px 5px;">Length: </td><td style="background-color: Cornsilk; color: black; padding: 5px 5px;">Full Day</td></tr>

</table>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/pinmap.png?raw=true"><b>     Related Workshops</b></h2>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/bookpencil.png?raw=true"><b>     Workshop Modules</b></h2>

This is a modular workshop, and in each section, you'll learn concepts, technologies, and processes to help you complete the solution. This table is provided for you to see the list of modules in the workshop. You can use any module in any order you like but the preferred method is to **proceed to Next Steps below to start the workshop.**

<table style="tr:nth-child(even) {background-color: #f2f2f2;}; text-align: left; display: table; border-collapse: collapse; border-spacing: 5px; border-color: gray;">

  <tr><td style="background-color: AliceBlue; color: black;"><b>Module</b></td><td style="background-color: AliceBlue; color: black;"><b>Topics</b></td></tr>

  <tr><td ><a href="./sql2022workshop/01_Introduction.md" target="_blank">01 - Introduction to SQL Server 2022</a></td><td> Learn how SQL Server 2022 solves challenges for the data professional</td></tr>
  <tr><td><a href="./sql2022workshop/02_AzureConnected.md" target="_blank">02 - Connect SQL Server 2022 to Azure</a></td><td> Learn the how SQL Server is a hybrid data platform connecting to Azure services</td></tr>
  <tr><td><a href="./sql2022workshop/03_BuiltinQueryIntelligence.md" target="_blank">03 - Accelerate performance with built-in query intelligence</a> </td><td >Learn how to get faster with no code changes</td></tr>
  <tr><td><a href="./sql2022workshop/04_Engine.md" target="_blank">04 - Power your database with security, scalability, and availability</a></td><td>Learn the new capabilities of the industry proven SQL Server engine</td></tr>
  <tr><td ><a href="./sql2022workshop/05_DataVirt.md" target="_blank">05 - Access new sources with data virtualization and object storage</a></td><td> Learn the new data virtualization and object storage capabilities</td></tr>
  <tr><td><a href="./sql2022workshop/06_TSQL.md" target="_blank">06 - Enhance your application with new T-SQL capabilities</a></td><td>Learn the new T-SQL enhancements for new application scenarios</td></tr>
  <tr><td><a href="./sql2019workshop/07_summary.md" target="_blank">07 - Summary</a></td><td>Get more resources and next steps for SQL Server 2022</td></tr>
</table>

<p style="border-bottom: 1px solid lightgrey;"></p>

<h2><img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/microsoft/sqlworkshops/blob/master/graphics/geopin.png?raw=true"><b>     Next Steps</b></h2>

Next, Continue to <a href="./sql2022workshop/02_Introduction.md" target="_blank"><i>Introduction to SQL Server 2022</i></a>

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft 
trademarks or logos is subject to and must follow 
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.
