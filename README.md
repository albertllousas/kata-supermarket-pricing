# SupermarketKata

Functional kata exercise at ThoughtWorks.

Based on:

[supermarket code kata](http://codekata.com/kata/kata01-supermarket-pricing/)

## Running the tests

```bash
mix test
```

## Building & running

//todo

## Test cases for supermarket A

At this supermarket we have a CSV file that will contain the stock of the supermarket. 
We assume that we have unlimited stock.

The CSV file (Stock.csv) contains:

* the name of the product that we have in stock
* the price per unit in dollars

The program expects an input in a single line, where each command is separated by a comma. Each command
is formed by the number of units that the client wants to buy and the name of the product (as in the csv).

The output of the program must be the price in dollars of the command.

For the following CSV:

```
Potato,2$
Tomato,3$
```

and the following input:

```bash
2 Potato, 5 Tomato
```

the output should be:

```bash
19$
```

**In the program implementation, the header of the CSV can be removed**.

