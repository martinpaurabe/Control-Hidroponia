#include <vcl.h>
#pragma hdrstop

#include "Unit_DialogConexion.h"

#pragma package(smart_init)
#pragma resource "*.dfm"

#include "Unit_Gral.h"
#include "Unit_PuertoCom.h"
#include "Unit_ThreadComPort.h"

TDialogConexion *DialogConexion;

__fastcall TDialogConexion::TDialogConexion(TComponent* Owner)
        : TForm(Owner)
{
    ComboBoxPuerto->Enabled = true;
    EstConexion->Caption = "Desconectado";
    EstConexion->Font->Color = clRed;
    ButtonConexion->Caption = "Conectar";
    return;
}
//---------------------------------------------------------------------------


__fastcall TDialogConexion::~TDialogConexion(void)
{
 return;
}

//---------------------------------------------------------------------------


void __fastcall TDialogConexion::ButtonConexionClick(TObject *Sender)
{
  if(ComAbierto())
  {
    ThreadComPort->Terminate();
    ThreadComPort->WaitFor();
    delete ThreadComPort;

    CloseCommPort();

    ComboBoxPuerto->Enabled = true;
    EstConexion->Caption = "Desconectado";
    EstConexion->Font->Color = clRed;
    ButtonConexion->Caption = "Conectar";
  }
  else
  {
    OpenCommPort(BAUDRATE, ComboBoxPuerto->ItemIndex + 1); //Abro comunicacion

    if(ComAbierto())
    {

      ComboBoxPuerto->Enabled = false;
      EstConexion->Caption = "  Conectado  ";
      EstConexion->Font->Color = clGreen;
      ButtonConexion->Caption = "Desconectar";
      Application->CreateForm(__classid(TForm_Gral), &Form_Gral);
      Form_Gral->TimerSciTx->Interval=DialogConexion->Show_Periodo_Muestreo->Text.ToInt();
	  Form_Gral->Visible=true;
	  DialogConexion->Visible=false;

	}
  }
}
//---------------------------------------------------------------------------

void __fastcall TDialogConexion::CloseBtnClick(TObject *Sender)
{
  if(ComAbierto())
  {
    ThreadComPort->Terminate();
    ThreadComPort->WaitFor();
    delete ThreadComPort;

    CloseCommPort();
  }
  DialogConexion->Close();
}
//---------------------------------------------------------------------------


