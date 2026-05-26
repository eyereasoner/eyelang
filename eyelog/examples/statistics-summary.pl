% Population statistics for a small numeric sample.
%
% The sample is the textbook data set [2,4,4,4,5,5,7,9], whose population
% mean is 5, variance is 4, and standard deviation is 2.

materialize(count, 2).
materialize(mean, 2).
materialize(populationVariance, 2).
materialize(populationStddev, 2).

sample(scores, [2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0]).

sum([], 0.0).
sum([X|Xs], Total) :-
  sum(Xs, Rest),
  add(X, Rest, Total).

mean(Name, Mean) :-
  sample(Name, Values),
  sum(Values, Total),
  length(Values, Count),
  div(Total, Count, Mean).

squared_error_sum([], _Mean, 0.0).
squared_error_sum([X|Xs], Mean, Total) :-
  sub(X, Mean, Delta),
  pow(Delta, 2.0, Squared),
  squared_error_sum(Xs, Mean, Rest),
  add(Squared, Rest, Total).

population_variance(Name, Variance) :-
  sample(Name, Values),
  mean(Name, Mean),
  squared_error_sum(Values, Mean, SumSquaredErrors),
  length(Values, Count),
  div(SumSquaredErrors, Count, Variance).

population_stddev(Name, Stddev) :-
  population_variance(Name, Variance),
  pow(Variance, 0.5, Stddev).

count(Name, Count) :-
  sample(Name, Values),
  length(Values, Count).


populationVariance(Name, Variance) :-
  population_variance(Name, Variance).

populationStddev(Name, Stddev) :-
  population_stddev(Name, Stddev).
