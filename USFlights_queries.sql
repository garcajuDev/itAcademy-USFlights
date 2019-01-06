SELECT COUNT(*) as Amount from flights;

SELECT AVG(ArrDelay) as average_arrival_delay, AVG(DepDelay) as average_departures_delay, Origin
FROM flights group by origin;

SELECT Origin, colYear as Year, colMonth as Month, AVG(DepDelay) as Departures_Delay
FROM flights GROUP BY origin ORDER BY colYear, colMonth ASC;

SELECT usairports.City as City, flights.colYear as Year, flights.colMonth as Month, 
AVG(flights.DepDelay) as Departures_Delay
FROM flights LEFT JOIN usairports ON flights.Origin = usairports.IATA group by flights.DepDelay ORDER BY colYear, colMonth ASC;

SELECT carriers.Description, COUNT(flights.Cancelled) as Cancelations from carriers left join flights 
on carriers.CarrierCode = flights.UniqueCarrier group by carriers.CarrierCode order by count(flights.Cancelled) desc; 

SELECT flights.FlightNum as Airplane, SUM(flights.Distance) as total_distance 
from flights group by flights.FlightNum order by SUM(flights.Distance) DESC limit 10;

SELECT carriers.Description as carrier, AVG(flights.DepDelay) as departure_delay 
from carriers join flights on carriers.CarrierCode = flights.UniqueCarrier
group by carriers.CarrierCode having avg(flights.DepDelay) > 10 order by avg(flights.DepDelay) desc; 