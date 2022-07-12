-- Using demo database From Advanced SQL:Logical Query Processing, Part 1 linkedin learning course

--challenge1

--Write a query to report animals and their vaccinations.

select A.Name, A.Species, A.Breed, A.Primary_Color, V.Vaccination_Time, V.Vaccine, P.First_Name, P.Last_Name, SA.Role
from suraj.Animals as A
	left outer join suraj.Vaccinations as V
		inner join suraj.Persons as P
				inner join suraj.Staff_Assignments as SA
				on SA.Email=P.Email
			on SA.Email=V.Email
		on A.Name=V.Name and A.Species=V.Species;


--challenge 2

--Write a query to report the number of vaccinations each animal has received. Include animals that were
--never vaccinated. Exclude rabbits, rabies vaccines, and animals that were vaccinated on or after
--October 1 2019.

select A.Name, A.Species, Max(Primary_Color) as Primary_Color, Max(Breed) as Breed, count(V.Vaccine) as [count]
from suraj.Animals as A
	left outer join suraj.Vaccinations as V
	on A.Name=V.Name and A.Species=V.Species
where A.Species<>'Rabbit' and (V.Vaccine<>'Rabies' or V.Vaccine is null)
group by A.Name, A.Species
having Max(V.Vaccination_Time)<'2019-10-01' or Max(V.Vaccination_Time) is null;