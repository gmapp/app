--insert into control(no_pr,no_pk,gsredn,kratn,no_grav,fk_ploshad_id,grav,op_date)
select t.no_pr,t.no_pk,t.gsredn,t.kratn,r.NOMER_PRIBORA,r.fk_ploshad_id,
(select grav from opor_punkt op where op.fk_ploshad_id=r.fk_ploshad_id
and op.no_pr=t.no_pr and op.no_pk=t.no_pk) as grav, r.date_izmerenia
from (
    SELECT line as no_pr,station as no_pk,sum(g)/count(1) as gsredn,count(1) as kratn,fk_reis
    FROM PROTOCOL p
    where fk_reis=25 and (brack is null or brack<>1)
    group by line,station,fk_reis
    order by line,station
) as t, reis r
where t.FK_REIS=r.id