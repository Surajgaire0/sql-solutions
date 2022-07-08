--Show different formats (at least 3) of Date Time and conversions between them

Select GETDATE();                                --2022-07-07 19:03:43.160

Select format(GETDATE(),'yyyy-MM-dd');           --2022-07-07

Select CAST(GETDATE() as date);                   --2022-07-07

Select CAST(GETDATE() as datetime);               --2022-07-07 19:03:43.160

Select CAST(GETDATE() as datetime2);               --2022-07-07 19:03:43.1600000

Select CAST('July 7 2022' as date);                --2022-07-07

Select format(GETDATE(), 'd', 'en-Us');             --7/7/2022

Select format(GETDATE(), 'yyyy.mm.dd');             --2022.10.07

Select format(GETDATE(), 'MM/dd/yyyy HH:mm:ss');    --07/07/2022 19:10:40