create table sales_demo (
    year number,
    month number,
    day number,
    amount_sold number)
    partition by range (year, month)
    (
        partition q1 values less than (2010,4),
        partition q2 values less than (2020, 7),
        partition q3 values less than (maxvalue, 0)
    );