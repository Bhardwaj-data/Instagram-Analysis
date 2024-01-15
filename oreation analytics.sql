#1. weekly user engagemnet
select * from events;
select extract(week from activated_at) as week_num,
count(distinct user_id)
from events
group by week_num;

#2.calculate the user growth for product
select * from users2;
select year(activated_at), count(distinct user_id)
from users2
group by 1;

#4. weekly engagement per device
select * from events;
select extract(week from activated_at) as week , device ,
count(distinct user_id) as count from events
where event_type='engagement'
group by 1,2
order by 1,2;

#5. Calculate the email engagement metric
select * from email_events;
select count(distinct user_id), action from email_events
group by 2;


# Duplicate rows form the data
select * from job_data;
select job_id, count(*) as noof_duplicate_user_id from job_data
group by 1
having count(job_id)>1;

