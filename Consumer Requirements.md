# Consumer Requirements
This document contains requirements for the data share from the consumer perspective for {ENTER_ CONSUMER_HERE}. It does not touch on other important related requirements such as handling of data consumed from such services.

All new data shares should adhere to the recommendations defined in the Enterprise Data Architecture and other governing documentation. What is entered here might differ from what is actually provided and so it is important to understand such changes and their possible impact.

*Note: There should be a seperate document for each consumer. Feel free to suplement the points in this document with additional information as suitable*


## General

**What type of data object are you interested in?**

*[If you have any information about what this data can be retrieved from please include details]*

* Marine Operations Plan (possibly also called marine planning) for Johan Casberg, ref word document 
* Want johan sverdrup in next phase 
* Might be more marine planning objects in Safran or other systems for the same installation.
* Other software is being used for other installations.
* Safran can be used for detailed operations planning for fpso.

**Has any necessary LRA been performed for using this data, and what is the reference?**

Process started for multiple data objects 

The LRA includes possible data from other systems including:
* The localisation of a marine plan is a reference to a tag number and map id to get actual coordinates. 
* Arcgis data base has the coordinates, proprietary for castberg 

## Data Content

**Are there any specific expectations as to the format, structure or contents of the data?**

Tagnumber-format, date and times ref word doc… 

Date time format is important. 

Tobias checking for common standards for marine planing 

**What queries and operations are you expecting to be able to perform?**

*e.g. Create, Read, Update, Delete, GetXxx*

Read

**What expectations do you have in relation to data quality, including but not limited to the contents, missing data, validation and transformation**

Do not have high expectations 

Do not expect quality increase 

Expect to get the last time data was updated from source 

**Will you consume the data in it's entirety, or only a subset?**

*e.g. particular fields, a particular time period, a particular asset*

In its entirety for the given assets

Version 2 or 3 possible to get changes (since a given reference point)

Scenario 2 only need 3 values map_id, ? ? 

**Will you be aggregating the data, and if so at what level of granularity?**

May aggregate, store result, combine result with map hub query to get geo-graphical location, will be stored in local database for full data object 

**Do you need access to older versions of the data?**

No from both scenarios

## Communication

**How will you query the specified operations in terms of frequency and expected request / response size?**

* Query every 5 minutes or even every minute 
* Fetch the full dataset 
* Trigger / fetch an update of 'cached' data on demand? 

**Can you further optimise the querying of data through additional architecture layers?**

The application will cache the data and wont necessarylity affect our service 

**What are the preferred and maximum times you can wait before updates (originating from the original source, your application or elsewhere) are reflected in returned data?**

*Specify relative to the full lineage of the data, including any delay caused by manual steps* 

If possible every 5 minutes or every minute from Safran
Exit criteria is less than nightly updates 

**How do you hope to access the data (note API first guidelines)**?

*[e.g. API, DB query, File, Queue, ...]*

API

## Lifecycle

**Do you have any particular operational SLA requirements?**

Short outages will not affect end users, because they store data in application 

Try again in 10 minutes is ok. 

**Do you need any notifications or alerting and if so what for?**

*[e.g. on specific errors, non-triggered events, end-to-end, ... ]*

(Scenario 2)
If downtime email to Equinor employee 

**Do you have requirements outside the specified data share deprecation policy**

*[All data shares / API's should have a deprecation policy that mandates how quickly deprecated versions will be removed]*

Difficult to know now… 

## Other

Whilst not specifically requirements for the data share, you should also consider how it fits as part of your system. Amongst other points, you might consider:

**The lineage of the data and how this might impact usage?**

* Talked to Line on Safran, day to day responsible for marine planning for Castberg 
* Manual operation to get into safran 
* Calculations in safran, different marine operations, what is displayed is calculated 

Tagnumber, stid number, may come from drop down lists and free text fields. 

**Handling and impact of unavailability of the share**

**Handling and impact of missing, delayed or corrupted data**

**...other**

*This document is based upon a template from: https://github.com/equinor/data-engineering*
