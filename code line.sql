select * from startup;


-- which sector experiences the most failed startups?
select count(*),sector 
from startup 
group by sector
order by count desc;-- sector wise breakup of failed startups

--What are the top 10 most-funded failed startups?
select total_funding,sector,name from startup 
order by total_funding desc
limit 10;-- ranking of 10 failed startups

-- what is the average funding of startups?
select round(avg(total_funding),2) 
from startup;--returns the avg funding of startups 

-- what is the average duration of startups?
select floor(avg(duration)) as avg_duration,sector
from startup 
group by sector
order by avg_duration desc;-- average duration of startups

-- what is the main reason behind the deaths of so many information sector startups?
select sum(giants) as giants ,
sum(no_budget) as no_budget,
sum(competition) as competition,
sum(poor_market_fit) as poor_market_fit ,
sum(acqusition_stagnation) as acqusition_stagnation,
sum(platform_dependency) as platform_dependency,
sum(monetization_failure) as monetization_failure ,
sum(niche_limits) as niche_limits ,
sum(trend_shifts) as trend_shifts ,
sum(toxicity_trust_issues) as toxicity_trust_issues,
sum(regulatory_pressure) as regulatory_pressure ,
sum(overhype) as overhype   
from startup 
where sector='Information';--what is the reason for so many IT sector startups failure.

-- what is the sector that sees the least deaths of startups?
select count(*),sector from startup
group by sector 
order by count asc;-- The safest sector for a startup from the founders perspective.

-- so from the above query,we get a certain idea that accommodation and food services are affected the least in the startup scene,however this dataset that i am working upon is relatively smaller yet it gives a rough idea about how dynamic certain sectors are in comparison to the others.

-- what is the average funding of a accomodation and food service startup?
select floor(avg(total_funding)) from startup 
where sector='Accommodation and Food Services';--returns the average funding of food and services startup

-- total money invested in information vs food services sector 
select sum(total_funding),sector 
from startup 
where sector in ('Information','Accommodation and Food Services')
group by sector;-- returns the money invested in IT vs food accomodation startups.

-- so for convenience let us try to understand now the average money that is invested in the information sector goes down the drain vs how much money that goes in accomodation and food services does 
select sector,floor(avg(total_funding))
from startup 
where sector in ('Information','Accommodation and Food Services')
group by sector;--returns the average funding of startups belonging to information,accommodation and food services

-- why do accomodation and food services fail?
select sum(giants) as giants ,
sum(no_budget) as no_budget,
sum(competition) as competition,
sum(poor_market_fit) as poor_market_fit ,
sum(acqusition_stagnation) as acqusition_stagnation,
sum(platform_dependency) as platform_dependency,
sum(monetization_failure) as monetization_failure ,
sum(niche_limits) as niche_limits ,
sum(trend_shifts) as trend_shifts ,
sum(toxicity_trust_issues) as toxicity_trust_issues,
sum(regulatory_pressure) as regulatory_pressure ,
sum(overhype) as overhype 
from startup 
group by sector;--reason for failure for goods and accomodation services 

-- total funding lost across all sectors?
select sum(total_funding),sector as money_lost 
from startup 
group by sector;


-- average life span of failed startup?
select floor(avg(duration)),sector from startup 
group by sector 
;-- returns the life span for failed startups

-- what are the most common startup failure reason?

select sector,
sum(giants) as giants,
sum(no_budget) as no_budget,
sum(competition) as competition,
sum(poor_market_fit) as poor_market_fit,
sum(acqusition_stagnation) as acqusition_stagnation,
sum(platform_dependency) as platform_dependency,
sum(monetization_failure) as monetization_failure,
sum(niche_limits) as niche_limits,
sum(trend_shifts) as trend_shifts,
sum(toxicity_trust_issues) as toxicity_trust_issues,
sum(regulatory_pressure) as regulatory_pressure,
sum(overhype) as overhype
from startup 
group by sector;--insight: failure patterns across each startup and sectors.

--Which sectors are most affected by competition?
select sum(competition),sector
from startup 
group by sector
order by sum(competition) desc;--sector wise pattern of failure for startup because of competition.

-- which sector suffer most from poor market fit?

select sum(poor_market_fit),sector  as poor_market_fit 
from startup 
group by sector 
order by sum(poor_market_fit) desc;-- insight: healthcare sector is affected the most due to a poor market fit.


 




