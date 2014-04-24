SET AUTODDL ON;

--DROP VIEW VIEW_CATALOG;

/**************** DROPPING COMPLETE ***************/

CREATE VIEW VIEW_CATALOG (ID, NO_PR, NO_PK, GRAV, FK_PLOSHAD_ID,X,Y,H)
AS  
select c.ID,c.no_pr,c.no_pk,c.grav,c.FK_PLOSHAD_ID,t.X,t.Y,t.H from control as c
left join topograph as t on t.fk_ploshad_id=c.fk_ploshad_id and t.no_pr=c.no_pr and t.no_pk=c.no_pk
where c.control=1;

GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE
 ON VIEW_CATALOG TO  GM WITH GRANT OPTION;
