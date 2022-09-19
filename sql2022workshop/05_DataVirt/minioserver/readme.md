# Exercise for data virtualization and object storage using minio

**CAUTION**: This exercise uses non-Microsoft software that has "free" license to use for testing and development purposes only. This exercise should only be run in a testing environment and not with any production workload.

## Prerequisites

- SQL Server 2022 Evaluation Edition with the Database Engine and PolyBase Query Service for External Data Feature installed. You can use the defaults in setup for Polybase.
- VM or computer with 2 CPUs and at least 8Gb RAM.
- SQL Server Management Studio (SSMS). The latest 18.x build or 19.x build will work.

**CAUTION**: The following pre-requisites are for non-Microsoft software. The use of this software does not represent any official endorsement from Microsoft. This software is not supported by Microsoft so any issues using this software are up to the user to resolve.

- The **minio** server for Windows which you can download at https://min.io/download#/windows. For the exercise I assume you have created a directory called c:\minio and have downloaded the minio.exe for Windows into that directory.
- openssl for Windows which you can download at https://slproweb.com/products/Win32OpenSSL.html. I chose the Win64 OpenSSL v3.0.5 MSI option.

## Setup minio for the exercise

- Download minio.exe for Windows into c:\minio.exe
- Download the openssl for Windows MSI and run the installer. Use all the defaults.
- Set a system environment variable OPENSSL_CONF=C:\Program Files\OpenSSL-Win64\bin\openssl.cfg and add to the system environment variable PATH c:\Program Files\OpenSSL-Win64\bin
- Generate a private key using the following command from the c:\minio directory.

`openssl genrsa -out private.key 2048`

- Copy the supplied openssl.conf to c:\minio. Edit openssl.conf by changing IP.2 to your local IP address and DNS.2 to your local computer name.
- From the c:\minio directory run the following command to generate a self-signed certificate

`openssl req -new -x509 -nodes -days 730 -key private.key -out public.crt -config openssl.conf`

- Double-click the public.crt file and select Install Certificate. Choose Local Machine, Place all certificates in the following store, Browse, and select Trusted Root Certification Authorities.
- Copy the private.key and public.crt files from c:\minio into `%%USERPROFILE%%\`.minio\certs. (c:\Users`\<username>\`.minio\certs).

## Steps to use minio for the exercise

1. From a command prompt at the c:\minio directory start the minio server with the following command (example syntax for Powershell)

.\minio.exe server c:\minio --console-address ":9001"

This program will startup and "run forever" until stopped with <Ctrl>+<C>. Your output should look similar to the following (the IP addresses will match your local IP):

```
MinIO Object Storage Server
Copyright: 2015-2022 MinIO, Inc.
License: GNU AGPLv3 <https://www.gnu.org/licenses/agpl-3.0.html>
Version: RELEASE.2022-07-30T05-21-40Z (go1.18.4 windows/amd64)

Status:         1 Online, 0 Offline.
API: https://<local IP>:9000  https://127.0.0.1:9000
RootUser: <user>
RootPass: <password>
Console: https://<local IP>:9001 https://127.0.0.1:9001
RootUser: <user>
RootPass: <password>

Command-line: https://docs.min.io/docs/minio-client-quickstart-guide
   $ mc.exe alias set myminio https://<local IP>:9000 <user> <password>
``
Documentation: https://docs.min.io
```
1. Test your connection and browse the minio storage system using a web browser. Use the address https://127.0.0.1:9001. You should be presented with a login screen. Use the defaut root user and password which are displayed on the minio server screen.

**UNDER CONSTRUCTION**

1. On the left-hand side menu, click on Identity and Users. Select Create User. Create a user name with password. Select the readwrite policy for the user. This is the user and password you will use for the SECRET value in **creates3creds.sql**.
