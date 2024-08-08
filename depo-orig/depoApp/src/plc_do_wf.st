program PLC_DO_WF

%%#include <math.h>

short debug;
assign debug to "{P}Debug";
monitor debug;

short write_DO_Wf;
assign write_DO_Wf to "{P}WriteDO-Wf";
monitor write_DO_Wf;

/* index offsets based on starting address of V2070, 6-word block */
#define DO1_Indx 0
short DO1;
assign DO1 to "{P}DO:1-SP";
monitor DO1;

#define DO2_Indx 1
short DO2;
assign DO2 to "{P}DO:2-SP";
monitor DO2;

#define DO3_Indx 2
short DO3;
assign DO3 to "{P}DO:3-SP";
monitor DO3;

#define DO4_Indx 3
short DO4;
assign DO4 to "{P}DO:4-SP";
monitor DO4;

#define DO5_Indx 4
short DO5;
assign DO5 to "{P}DO:5-SP";
monitor DO5;

#define DO6_Indx 5
short DO6;
assign DO6 to "{P}DO:6-SP";
monitor DO6;



