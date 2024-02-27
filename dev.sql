-- define a select statement to get all students enrolled in a course
select s.first_name, s.last_name, r.registration_date, r.registration_status, l.location_name
from courses.students s
join courses.registrations r on s.student_id = r.student_id
join courses.locations l on r.location_id = l.location_id
where r.registration_status = 2
and r.registration_date >= '2020-01-01'
and r.registration_date <= '2020-12-31'

-- write an index to improve the performance of the query
create index idx_registration_status on courses.registrations (registration_status, registration_date, location_id)

-- define a table for student attendance to capture attendance by class
create table courses.attendance (
    attendance_id int identity(1,1) primary key,
    registration_id int not null,
    attendance_date date not null,
    attendance_status tinyint not null,
    -- Attendance status: 1 = Present; 2 = Absent; 3 = Excused; 4 = Late
    FOREIGN KEY (registration_id) REFERENCES courses.registrations (registration_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- define a stored procedure to get course enrollment by location
create procedure courses.get_course_enrollment_by_location
    @location_id int
as
begin
    select l.location_name, count(r.registration_id) as enrollment
    from courses.registrations r
    join courses.locations l on r.location_id = l.location_id
    where r.location_id = @location_id
    group by l.location_name
end

-- define a stored procedure to get instructor details associated with a location include instructor details, location details, and courses associated with the instructor use instructor_id as the input parameter
create procedure courses.get_instructor_details
    @instructor_id int
as
begin
    select s.first_name, s.last_name, s.email, s.phone, l.location_name, l.street, l.city, l.state, l.zip_code, c.product_name, c.model_year
    from courses.staffs s
    join courses.locations l on s.location_id = l.location_id
    join curriculum.subjects c on s.staff_id = c.instructor_id
    where s.staff_id = @instructor_id
end

select * from courses.registration where registration_date >= '2023-09-01' and registration_date < '2023-10-01'
