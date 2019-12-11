# Consumer Requirements
This document contains requirements for the data share from the consumer perspective. It does not touch on other important related requirements such as handling of data consumed from such services.

All new data shares should adhere to the recommendations defined in the Enterprise Data Architecture and other governing documentation. What is entered here might differ from what is actually provided and so it is important to understand such changes and their possible impact.

*Note: There should be a seperate document for each consumer. Feel free to suplement the points in this document with additional information as suitable*


## General

**Has any necessary LRA been performed for using this data, and what is the reference?**

**Are you familiar with the lineage of the data, up-to and including the data share, and how this might impact usage?**


## Contents

**Are there any specific expectations as to the format, structure or contents of the data?**

**What queries and operations are you expecting to be able to perform?**

*e.g. Create, Read, Update, Delete, GetXxx*

**What expectations do you have in relation to data quality, including but not limited to the contents, missing data, validation and transformation**

**Will you consume the data in it's entirety, or only a subset?**

*e.g. a particular time period, a particular asset*

**Will you be aggregating the data, and if so at what level of aggregation / granularity?**

**Do you need access to older version of the data?**


## Communication

**How will you query the specified operations in terms of frequency and expected request / response size?**

**Can you further optimise the querying of data through additional architecture layers?**

**What are the preferred and maximum times you can wait before updates (either through the original application, your application or elsewhere) are reflected in returned data?**

**How do you hope to access the data (note API first guidelines)**?

e.g. API, DB query, File, Queue, ...


## Lifecycle

**Do you have any particular operational SLA requirements?**

**Do you need any notifications or alerting and if so what for?**

e.g. on specific errors, non-triggered events, end-to-end, ... 

**Do you have requirements outside the specified data share deprecation policy**


## Other

Whilst not specifically requirements for the data share, you should also considerhow it fits as part of your system. Amongst other points, yo umight consider:

* Handling and impact of unavailability of the share
* Handling and impact of missing, delayed or corrupted data
