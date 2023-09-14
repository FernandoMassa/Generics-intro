unit GenExemplo;

{$mode delphi}{$H+}

interface

uses
   Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type
   { TPessoa }

   TPessoa<T : constructor> = class
			private
							FTipo: T;
							procedure SetTipo(AValue: T);

			public
     Property Tipo : T read FTipo write SetTipo;
     constructor Create;
			end;

			{ TPFisica }

   TPFisica = class
			private
							FCPF: String;
							procedure SetCPF(AValue: String);
			public
     property CPF : String read FCPF write SetCPF;
			end;

			{ TPJuridica }

   TPJuridica = class
			private
							FCNPJ: String;
							procedure SetCNPJ(AValue: String);
			public
     property CNPJ : String read FCNPJ write SetCNPJ;
			end;


			{ TForm1 }

   TForm1 = class(TForm)
							btnFisica: TButton;
							btnJurid: TButton;
							procedure btnFisicaClick(Sender: TObject);
							procedure btnJuridClick(Sender: TObject);
   private

   public

   end;

var
   Form1: TForm1;

implementation

{$R *.lfm}

{ TPessoa }

procedure TPessoa<T>.SetTipo(AValue: T);
begin
				FTipo := AValue;
end;

constructor TPessoa<T>.Create;
begin
  FTipo := T.create;
end;

{ TForm1 }

procedure TForm1.btnFisicaClick(Sender: TObject);
var
  PF : TPessoa<TPFisica>;
begin
  PF := TPessoa<TPFisica>.create;
  try
     PF.Tipo.CPF := '798798798797' ;
     ShowMessage(PF.Tipo.CPF);
		finally
    PF.Free;
		end;

end;

procedure TForm1.btnJuridClick(Sender: TObject);
var
  PJ : TPessoa<TPJuridica>;
begin
  PJ := TPessoa<TPJuridica>.create;
  try
     PJ.Tipo.CNPJ := '456456456666655/5555' ;
     ShowMessage(PJ.Tipo.CNPJ);
		finally
    PJ.Free;
		end;
end;

{ TPJuridica }

procedure TPJuridica.SetCNPJ(AValue: String);
begin
				FCNPJ:=AValue;
end;

{ TPFisica }

procedure TPFisica.SetCPF(AValue: String);
begin
				FCPF:=AValue;
end;

end.
