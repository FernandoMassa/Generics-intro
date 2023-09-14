unit GenArray;

{$mode delphi}{$H+}

interface

uses
   Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin, LazSysUtils, TypInfo;

type
   TDias = (Segunda, Terca, Quarta, Quinta, Sexta, Sabado, Domingo);
   TMes = (Janeiro, Fevereiro, Marco, Abril, Maio, Junho, Julho, Agosto, Setembro, Outubro, Novembro, Dezembro);

   { TEnumUtil }

   TEnumUtil<T> = class
      class procedure EnumToList(Value: TStrings);
   end;

   { TUtil }

   TUtil = class
      class function IIF<T>(aCondicao: boolean; T1, T2: T): T;
   end;

   { TPessoa }

   TPessoa = class
   private
      Fnome: string;
      procedure Setnome(AValue: string);
   public
      property nome: string read Fnome write Setnome;
      constructor Create;
   end;

   { TForm1 }

   TForm1 = class(TForm)
      Button1: TButton;
      Button2: TButton;
      Button3: TButton;
      Button4: TButton;
      cbxLista: TComboBox;
      edtTeste: TEdit;
      edtString: TEdit;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      edtInt: TSpinEdit;
      procedure Button1Click(Sender: TObject);
      procedure Button2Click(Sender: TObject);
      procedure Button3Click(Sender: TObject);
      procedure Button4Click(Sender: TObject);
   private

   public

   end;

var
   Form1: TForm1;

implementation

{$R *.lfm}

{ TEnumUtil }

class procedure TEnumUtil<T>.EnumToList(Value: TStrings);
var
   Aux: string;
   I, vPos: integer;
   qtd: integer;
begin
   Value.Clear;
   i := 0;
   qtd := GetEnumNameCount(TypeInfo(T));
   repeat
      Aux := GetEnumName(TypeInfo(T), I);

      if i < qtd then Value.Add(Aux);

      Inc(I);
   until i > qtd;

end;

{ TUtil }

class function TUtil.IIF<T>(aCondicao: boolean; T1, T2: T): T;
begin
   if aCondicao then
      Result := T1
   else
      Result := T2;
end;

{ TPessoa }

procedure TPessoa.Setnome(AValue: string);
begin
   Fnome := AValue;
end;

constructor TPessoa.Create;
begin
   Fnome := 'Fulano de tal';
end;

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
   TEnumUtil<TMes>.EnumToList(cbxLista.Items);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   TEnumUtil<TDias>.EnumToList(cbxLista.Items);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   edtString.Text := TUtil.IIF<string>((edtTeste.Text <> ''), edtTeste.Text, 'Vazio');
   edtInt.Value := TUtil.IIF<integer>((StrToIntDef(edtTeste.Text, -1) > -1), StrToIntDef(edtTeste.Text, -2), -7);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
   vPessoa1,vPessoa2,vPessoa3 : TPessoa;
begin
   vPessoa2 := nil;
   vPessoa3 := nil;
   vPessoa1 := TPessoa.Create;
   vPessoa1.nome := 'Marcelo';

   vPessoa3 := TUtil.IIF<TPessoa>(Assigned(vPessoa2) , vPessoa2, TPessoa.Create);

   ShowMessage(vPessoa3.nome);

   FreeAndNil(vPessoa2);
   FreeAndNil(vPessoa3);
   FreeAndNil(vPessoa1);
end;

end.
