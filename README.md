Vending Maching
==========

Technical Test 

###Specification

Design a vending machine in code. 

+ The vending machine, once a product is selected and the appropriate amount of money is inserted, should return that product. 
+ It should also return change if too much money is provided or ask for more money if there is not enough. 
+ The machine should take an initial load of products and change with denominations 1p, 2p, 5p, 10p, 20p, 50p, £1, £2. 
+ There should also be a way of reloading both products and change at a later point. The machine needs to keep track of the products and money that it contains.
+ You may choose any language or techniques to develop the machine. 

###Technologies used

+ Ruby
+ RSPECT

###How to set it up

```sh
git clone https://github.com/aitkenster/vending-machine.git
```

###How to run it

```sh
cd vending-machine
irb
require './lib/machine.rb'
vending_machine = Machine.new
vending_machine.run
```

###How to test it

```sh
cd vending-machine
rspec
``` 

###Future Improvements

+ Error handling if an item or coin is miss-typed
