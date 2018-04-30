Data = LOAD '/operatorexam/eticaretlog' USING PigStorage(',') AS
(
userId : int,
country : chararray,
duration : int,
search : chararray
);
Gr_Data = GROUP Data BY country;

New_Data = FOREACH Gr_Data{
	Generate
	group,
	MAX(Data.duration) as maxDurTime;
}
DUMP New_Data;