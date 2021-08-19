Meeting questions

1 - Is the title okay? 
    Title is good :)

2 - In your experience where would the word count differ? Is there anything missing or need emphases (mainly the methodology)?

3 - Do you have any future leave I should work around?
3rd week of july / end of aug / september

For Emrhys!
    Are there factors which infleunce capacity/demand for GPs and Primary care sites within your datasets?

https://universityofsouthwales-my.sharepoint.com/:w:/g/personal/17076749_students_southwales_ac_uk/ER_D3ES3fV9PvnE7nZVVpM0B8Mu6JI8IvJ6JwJmMJ2jjAA?e=xJ17rU

Look at Chepstow regional data (as it could be interesting as it's so close to England)

Could mock up a distribution around the calls demand.
    Assume a patient wouldn't call twice in one day.
Both GPs which were questered, are very different.

Priority!
    Try some web scrapping in R with some datasets.
    Continue reading for relevant materials around subject matter. 

NHS England gets better support compared to Wales

Reading
How to quickly move to a model, a simple black box model for health data.

MRes - 1 Year
Pathways for Mental Services - Some of this was talked about within todays conference.
    Looking at has bring different areas of the NHS together to see if pathsways are
        changing etc? especially now, with COVID.
What are the commonality of these pathways, how do we turn these datasets/pathways
    to show the events as the 'same thing'.
Swim Lanes which easily shows the pathways the patient has taken?
    If they've been through the same pathways, how does the time differ?
How much time is being consumed by these outliers and should they have been discharged?!

Machine learning and Clustering
    Very difficult clustering for this sort of data.

There needs to be a completly new way to visualise the pathways, with the data!
    What do we mean by a pathway?
    What do we mean by a similar pathway?

Put in the other references as my To Read section. 

##########
01/07/2021
##########

- I read the paper from the first meeting, but I didn't notice any population based models in there, they were mainly looking at how GPs measure their demand.
		- Population based model - explain it as simple as possible,
		- Can we do this with stats wales datasets?
		- Population estimates dataset - over time (Time series data is very good, per area)
	
- Do you know of any good references around that area or something similar?
	
- Can look at improving the script for stats wales in future.
	 

- Is prediction modelling the same as Agent based modelling?
	Agent based modelling (describing an outcome?) - can be used to look at emerging behaviour (flocking in groups). Moving together and trying to avoid the contact, it looks at cooperation and how models impact it. 
	state type models could be used to track 

I was planning on talking about these topics in the report,
    - Predictive Modelling
    - Health Care Data
    - Predictive modelling of demand and capacity in GP practices and primary care
	( sounds like a good progression so far, be careful of the rabbit holes! )
	can look at the peripheral work 

Any idea of when i'd have access to any data, or should I focus on scrapping datasets from the web?
- Do you know what variables are being tracked by GPs within the Data?
Focus on public open source datasets at the moment,
	- GPs and Population (Age, deprication,
	Building developments from local council

What is the model going to be like? What is the popular of chespstow (Time series)
Paper might how have good models - will have to dig deep to pinpoint. 

- Look at the local council websites for housing development.
- Population data and especially time series

descriptive statistics - clean it up,
bring out some description from the data.
Means, SD, explore the data properly - narrow something down from the data. 
Explore Aneurin Bevan possibly. 


##########
15/07/2021
##########
-- Meeting with Emrhys

Ask about population vs staff 
1 appt per person per yr is about 4 appointments per hour for staff say (Times article says 41 people per GP per day).
But is something more like 6 appointments per person per yr actually more typical??? 
Does staff figure include people who don’t see patients? 

Ask about vacancy data and what figure for staffing against population increase is really wanted.

I've been looking at estimated Population per health board area and compared this estimate to the number of staff.

Public domain data and see how things go - if we do get any data from GPs it will be about Read Codes - which might need to be researched (only have it for chronic conditions).

There is a dataset around vacancies in GPs - Emrhys will message Jenny. 
	Happy to keep looking for public datasets
	
Monmothshire could be an interesting one - try to LSOA areas per things. 

##########
22/07/2021
##########

Currently looking at datasets around Housing estimates and housing predictions.
Might need to add Health Boards to datasets which are groups by Local Authority??
Could also add LSOA MSOA to datasets (if easy enough to do)

Modelling assumptions
-- Intervention Wheel (Consultation) could be ideal to write about but not very useful.

Describe the Data's MetaData.
Try to get the data for multiple years and turn it into time series?

https://statswales.gov.wales/Catalogue/Population-and-Migration/Population/Estimates/Small-Area/PopulationEstimates-by-LocalAuthority-UpperSuperOutputArea-AgeGroup


Can I link multiple spreadsheets to LSOA,
    Focus on Monmothshire & Chepstow.

By merging datasets, looking at demand via LSOA we have found XYZ. 

There are a total of 1,909 LSOAs within Wales.

##########
29/07/2021
##########

Use 7 LSOA codes to build up deprivation - Chepstow ()
Emrhys said they'd have a look at some GP Practice codes and LSOA data

Look at housing estimates for Chepstow?
Spreadsheet of LSOA with a bunch of characteristics with the populations

Diversity, deprication, Houses - Demand at a population level.

Probability of the GP surgery has someone from that area?
LOSA = 1 fits inside this GP Area - Forced 1:1. 
    Could give it a weight due to population. 

I'm about to talk about Predictive modelling, but unsure if this is what I need?!
    Do we have a demand over time - and can we estimate it? 
    System Dynamics could fit within something happening over time. 

API Json File. 
ONS population estimates - housing population 

Simple sequence of a mathodology
Can explore some scenarios (Pre Covid v Post Covid) would this be different?!
What if it was 2 housing developments within the same LSOA - this could affect it even more.

Population of Chepstow 
A calculator from 1982

I've got demand by practice, can i turn it into a total demand via lsoa.

Web Scrape this:
    https://nwssp.nhs.wales/ourservices/primary-care-services/general-information/data-and-publications/gp-practice-analysis/

    Get the LSOAs down and combine it with Postcodes Maybe?
    Chepstow LSOAs
    Post Codes
    Practices
    Demand
    Other Characteristics



-----------------------------------------------------------------------------------------------------
I've been doing some EDA on the datasets Jenny highlighted - Struggled a bit with this 

EDA - 

Some areas stopped reporting during covid - for obvious reasons.

Look if theres a dataset or a public anouncement around this?

Explain why i'm doing an RMarkDown:
- I've been doing an RMarkdown to make 

There are also a lot of datasets around NHS Jobs especially archived (like way back machine):
  - Gen med council: https://webarchive.nationalarchives.gov.uk/ukgwa/*/https://jobs.gmc-uk.org/
  - Civil service: https://webarchive.nationalarchives.gov.uk/ukgwa/*/https://www.civilservicejobs.service.gov.uk/csr/index.cgi
  - NB> NHS jobs in general does not have an arhive... but is starting (could compare May to now!): https://webarchive.nationalarchives.gov.uk/ukgwa/*/https://beta.jobs.nhs.uk/home
  - NB. for other work: support and IT jobs: https://webarchive.nationalarchives.gov.uk/ukgwa/*/http://support-and-it.jobs.nhs.uk/

WMCA September - MSc Students (Some could someone presenting in the same area)

We will define demand in this case as population predictions and housing predictions 
This could also be done by looking at GPs and their visits per health board.
Talk about what structure the data had, the pros and cons of the data. 

Is Chepstow a posher area of Aurien Bevan
Start plotting 

WIMD - Deprevatiuon data
Look to add Deprevation data to the research - if we can't get the datasets to lsoa.

CHEPSTOW LSOAs OR Aurien Bevan.