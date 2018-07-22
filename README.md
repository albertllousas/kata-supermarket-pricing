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

## Test cases for supermarket A - First session

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
Tomato,4$
```

and the following input:

```bash
2 Potato, 5 Tomato
```

the output should be:

```bash
24$
```

**In the program implementation, the header of the CSV can be removed**.

## Test cases for supermarket B - Second Session
 
   
   At this supermarket we have a CSV file that will contain the stock of the supermarket. 
   We assume that we have unlimited stock.
   
   The CSV file (Stock.csv) contains:
   
   * the name of the product that we have in stock
   * the price per unit in dollars
   
   We also have a new CSV file, Offers.csv, that contains the offers for a given product. It contains:
   
   * the name of the product where to apply the offer
   * number of units when to apply the offer
   * number of units to charge instead
   
   For example, for the line:
   
   `Potato,3,2`
   
   It means that if we buy 3 potatos, we will get charged only per 2.
   
   The program expects an input in a single line, where each command is separated by a comma. Each command
   is formed by the number of units that the client wants to buy and the name of the product (as in the csv).
   
   The output of the program must be the price in dollars of the command after applying the offers.
   
   For the following Stock:
   
   `
   Potato,2$
   Tomato,3$
   `
   
   the following offers:
   `
   Potato,3,2
   Tomato,2,1
   `
   
   and the following input:
   
   `
   2 Potato, 5 Tomato
   `
   
   the output should be:
   
   `
   9.5$
   `
   
   **In the program implementation, the header of all CSVs can be removed**.

