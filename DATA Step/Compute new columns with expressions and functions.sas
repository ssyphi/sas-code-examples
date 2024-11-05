/************************************************************************************************/
/* COMPUTE NEW COLUMNS WITH EXPRESSIONS AND FUNCTIONS                                           */
/*     1. Create a new table in the default WORK library named CARS_NEW.                        */
/*     2. Read the existing table SASHELP.CARS.                                                 */
/*     3. Only read rows from the input table where Origin equals Europe. Character values must */
/*        be in quotation marks.                                                                */
/*     4. Create new columns KmH_Highway and KmH_City that multiply MPG_Highway and MPG_City    */
/*        by 1.609344.                                                                          */
/*     5. Create a new column KmH_Average that calculates the mean of KmH_Highway and KmH_City. */ 
/*     6. Apply the 4.1 format to all variables that begin with KmH. This numeric format        */
/*        allocates 4 total positions to display the value and rounds to one decimal place.     */
/*     7. Keep only the variables in the list in the output table. The colon is used to select  */
/*        all columns that begin with KmH.                                                      */
/************************************************************************************************/

data cars_new;                                /*1*/
    set sashelp.cars;                         /*2*/
    where Origin="Europe";                    /*3*/
    KmH_Highway=MPG_Highway*1.609344;         /*4*/
    KmH_City=MPG_City*1.609344;
    KmH_Average=mean(KmH_Highway, KmH_City);  /*5*/ 
    format KmH: 4.1;
    keep Make Model Type KmH:;
run;

title "First 10 Rows of CARS_NEW";
proc print data=cars_new(obs=10);
run;
title;