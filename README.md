# UnderGround System

An underground railway system is keeping track of customer travel times between different stations.
They are using this data to calculate the average time it takes to travel from one station to another.

## Requirement

Implement the `UndergroundSystem` class:

* `check_in(id, station_name, time)`
  * A customer with a card `id`, checks in at the station `station_name` at the `time`.
        A customer can only be checked into one place at a time.
* `check_out(id, station_name, time)`
  * A customer with a card `id`, checks out from the station `station_name` at the `time`.
* `get_average_time(start_station, end_station)`
  * Returns the average time it takes to travel from `start_station` to `end_station`.

## Notes

1. The average time is computed from all the previous traveling times from `start_station` to `end_station` that happened directly, meaning a check in at `start_station` followed by a check out from `end_station`.
1. The time it takes to travel from `start_station` to `end_station` may be different from the time it takes to travel from `end_station` to `start_station`.
1. There will be at least one customer that has traveled from `start_station` to `end_station` before `get_average_time` is called.
1. You may assume all calls to the `check_in` and `check_out` methods are consistent.
1. If a customer checks in at time t1 then checks out at time t2, then t1 < t2.
1. All events happen in chronological order.

## Input

Commands file:
* `check<in/out>,id,station_name,time`
* `get_average,start_station,end_station`

Example
```
check_in,45,Leyton,3
check_in,32,Paradise,8
check_out,45,Waterloo,15
check_out,32,Cambridge,22
get_average,Paradise,Cambridge
```

## Output

```
Paradise,Cambridge,14.0
```

## Example 1

Input
```
check_in,45,Leyton,3
check_in,32,Paradise,8
check_in,27,Leyton,10
check_out,45,Waterloo,15
check_out,27,Waterloo,20
check_out,32,Cambridge,22
get_average,Paradise,Cambridge
get_average,Leyton,Waterloo
check_in,10,Leyton,24
get_average,Leyton,Waterloo
check_in,10,Waterloo,38
get_average,Leyton,Waterloo
```

Output
```
Paradise,Cambridge,14.0
Leyton,Waterloo,11.0
Leyton,Waterloo,12.0
```

## Development Env
This gems and dependencies were added to the project

* `gem 'rubocop', require: false`

This gem was added in order to analyze and format the code according to
ruby standard guidelines reported on [Ruby Style Guides](https://rubystyle.guide/)

* `gem 'simplecov', require: false, group: :test`

Added this gem in order to keep track of overall coverage tests results for the project.
After running test, check the coverage report which is generated:

```
  Coverage report generated for RSpec to /underground-system/coverage. 54 / 54 LOC (100.0%) covered.
```

You can find a screenshot of the report in `coverage/assets`.

run `open coverage/index.html` to open the file in your browser and check the report.

* `# frozen_string_literal: true`

Added this feature to the project to optimise space complexity and do not allocate new space in memory for the same string

## Prerequisites

Before to begin, make sure you have ruby version 3.0.2 installed.

If your ruby version does not match, you can update it with a ruby version manager like `rvm` or `rbenv`.

```
# when using rbenv
rbenv install 3.0.2
```

```
# set 3.0.2 as the local version for this project
rbenv local 3.0.2
```

```
# when using rvm
rvm install 3.0.2
# set 3.0.2 as the local version
rvm use 3.0.2
```

## Installation

Clone the repo and then:

```
  cd underground-system
```

execute:

```
  bundle install
```

to install dependencies

then execute:

```
  rspec
```

anytime you need to run tests. Check for test coverage snapshot

Ultimately, execute either

```
  rubocop
```

or

```
  rbenv exec rubocop
```

depending on configuration you have set for you bash profile to format the code.

## Running the app

You can run the app executing the script:

```
  ruby lib/underground_system.rb
```

and print out on terminal the `Example 1` results provided upon requirements.
