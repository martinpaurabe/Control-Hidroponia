#ifndef UNIT_DISP_H
#define UNIT_DISP_H
//==============================================================================================================

#include "Def_ModHidro.h"
//--------------------------------------------------------------------------------------------------------------


#define NUM_DISP  1

#define MSG_REPLAY_DELAY 900

extern TModHidro ModHidro;


void Init_Disp(void);
void Inc_Timer(void);
void Ctrl_Auto(void);
void sciDataReceived(byte *buf);


//==============================================================================================================






#endif  //End of UNIT_DISP_H//