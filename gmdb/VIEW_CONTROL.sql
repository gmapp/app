CREATE VIEW VIEW_CONTROL
AS
SELECT a.*, op.id as op_id
FROM CONTROL a
left join opor_punkt op
on a.FK_PLOSHAD_ID=op.FK_PLOSHAD_ID and a.NO_PR=op.NO_PR and a.NO_PK=op.NO_PK
and a.NO_GRAV=op.NO_GRAV
where op.id is null;
