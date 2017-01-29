
%default

#const size=5.
#const time_horizon=10.

% initial condition
time(0..time_horizon-1).
column(1..size).
row(1..size).

% testing data

% generator rule
1 { click(X,Y,T): column(X), row(Y) } 1 :- time(T).

% preconditions
% none

% effects
on(X,Y,T+1):- not on(X,Y,T), click(X,Y,T), column(X), row(Y), time(T).

on(X-1,Y,T+1):- X>1, not on(X-1,Y,T), click(X,Y,T), column(X), row(Y), time(T).
on(X+1,Y,T+1):- X<size, not on(X+1,Y,T), click(X,Y,T), column(X), row(Y), time(T).
on(X,Y-1,T+1):- Y>1, not on(X,Y-1,T), click(X,Y,T), column(X), row(Y), time(T).
on(X,Y+1,T+1):- Y<size, not on(X,Y+1,T), click(X,Y,T), column(X), row(Y), time(T).


not on(X,Y,T+1):- on(X,Y,T), click(X,Y,T), column(X), row(Y), time(T).

not on(X-1,Y,T+1):- X>1, on(X-1,Y,T), click(X,Y,T), column(X), row(Y), time(T).
not on(X+1,Y,T+1):- X<size, on(X+1,Y,T), click(X,Y,T), column(X), row(Y), time(T).
not on(X,Y-1,T+1):- Y>1, on(X,Y-1,T), click(X,Y,T), column(X), row(Y), time(T).
not on(X,Y+1,T+1):- Y<size, on(X,Y+1,T), click(X,Y,T), column(X), row(Y), time(T).


on(X,Y,T+1):- on(X,Y,T), column(X), row(Y), time(T), click(X1,Y1,T), column(X1), row(Y1), |X-X1|+|Y-Y1|>1.


% goals
:- on(1..size,1..size,time_horizon).

#show click/3.
%#show on/3.