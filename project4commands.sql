# User command script
# CNT 4714 - Summer 2018 - Project 4
# This script contains the commands that the user/client will issue against the
# Project4 database (supplier/parts/jobs/shipments.  The Java servlet that is 
# Project4 incoporates server-side business logic that manipulates the status of a
# supplier when certain conditions involving shipment quantity are triggered.
#
###########################################################
# Command 1: Query: list the supplier number and supplier name for those suppliers who ship every part.
select snum, sname
from suppliers
where not exists
	( select *
  	  from parts
	  where not exists
		( select *
		  from shipments
		  where shipments.snum = suppliers.snum
				and shipments.pnum = parts.pnum
		)
	);
			   

###########################################################
# Command 2 is a multi-part sequence that will trigger the business logic.
# The first part is a query to illustrate all supplier information before the update.
# The second part performs the update and causes the business logic to trigger.
# The third part is a query that illustrates all supplier information after the update/
# In the non-bonus version of the program, supplier numbers S1, S12, S17, S21, S22, S3, S44, S5, and S6 all
# have their status value updated.  In the bonus version of the program, only supplier number S5 will 
# receive a status update.
# Command 2A: Query: list all supplier information.
select *
from suppliers;

# Command 2B: add a new record to shipments table (S5, P6, J7, 400)
insert into shipments
values ('S5', 'P6', 'J7', 400);

# Command 2C: list all supplier information.
select * 
from suppliers;

###########################################################
# Command 3 is a multi-part that does not cause the business logic to trigger
# Command 3A: add a new record to the supplier table (S39, Candice Swanepoel, 10, Cardiff)
insert into suppliers
values ('S39','Candice Swanepoel',10,'Cardiff')

# Command 3B: list all supplier information.
select *
from suppliers;

# Command 3C: add a new record to shipments table (S39, P3, J1, 20)
insert into shipments
values ('S39','P3','J1', 20);

# Command 3D: list all supplier information
select *
from suppliers;

###########################################################
# Command 4: List the snum, sname, and pnum for those suppliers who ship the
# same part to every job.  This is a fairly complex SQL nested query.

select distinct suppliers.snum, suppliers.sname, shipments.pnum
from suppliers natural join shipments
where shipments.pnum in
    (select pnum
     from parts
     where not exists
        (select * 
         from jobs
         where not exists
            (select *
             from shipments
             where shipments.snum = suppliers.snum
                   and shipments.pnum = parts.pnum
                   and shipments.jnum = jobs.jnum
			)
		) 
	);

###########################################################
# Command 5 is a multipart transaction that will cause the business logic to trigger
#
# The first part is a query to illustrate all shipment information before the update.
# The second part performs the update and causes the business logic to trigger.
# The third part is a query that illustrates all shipment information after the update/
# In the non-bonus version of the program, supplier numbers S1, S2, S12, S17, S3, and S6 all
# have their status value updated.
# In the bonus verison of the program, only supplier numbers S1, S2, and S3 will have their status
# value updated. 
# Command 5A: List all shipment information
select *
from shipments;
			  
# Command 5B: Update the shipments table by increasing the quantity by 10 every
#             shipment of part P3.
update shipments
set quantity = quantity + 10
where pnum = 'P3';

# Command 5C:  List all shipment information
select *
from shipments;

# Command 5D:  List all supplier information
select *
from suppliers;

###########################################################
# Command 6: List the snum, and sname for those suppliers who ship only green parts.
# Output should list only supplier number S44

select sname
from suppliers
where snum in (select snum
               from shipments
			   where pnum in
			                 (select pnum 
							  from parts
							  where color = 'green'
							  )
				)
	and
		snum not in (select snum
		             from shipments
					 where pnum in
					               (select pnum
								    from parts
									where color <> 'green'
									)
					)
									