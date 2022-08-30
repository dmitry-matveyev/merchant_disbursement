# README

## The task

Make a system to calculate how much money should be disbursed to each merchant based on the following rules:

* Disbursements are done weekly on Monday.
* We disburse only orders which status is completed.
* The disbursed amount has the following fee per order:
  * 1% fee for amounts smaller than 50 €
  * 0.95% for amounts between 50€ - 300€
  * 0.85% for amounts over 300€

## The design

It is possible to

* disburse a single order service
* disburse all orders service

Order disbursement can be run in parallel in the background using ActiveJob.
I wrote it in the TDD manner and I did small commits.

## How to run the system.

* docker-compose build
* docker-compose run test db:create db:migrate
* docker-compose run test rspec

