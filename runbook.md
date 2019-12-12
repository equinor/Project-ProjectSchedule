# {Data flow name} Operational Runbook
## Introduction
This runbook captures underlying requirements and provides the complete operational documentation of the {Data flow name}. 

The {Data flow name} data flow... *[brief summary of functionality including key systems, flow and access interface]*.

### Purpose

This document should be used to understand how the system is configured and functions, including how to perform system administrative tasks. The primary audience for this document are personnel responsible for managing and operating the system and consumers wanting additional insight. 

### Authoring Guidelines

To assist in filling out the runbook correctly, the following applies: 


* *Use this as a working document and aim to capture information and decisions as you go along to help guide the design and implementation. In particular the 'Overview' and 'Solution Requirements & Specification' sections should be completed as early as possible*
* *Italicized text throughout the template is provided as background information to assist in creating the document. In the final version of the document, this text must be removed and/or replaced by system-specific information.*
* Existing chapters or subchapters shall not be deleted. If a subchapter is considered irrelevant for the system, this must be specified in the body text of the subchapter.  
* New subchapters can be added as required. When doing so, the table of contents must be updated. 
* Linking to SOPs and information stored in other systems is encouraged.  
* No sensative or confidential information shall be entered in the runbook itself (although referenced SOPs, with appropriate access control, can contain this type of information). This limitation applies to passwords etc. that should be held in a secured key vault.

### Legal

This document contains information that is proprietary to Equinor ASA. Neither the document nor the information contained therein should be disclosed or reproduced in whole or in part, without express written consent of Equinor ASA.  

The document and the information it contains shall be handled according to Equinor’s information classification scheme. 

## Overview

> :warning: THIS SECTION IS A WORK IN PROGRESS!

Source Type: *[Source Type]*

Transfer Type: *[​Full|Delta]*

Transfer Frequency: *[​​Weekly/Daily/Hourly/(higher frequency)]*

Transfer ​Orchestration: *[​System component type]*

​Destination: *[​OMNIA component type(s)]* 

​Criticality: *[​High|Medium|Low]*

​Security classification: *[​Open|Internal|Restricted|Confidential]*

Gateway: *[System component name]*

DevOps Organisation: *[DevOps Organisation name]*

## Solution Requirements & Specification

> :warning: THIS SECTION IS A WORK IN PROGRESS!

This section captures key decisions and information relating to the design of the data flow / data share. All new data flows should adhere to the recommendations defined in the Enterprise Data Architecture and other governing documentation.

### General

**What type(s) of data needs to be transferred to OMNIA? Provide a brief description.**

**Has any necessary LRA been performed for making the data available and if necessary for usage, and what is the reference?**

**What Data Area does the data belong to?**

*[[Data areas](https://eita.equinor.com/companyea/?oid=bd7e452f-a8be-43f7-86fa-9513b8ce95a9) form the basis for naming, ownership and more]*

**What is the master data source from where data should be referenced?**

**Describe the lineage of data and how this might impact usage?**

**What is the data format/interface (e.g. Oracle DB, SQL DB, API)?**

**Are there several instances (e.g. databases) of the system(s)? If Yes, should data in any other instance(s) also be collected?**

**Do you know of any other systems in use by Equinor containing the same type(s) of data? If Yes, should the data from these systems also be collected?**

**Which format should the data have in OMNIA after transfer (e.g. DB or file type)?**

### Contents

**Is any data model/documentation available? If Yes, provide link(s) to relevant model(s)/documentation.**

**Are any of the data included affected by the General Data Protection Regulation (GDPR)? If Yes, describe which data.**

**Are there any specific expectations as to the format, structure or contents of the data?**

**What fields and sources for master data are available?**

**What queries and operations are being offered?**

*e.g. Create, Read, Update, Delete, GetXxx*

??**What expectations do you have in relation to data quality, including but not limited to the contents, missing data, validation and transformation**

??**Will you provide the source data in it's entirety, or only a subset?**

*e.g. a particular time period, a particular asset*

??**Will you be aggregating the data, and if so at what level of aggregation / granularity?**

??**Do you need access to older version of the data?**

??*if copying how to ensure multiple updates between individual copies are recorded*

### Communication

??**What are the preferred and maximum times you can wait before updates (either through the original application, your application or elsewhere) are reflected in returned data?**

??**How do you hope to access the data (note API first guidelines)**?

e.g. API, DB query, File, Queue, ...

??**Performance considerations or limitations that might affect the frequency, query pattern or volue of data returned?**

How often should the data be refreshed in OMNIA (e.g. hourly, daily, weekly)?	

Should data deleted in the source after transfer also be deleted in OMNIA?	

For how long should any time series of the data be available in OMNIA?	

What is the estimated size of the data set added on a refresh (delta load)?	

What is the estimated size of the maximum/full data set to be transferred?	

Does the data source include data about when it was last updated?	

Should any filters be applied before the transfer?

++ Copy provenance and missing updates between copies

### Lifecycle

**Do you have any particular operational SLA requirements?**

**Do you need any notifications or alerting and if so what for?**

e.g. on specific errors, non-triggered events, end-to-end, ... 

**Do you have requirements outside the specified data share deprecation policy**



## Architecture

### Architecture overview 

The main components in the system architecture are described in the table below. All components are OMNIA resources, with the exception of the *[summary of the exception(s)]*: 

*[paste system diagram here]*

#### Components

The main components of the {Data flow name} data flow are: 

* *[list the main components]*

#### Design Notes

*[Any notes about the data flow design.]*

#### *[Component Type]*
##### *[Feature]*
* *[Name]* - *[Usage]*
* *[Name]* - *[Usage]*

#### *[Component Type]*
##### *[*Feature*]*
* *[Name]* - *[Usage]*
* *[Name]* - *[Usage]*


### Hardware 

This data flow uses shared hardware components only. 

See also [Interfaces and dependencies](#interfaces-and-dependencies) for an overview of shared hardware components used. 

### Software 

#### *[Component Type]*
* Name - *[Name]*
* Subscription - *[Name]*
* Resource Group - *[Name]*
* Usage - *[Dev|Test|Prod]*
* Criticality - *[Low|Medium|High]*

#### *[Component Type]*
* Name - *[Name]*
* Subscription - *[Name]*
* Resource Group - *[Name]*
* Usage - *[Dev|Test|Prod]*
* Criticality - *[Low|Medium|High]*
See also [Interfaces and dependencies](#interfaces-and-dependencies) for an overview of shared software components used. 

### Data 

#### *[Name - (Classification[Open|Internal|Restricted|Confidential]) ]*
*[Description]*<br/>
Location: *[Cloud| On-prem]*<br/>
Data Catalog: *[Data Catalog Link]*

#### *[Name - (Classification[Open|Internal|Restricted|Confidential]) ]*
*[Description]*<br/>
Location: *[Cloud| On-prem]*<br/>
Data Catalog: *[Data Catalog Link]*

### Interfaces and dependencies 

The data flow is dependent on the following components (all OMNIA resources, except the *[exception(s>]*: 

#### *[Component Type]*
* Name - *[Name]*
* Subscription - *[Name]*
* Resource Group - *[Name]*
* Usage - *[Dev|Test|Prod]*
* Criticality - *[Low|Medium|High]*

#### *[Component Type]*
* Name - *[Name]*
* Subscription - *[Name]*
* Resource Group - *[Name]*
* Usage - *[Dev|Test|Prod]*
* Criticality - *[Low|Medium|High]*

### Test and quality assurance 

The test environment (see component descriptions in '[Software](#software)' and '[Interfaces and dependencies](#interfaces-and-dependencies)') is used for testing and quality assurance of the data flow. It is not used for testing data quality (integrity) after transfer. This is done in the development and production environments. The Data flow delivery checklist is used for quality assurance and control. 

## Configuration 

### System configuration 

#### Configuration, custom code and deployment scripts 

Essential configuration data are included on the first page in this document. The files containing the detailed definition and configuration of the Azure components described in [Architecture Overview](#architecture-overview) are all stored in the *[Github Repository]* GitHub. This also includes deployment scripts and instructions. 

[If relevant:] App properties/settings are provided in the table below. 

#### *[App Name]*
* *[Property Name]* - *[Value / description]*
* *[Property Name]* - *[Value / description]*

#### *[App Name]*
* *[Property Name]* - *[Value / description]*
* *[Property Name]* - *[Value / description]*

\* Note: don't include passwords or other sensitive information here.

### Security Configuration 

#### *[Component Type]*
* *[Name or 'See [Software](#software)']* - *[Access permissions description]*
* *[Name or 'See [Software](#software)']* - *[Access permissions description]*

#### *[Component Type]*
* *[Name or 'See [Software](#software)']* - *[Access permissions description]*
* *[Name or 'See [Software](#software)']* - *[Access permissions description]*

## Operations 

### Change Management 

Change management is incorporated in Data Lakers’ daily task management. The Data flow delivery checklist is used for quality assurance and control. The checklists documents who has been involved as developers and reviewers. 

The change/release history is managed through releases in Github. 

### Access Management 

Access permissions for all Azure components except the SQL databases are managed using groups in Azure Active Directory, through the Azure portal. SQL database users and permissions are defined using SSMS. 

All members of Data Lakers have administrator access to all system components in the development and test environments. Selected members have administrator access in the production environment. Access permissions outside Data Lakers are specified in the [Security configuration](#security-configuration) section. 

### Operational Monitoring 

Azure Log Analytics and the common OMNIA transfer log API are used for monitoring the data flow. 

### Functional updates 

The standard operating procedure (SOP) (link to be included) should be followed for deployment of functional updates in the system. Version specific deployment instructions are available in the DataLakers GitHub repository as described in the [System Configuration](#system-configuration) section. 

### Capacity management 

Capacity configuration of the software component(s) specified in the [Software](#software) section must be discussed and clarified with the OMNIA core team. 

### Backup and restore 

Refer to procedures for OMNIA (link to be included). 

### Decommissioning 

Refer to procedures for OMNIA (link to be included). 

### Troubleshooting 

No specific tools or procedures are established, neither for error reporting nor management of enquiries from users. 

*[Or enter any procedures (actions) below – for each specific issue (case):]*

#### Case title
*[Actions description]*

#### Case title
*[Actions description]*

## Security 

### Risk assessment 

Security risk assessment (SRA) has been done for all software components used. See [overview in OMNIA wiki](https://dataplatformwiki.azurewebsites.net/develop/componentoverview). 

### Vulnerability assessment 

Refer to Standard Operating Procedure (SOP) – Vulnerability Management. 

### Security updates 

Refer to procedures for OMNIA (link to be included) and [KB0035618](https://equinor.service-now.com/selfservice?id=kb_article&sys_id=6a5048ba4f97e2c0bd03ce318110c7f9). 

### Security monitoring 

Refer to procedures for OMNIA (link to be included). 

### Incident handling 

Refer to [SF103 - Handle safety and security incident](http://aris.statoil.no/?objectguid=f9469e01-b2be-11e0-43e7-828060af7619).  

## Disaster recovery 

### Disaster recovery 

Refer to procedures for OMNIA (link to be included). 

### Business continuity 

Refer to plan for OMNIA (link to be included). 

## Service level agreements 

No service level agreement (SLA) is established for this system. Refer to SLA for OMNIA (link to be included). 

### Operational Responsibilities
Incidents and Requests are handled in Services@Equinor, and using the CI named *[CI Name]* in the assignment group *[assignment group name]*.

## How We Work

### General Data Engineering Best Practices
For common Data Engineering practices, see [this wiki page](https://wiki.equinor.com/wiki/index.php/Data_engineering/How_we_work).

### Team Specific Practices

*[Enter team specific working practices]*
 
### Agile method

*[Enter agile methodoligy and practices e.g.:]*

*[Omniators works in 2-week iterations, with daily stand-ups every working day. Demo meetings are held after each iteration, with stakeholders and team members. Retrospective and review sessions are team internal. Backlog grooming includes team members and PO. All User Stories are estimated by team members. Tasks are organized and managed in Azure DevOps.]*

## Regulatory compliance 

### Sarbanes-Oxley Act (SOX) 

Not applicable. 
