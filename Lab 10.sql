-- Question 1 --

create or replace function get_prereq_course(int, REFCURSOR) returns refcursor as
$$
declare
	prereq_course 	int		:= $1;
	resultset	REFCURSOR	:= $2;
begin
	open resultset for
		select prereqnum
		from prerequisites
		where coursenum in(select coursenum
				   from prerequisites
				   where coursenum = prereq_course);
	return resultset;
end;
$$language plpgsql;

-- Test it here --

select get_prereq_course(499, 'results');
Fetch all from results;


-- Question 2 --

create or replace function get_course_above(int, REFCURSOR) returns refcursor as
$$
declare
	course_above 	int		:= $1;
	resultset	REFCURSOR	:= $2;
begin
	open resultset for
		select coursenum
		from prerequisites
		where prereqnum in(select prereqnum
				   from prerequisites
				   where prereqnum = course_above);
	return resultset;
end;
$$language plpgsql;

-- Test it here --

select get_course_above(221, 'results');
Fetch all from results;