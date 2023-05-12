# Design of 16 bit Brent Kung Adder
## Basics - About Brent Kung Adder
Brent Kung adder is a type of tree adder which is used when higher number of bits are to be added with high speed and low complexity. These adders use the concept of carry look ahead addition. Unlike carry look ahead addition, where the complexity in design increases as the number of bits increases, thereby increasing computation time, Brent Kung adders use tree like architecture, with each node performing very simple operations, creates logarithmic dependence of time on number of bits. Ideally, for say N-bit addition, the Brent Kung adder should take around log(N) units of delay, where 1 unit corresponds to delay due to single node.  
## Working of Brent Kung Adder
![flow](https://github.com/ujwaluttarwar/16-bit-Brent-Kung-Adder/assets/106365754/c9b7d351-c032-41b8-8c47-54437d26e7bf)
The above tree structure is for a 16 bit Brent Kung Adder, where each block represents a unit that generates P and G values. The subscript of P and G indicates the range of index covered while calculating a particular P and G values, while the superscript denotes the level at which the P and G are calculated Each layer calculates the P and G values which are used for calculation of next layer P and G values. For input A (a15 - a0) and B (b15 - b0) and an external input carry C0 (not shown in figure), the Brent Kung Adder works as follows - 
1. Master Equation - G<sup>n</sup> = G<sub>u</sub><sup>n-1</sup> + P<sub>u</sub><sup>n-1</sup> * G<sub>l</sub><sup>n-1</sup> and P<sup>n</sup> = P<sub>u</sub><sup>n-1</sup> * P<sub>l</sub><sup>n-1</sup> where u represents upper half range and l represents lower half range. The n represents the row number for which the G and P needs to be calculated. Hence for n=3 in above figure G<sub>(15:8)</sub><sup>3</sup> = G<sub>15:12</sub><sup>2</sup> + P<sub>15:12</sub><sup>2</sup> * G<sub>12:8</sub><sup>2</sup> and P<sub>15:12</sub><sup>3</sup> = P<sub>15:12</sub><sup>2</sup> * P<sub>12:8</sub><sup>2</sup>
2. The above equation for n = 0 (i.e. the first row) would be given as G<sub>i</sub><sup>0</sup> = a<sub>i</sub> AND b<sub>i</sub> and P<sub>i</sub><sup>0</sup> = a<sub>i</sub> XOR b<sub>i</sub> except G<sub>0</sub><sup>0</sup> =  (a<sub>0</sub> AND b<sub>0</sub>) OR (C<sub>0</sub> AND (a<sub>0</sub> OR b<sub>0</sub>)). 
3. The above G<sub>0</sub><sup>0</sup> make sures that C<sub>1</sub> = G<sub>0</sub><sup>0</sup> and all the other carry-out having index as power of 2 given as c<sub>m</sub> = G<sub>(m-1:0)</sub><sup>log<sub>2</sub>m</sup>
4. Carries at a distance of 1 index from known carries can be calculated using 0th row G and P. Similarly carries at a distance of 2 index can be calculated using 1st row G and P and so on using the equation C<sub>unknown</sub> = G + P * C<sub>known</sub>. This would allow us to calculate all the internal carries.
5. s<sub>n</sub> or the nth bit of sum output is given as P<sub>n</sub><sup>0</sup> * c<sub>n</sub> and the final output carry would be last carry i.e. c<sub>16</sub> (for 16 bit Brent Kung Adder)    
## Simulation Results
### RTL View
#### Level 1 
![image](https://github.com/ujwaluttarwar/16-bit-Brent-Kung-Adder/assets/106365754/7ba24154-4914-4014-bda6-3c0fb13b0a1a)
#### Level 2
![image](https://github.com/ujwaluttarwar/16-bit-Brent-Kung-Adder/assets/106365754/521de74f-cac5-4a8e-b44c-6fc71c2557ec)
#### Level 3
![image](https://github.com/ujwaluttarwar/16-bit-Brent-Kung-Adder/assets/106365754/9eefa78a-3df8-41ba-b605-9f43b019b84f)
#### Level 4
![image](https://github.com/ujwaluttarwar/16-bit-Brent-Kung-Adder/assets/106365754/9c5c28a5-18c4-4e93-ace3-9e37ea5ed27a)
#### Level 5
![image](https://github.com/ujwaluttarwar/16-bit-Brent-Kung-Adder/assets/106365754/4edb48f6-02cb-4220-8dc3-0fdf681e8770)
#### Complete RTL View
![image](https://github.com/ujwaluttarwar/16-bit-Brent-Kung-Adder/assets/106365754/54047dc3-251d-4df4-982c-1a1163a003d5)
### Output To Test Inputs
Test inputs
![image](https://github.com/ujwaluttarwar/16-bit-Brent-Kung-Adder/assets/106365754/4be0973a-6321-4eca-a9ca-c359c0d1d4b7)
![image](https://github.com/ujwaluttarwar/16-bit-Brent-Kung-Adder/assets/106365754/c3eeacaa-56ae-43bc-8580-8370cc7b5253)

