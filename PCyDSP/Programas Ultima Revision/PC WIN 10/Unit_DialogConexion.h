//---------------------------------------------------------------------------

#ifndef Unit_DialogConexionH
#define Unit_DialogConexionH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TDialogConexion : public TForm
{
__published:	// IDE-managed Components
        TComboBox *ComboBoxPuerto;
        TButton *CloseBtn;
        TButton *ButtonConexion;
        TLabel *EstConexion;
        TLabel *Label7;
	TEdit *Show_Periodo_Muestreo;
        void __fastcall ButtonConexionClick(TObject *Sender);
        void __fastcall CloseBtnClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TDialogConexion(TComponent* Owner);
        __fastcall ~TDialogConexion(void);
};
//---------------------------------------------------------------------------
extern PACKAGE TDialogConexion *DialogConexion;
//---------------------------------------------------------------------------
#endif
