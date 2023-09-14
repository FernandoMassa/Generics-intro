unit gen04;

{$mode delphi}{$H+}

interface

uses
   Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, generics.collections;

type

   { TForm1 }

   TForm1 = class(TForm)
      brnRemover1: TButton;
      brnRemover2: TButton;
      brnRemover3: TButton;
      brnRemover4: TButton;
      brnRemover5: TButton;
      btnAdd: TButton;
      brnRemover: TButton;
      btnAdd1: TButton;
      btnAdd2: TButton;
      btnCapacity1: TButton;
      btnCapacity2: TButton;
      btnCount: TButton;
      btnCount1: TButton;
      btnCount2: TButton;
      btnEspiar1: TButton;
      btnOnNotify: TButton;
      btnListar: TButton;
      btnCapacity: TButton;
      btnEspiar: TButton;
      btnOnNotify1: TButton;
      btnOnNotify2: TButton;
      Edit1: TEdit;
      Inteiros: TLabel;
      Inteiros1: TLabel;
      Inteiros2: TLabel;
      Memo1: TMemo;
      procedure brnRemover1Click(Sender: TObject);
      procedure brnRemover2Click(Sender: TObject);
      procedure brnRemover3Click(Sender: TObject);
      procedure brnRemover4Click(Sender: TObject);
      procedure brnRemover5Click(Sender: TObject);
      procedure brnRemoverClick(Sender: TObject);
      procedure btnAdd1Click(Sender: TObject);
      procedure btnAdd2Click(Sender: TObject);
      procedure btnAddClick(Sender: TObject);
      procedure btnCapacity1Click(Sender: TObject);
      procedure btnCapacity2Click(Sender: TObject);
      procedure btnCapacityClick(Sender: TObject);
      procedure btnCount1Click(Sender: TObject);
      procedure btnCount2Click(Sender: TObject);
      procedure btnCountClick(Sender: TObject);
      procedure btnEspiar1Click(Sender: TObject);
      procedure btnEspiarClick(Sender: TObject);
      procedure btnListarClick(Sender: TObject);
      procedure btnOnNotify1Click(Sender: TObject);
      procedure btnOnNotify2Click(Sender: TObject);
      procedure btnOnNotifyClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
      procedure FormCreate(Sender: TObject);
   private
      ListaNum: TList<integer>;
      Fila: TQueue<string>;
      Pilha : TStack<String>;
      procedure Notificacao(Sender: TObject; constref Item: integer; Action: TCollectionNotification);
      procedure NotificacaoS(Sender: TObject; constref Item: AnsiString; Action: TCollectionNotification);

   public

   end;

var
   Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
   ListaNum := TList<integer>.Create;
   Fila := TQueue<string>.Create;
   Pilha := TStack<string>.Create;
end;

procedure TForm1.btnAddClick(Sender: TObject);
begin
   ListaNum.Add(StrToIntDef(Edit1.Text, -7));
end;

procedure TForm1.btnCapacity1Click(Sender: TObject);
begin
   Memo1.Lines.Clear;
   Memo1.Lines.Add(Fila.Capacity.ToString);
end;

procedure TForm1.btnCapacity2Click(Sender: TObject);
begin
   Memo1.Lines.Clear;
   Memo1.Lines.Add(Pilha.Capacity.ToString);
end;

procedure TForm1.btnCapacityClick(Sender: TObject);
begin
   Memo1.Lines.Clear;
   Memo1.Lines.Add(ListaNum.Capacity.ToString);
end;

procedure TForm1.btnCount1Click(Sender: TObject);
begin
   Memo1.Lines.Clear;
   Memo1.Lines.Add(Fila.Count.ToString);
end;

procedure TForm1.btnCount2Click(Sender: TObject);
begin
   Memo1.Lines.Add(Pilha.Count.ToString);
end;

procedure TForm1.btnCountClick(Sender: TObject);
begin
   Memo1.Lines.Clear;
   Memo1.Lines.Add(ListaNum.Count.ToString);
end;

procedure TForm1.btnEspiar1Click(Sender: TObject);
begin
   Memo1.Lines.Add(Pilha.Peek);
end;

procedure TForm1.btnEspiarClick(Sender: TObject);
begin
   Memo1.Lines.Add(Fila.Peek);
end;

procedure TForm1.brnRemoverClick(Sender: TObject);
begin
   ListaNum.Delete(Pred(ListaNum.Count));
   ListaNum.TrimExcess;
end;

procedure TForm1.btnAdd1Click(Sender: TObject);
begin
   Fila.Enqueue(Edit1.Text);
end;

procedure TForm1.btnAdd2Click(Sender: TObject);
begin
   Pilha.Push(Edit1.Text);
end;

procedure TForm1.brnRemover1Click(Sender: TObject);
begin
   ListaNum.ExtractIndex(Pred(ListaNum.Count));

end;

procedure TForm1.brnRemover2Click(Sender: TObject);
begin
   Memo1.Lines.Add(Fila.Extract);
end;

procedure TForm1.brnRemover3Click(Sender: TObject);
begin
   Memo1.Lines.Add(Fila.Dequeue)
end;

procedure TForm1.brnRemover4Click(Sender: TObject);
begin
    Memo1.Lines.Add(Pilha.Pop); // remove primeiro registro
end;

procedure TForm1.brnRemover5Click(Sender: TObject);
begin
   Memo1.Lines.Add(Pilha.Extract);
end;

procedure TForm1.btnListarClick(Sender: TObject);
var
   i: integer;
begin
   Memo1.Lines.Clear;
   for i := 0 to Pred(ListaNum.Count) do
      Memo1.Lines.Add(ListaNum[i].ToString);

end;

procedure TForm1.btnOnNotify1Click(Sender: TObject);
begin
   Fila.OnNotify := NotificacaoS;
end;

procedure TForm1.btnOnNotify2Click(Sender: TObject);
begin
   Pilha.OnNotify := NotificacaoS;
end;

procedure TForm1.btnOnNotifyClick(Sender: TObject);
begin
   ListaNum.OnNotify := Notificacao;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
   ListaNum.Free;
   Fila.Free;
   Pilha.Free;
end;

procedure TForm1.Notificacao(Sender: TObject; constref Item: integer; Action: TCollectionNotification);
begin
   case Action of
      cnAdded: Memo1.Lines.Add('O item ' + item.ToString + 'foi adicionado');
      cnRemoved: Memo1.Lines.Add('O item ' + item.ToString + 'foi removido');
      cnExtracted: Memo1.Lines.Add('O item ' + item.ToString + 'foi extraido');
   end;
end;
// gen04.pas(145,21) Error: Incompatible types: got "TForm1.NotificacaoS(TObject;constref LongInt;TCollectionNotification);" expected "<procedure variable type of
     //               procedure(TObject;constref AnsiString;TCollectionNotification) of object;Register>"
procedure TForm1.NotificacaoS(Sender: TObject; constref Item: AnsiString; Action: TCollectionNotification);
begin
   case Action of
      cnAdded: Memo1.Lines.Add('O item ' + item  + ' foi adicionado');
      cnRemoved: Memo1.Lines.Add('O item ' + item  + ' foi removido');
      cnExtracted: Memo1.Lines.Add('O item ' + item  + ' foi extraido');
   end;
end;

end.
