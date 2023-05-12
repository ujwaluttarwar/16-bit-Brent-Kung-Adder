# Design of 16 bit Brent Kung Adder
## Basics - About Brent Kung Adder
Brent Kung adder is a type of tree adder which is used when higher number of bits are to be added with high speed and low complexity. These adders use the concept of carry look ahead addition. Unlike carry look ahead addition, where the complexity in design increases as the number of bits increases, thereby increasing computation time, Brent Kung adders use tree like architecture, with each node performing very simple operations, creates logarithmic dependence of time on number of bits. Ideally, for say N-bit addition, the Brent Kung adder should take around log(N) units of delay, where 1 unit corresponds to delay due to single node.  
## Working of Brent Kung Adder
![flow](https://github.com/ujwaluttarwar/16-bit-Brent-Kung-Adder/assets/106365754/c9b7d351-c032-41b8-8c47-54437d26e7bf)
The above tree structure is for a 16 bit Brent Kung Adder, where each block represents a unit that generates P and G values. The subscript of P and G indicates the range of index covered while calculating a particular P and G values, while the superscript denotes the level at which the P and G are calculated. For input A (a_15 - a_0) and B (b_15 - b_0)
