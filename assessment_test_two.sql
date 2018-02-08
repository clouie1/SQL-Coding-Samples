-- ASSESSMENT TWO TEST ---

-- Question 1
-- How can you retrieve all the info from the cd.facilities table
SELECT * FROM cd.facilities;

-- Question 2
-- Print out a list of the facilities and their cost to members
SELECT name, membercost FROM cd.facilities;

-- Question 3
-- How can produce a list of facilities that charge a fee to members?
SELECT name, membercost
FROM cd.facilities
WHERE membercost > 0;

-- Question 4
-- How can you produce a list of facilities that charge a fee to members, and that fee is less 
-- 1/50th of the monthly maintenance of the facilities in question.
SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost > 0 AND (membercost < monthlymaintenance/50.0);


-- Question 5
-- How can you produce a list of all facilities with the word 'Tennis' in their name
SELECT name 
FROM cd.facilities
WHERE name LIKE '%Tennis%';


-- Question 6
-- How can you retrieve the details of facilities with ID 1 and 5?
SELECT * 
FROM cd.facilities
WHERE facid IN (1,5);

-- Question 7
-- How can you produce a list of members who joined after
-- the start of Septmember 2012?
SELECT memid, surname, firstname, joindate
FROM cd.members
WHERE joindate >= '2012-09-01';

-- Question 8
-- How can you produce an ordered list of the first 10 surnames in the member table?
SELECT DISTINCT surname 
FROM cd.members
ORDER BY surname ASC
LIMIT 10;

-- Question 9
-- You like to get the signup date of your last member. How can you retreive this information?
SELECT MAX(joindate) AS latest
FROM cd.members;

-- Question 10
-- Produce a count of the number of facilities that have a cost to guests of 10 or more?
SELECT COUNT(*) 
FROM cd.facilities
WHERE membercost > 10.0;

-- Question 11 - no question. Skip

-- Question 12
-- Produce a list of the total number of slot booked per facility in the month of September 2012.
-- Produce an output table consisting of facility id and slots, sorted by the number of slots.
SELECT facid, SUM(slots) AS total_slots
FROM cd.bookings
WHERE starttime >= '2012-09-01' AND starttime < '2012-10-01'
GROUP BY facid
ORDER BY SUM(slots);

-- Question 13
-- Produce a list of facilities with more than 1000 slots booked.
-- Produce an output table consisting of facility id and total slots, sorting by facility id.
SELECT facid, SUM(slots) AS total_slots
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid;


-- Question 14
-- How can you produce a list of the start times for bookings for tennis courts, 
-- for the date '2012-09-21'? Return a list of start time and facility name pairings, order by the time.
SELECT * FROM cd.bookings;
SELECT * FROM cd.facilities;

SELECT bks.starttime AS start, facs.name AS facility_names 
FROM cd.facilities facs
INNER JOIN cd.bookings bks ON facs.facid = bks.facid
WHERE facs.facid IN (0,1) AND bks.starttime >= '2012-09-21' AND bks.starttime < '2012-09-22'
ORDER BY bks.starttime;

-- Question 15
-- How can you produce a list of the start times for bookings by member named 'David Farrell'?
SELECT * FROM cd.bookings;
SELECT * FROM cd.members;

SELECT bks.starttime
FROM cd.bookings bks
INNER JOIN cd.members mems ON mems.memid = bks.memid
WHERE mems.firstname = 'David' AND mems.surname = 'Farrell';


