# Data consumer requirements #
Template for the requirements put forth by the data consumer. 
There can be one document per consumer and this will guide the data provider on how to best make data available.

**Is the data named and stored such that it reflects the Data Area as described in EITA?**

**Is the data conformed such that it uses relevant Equinor Reference Data standards, including:**
- Timestamps (e.g. RFC3339 - https://tools.ietf.org/html/rfc3339)
- UoM
- CRS / geo stamp
- Elevations
- …

**Is the data conformed such that it uses relevant Equinor Reference Data naming, including:**
- Tag id
- Asset id
- Plant id
- Facility id
- Equipment id
- Project id
- Etc…

**Is there a LRA for this data being in Omnia?**

**Is the data registered in the Data Catalog?**
- Lineage
- …

**Is process for getting data access clearly described?**

**Are there metrics about the data available?**
- Staleness - how old is the data when compared the the original source?
- Frequency - how often is the data set to be updated?
- Coverage - for this particular dataset
  -  Different assets/countries/business areas etc
  - Time - is historical data available?
-  How is the data sharing monitored - see also SLA
  - use of APIs
  - use of applications
	- query time
	- data ingest time/status
	- failed access attempts

**How is the data exposed technically**
- APIM
- API (backend)
- DB view
- DB table
- Data lake
- Other?

**Who owns the dataflow for this data?**

**Is the recognised standard used for the response/request bodies?**

**Is there versioning for datasets in place?**
- Backwards compatibility for N time?
- Have deprecation/end of life communication available for dataset and sharing technology.
