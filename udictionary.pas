unit uDictionary;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

   { TForm1 }

   TForm1 = class(TForm)
   private

   public
      function teste : string;
   end;

var
   Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function TForm1.teste: string;
var
   teste : tuple of (string, integer, boolean);
begin

end;

end.

