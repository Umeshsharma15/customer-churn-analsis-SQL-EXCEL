for check columns 

pragma table_info(customer);

TOTAL GONE CUSTOMER

SELECT COUNT(*) as total_customers, 
SUM(case WHEN churn ='Yes'then 1 else 0 End) 
as gone_customers
from customer;

OVERALL CHURN RATE

SELECT COUNT(*) as total_customers, 
(SUM(case WHEN churn ='Yes'then 1 else 0 End)*100)/count(*)
as churn_percentage
from customer;

CHURN BY CONTRACT

SELECT contract, COUNT(*) as total, 
SUM(case WHEN churn ='Yes'then 1 else 0 End) as gone 
from customer
group by contract;

CHURN VS AVERAGE TENURE 
SELECT churn,avg(tenure) as avg_months from customer
GROUP by churn;

monthly charges 

SELECT churn, avg(monthlycharges) as avg_bill from customer
group by churn;

REVENUE LOSS 

SELECT sum(monthlycharges) as revenue_at_risk from customer
where churn='Yes';