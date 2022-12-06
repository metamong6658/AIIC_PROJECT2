# AIIC_PROJECT2
In paper, Actual devices are PRAM(not ReRAM). But, It's not significant.

RRAM based DNN simulation both fowarding and backwarding using verilog-A.

Application is implemented by my coworkers.

## How to Run
Simulation tool : Questa sim(Model sim). Verilog-A supports only simulation. This code can't synthesis netlist.

1). valib RRAM_lib (You can change work directory name but you have to change .cmd file's work directiory name)

2). valog *.v (All file compile)

3). vasim -cmd RRAM_unit.cmd (You can change cmd file's name)

## Current Path Architecutre
![image](https://user-images.githubusercontent.com/109369687/204360414-39a79b8f-842f-4891-a162-0ff270cb142d.png)

This presentation has some problem(Focused on Loss function's connection, You can find it). Updated presentation is uploded /Doc/presentation.pptx
## Application Architecture
![image](https://user-images.githubusercontent.com/109369687/204360681-de30c5bc-4ecd-4a9f-9f31-124859808208.png)

## Model Sequence
![image](https://user-images.githubusercontent.com/109369687/204360818-f0357d3c-84eb-4749-b586-2755a47b08b4.png)
![image](https://user-images.githubusercontent.com/109369687/204360913-465b83cb-d232-4462-ad06-94c84df69a76.png)

## FSM for Test
![image](https://user-images.githubusercontent.com/109369687/204361054-f372e1b7-21ca-4807-9a80-320caa900daa.png)
