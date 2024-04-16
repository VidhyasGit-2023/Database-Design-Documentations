declare @StartDate date
declare @EndDate date
declare @TempDate date

set @StartDate = '1990-01-01'	-- Set this to whatever date you like to begin with
set @EndDate = '2020-11-18'	-- Set this to your final date. No date in your systems should exceed this value

declare @Counter int
declare @NumberOfDays int

set @Counter = 0
set @NumberOfDays = datediff(dd,@StartDate,@EndDate)

if not exists (
	select *
	from sys.tables where name = 'Dim_Date'
)
begin

create table dbo.Dim_Date (
	DateSK int not null,
	[Date] date not null,
	StandardDate varchar(10) not null,
	FullDate varchar(50) not null,
	[Year] int not null,
	[Month] tinyint not null,
	[MonthName] varchar(10) not null,
	[Day] tinyint not null,
	[DayOfWeek] tinyint not null,
	[DayName] varchar(10) not null,
	WeekOfYear tinyint not null,
	[DayOfYear] smallint not null,
	CalendarQuarter tinyint not null
);

end

-- Insert Inferred Member
insert dbo.Dim_Date (
	DateSK,[Date],StandardDate,FullDate,
	[Year],[Month],[MonthName],[Day],[DayOfWeek],[DayName],
	WeekOfYear,[DayOfYear],CalendarQuarter
) values (
	19000101,'1900-01-01','01/01/1900','January 1, 1900',
	1900,1,'January',1,2,'Monday',
	1,1,1);


set @TempDate = @StartDate

while @Counter <= @NumberOfDays
begin

insert dbo.Dim_Date (
	DateSK,
	[Date],
	StandardDate,
	FullDate,
	[Year],
	[Month],
	[MonthName],
	[Day],
	[DayOfWeek],
	[DayName],
	WeekOfYear,
	[DayOfYear],
	CalendarQuarter
) 
select year(@TempDate) * 10000 + month(@TempDate) * 100 + day(@TempDate) as DateSK,
	cast(@TempDate as date) as [Date],
	convert(varchar,@TempDate,101) as StandardDate,
	datename(mm,@TempDate) + ' ' + cast(day(@TempDate) as varchar(2)) + ', ' + cast(year(@TempDate) as char(4)) as FullDate,
	year(@TempDate) as [Year],
	month(@TempDate) as [Month],
	datename(mm,@TempDate) as [MonthName],
	day(@TempDate) as [Day],
	datepart(dw,@TempDate) as [DayOfWeek],
	datename(dw,@TempDate) as [DayName],
	datepart(wk,@TempDate) as WeekOfYear,
	datepart(dy,@TempDate) as [DayOfYear],
	case	when month(@TempDate) between 1 and 3 then 1
			when month(@TempDate) between 4 and 6 then 2
			when month(@TempDate) between 7 and 9 then 3
			when month(@TempDate) between 10 and 12 then 4
	end as CalendarQuarter

	set @Counter = @Counter + 1
	set @TempDate = DateAdd(dd,1,@TempDate)

end

if not exists (
select * from sys.indexes
where object_name(object_id) = 'Dim_Date'
and type_desc = 'CLUSTERED'
)
begin
-- Add PK/Clustered Index
alter table dbo.Dim_Date
add constraint PK_Dim_Date primary key clustered(DateSK);
end