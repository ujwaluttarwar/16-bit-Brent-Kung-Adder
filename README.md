# 16-bit-Brent-Kung-Adder
## Basics - About Brent Kung Adder
Brent Kung adder is a type of tree adder which is used when higher number of bits are to be added with high speed and low complexity. These adders use the concept of carry look ahead addition. Unlike carry look ahead addition, where the complexity in design increases as the number of bits increases, thereby increasing computation time, Brent Kung adders use tree like architecture, with each node performing very simple operations, creates logarithmic dependence of time on number of bits. Ideally, for say N-bit addition, the Brent Kung adder should take around log(N) units of delay, where 1 unit corresponds to delay due to single node.  
## Working of Brent Kung Adder
