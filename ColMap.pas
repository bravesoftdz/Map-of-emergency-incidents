unit ColMap;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;
Const
  n = 17;
  kek = trunc(255*5.78);
  shift = kek div n;

type
  TColorQueue = (green, red, blue);
  TRecordCust = record
  green,red,blue:Integer;
  end;


  TForm1 = class(TForm)
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  MassOfStandart: array[1..N] of TRecordCust;
  K: TRecordCust;

implementation

{$R *.dfm}

procedure Succa(var Clr: TColorQueue);
begin
clr := succ(clr);
if( ord(Clr) > 2 ) then
Clr := green;
end;

procedure SuccBool(var boolTemp:Boolean);
begin
if boolTemp then
  boolTemp := False
else
  boolTemp := True;
end;

function LessThen255(ColorT: TColorQueue): boolean;
begin
case ColorT of
blue: Result:= K.blue < 255;
green: Result:= K.green < 255;
red: Result:= K.red < 255
end;
end;

function MoreThen0(ColorT: TColorQueue): boolean;
begin
case ColorT of
blue: Result:= K.blue > 0;
green: Result:= K.green > 0;
red: Result:= K.red > 0
end;
end;

procedure IncKColorT(ColorT: TColorQueue);
begin
case ColorT of
blue: Inc(K.blue);
green: Inc(K.green);
red: Inc(K.red);
end;
end;

procedure DecKColorT(ColorT: TColorQueue);
begin
case ColorT of
blue: Dec(K.blue);
green: Dec(K.green);
red: Dec(K.red);
end;
end;

procedure creatingBasicColors();
var
  trg_plus, exitbool: Boolean;
  i:Byte;
  deltaShift: Integer;
  colorT: TColorQueue;
begin
K.red := 255;
K.green := 0;
K.blue := 0;

MassOfStandart[1].green := K.green;
MassOfStandart[1].red := K.red;
MassOfStandart[1].blue := K.blue;

trg_plus := true;
colorT := green;

for i:=2 to N do
begin
	exitbool := false;
	deltaShift := shift;
	while not(exitbool) do
	begin
		case trg_plus of
		true:
			begin
			while LessThen255(colorT) and (deltaShift <> 0) do
				begin
				IncKColorT(colorT);
				dec(deltaShift);
				end;
			end
		else
			begin
			while MoreThen0(colorT) and (deltaShift <> 0) do
				begin
				DecKColorT(colorT);
				dec(deltaShift);
				end;
			end;
    end;

		if (deltaShift = 0) then
			begin
			MassOfStandart[i].green := K.green;
			MassOfStandart[i].red := K.red;
			MassOfStandart[i].blue := K.blue;
			exitbool:=true;
			end
		else
			begin
			Succbool(trg_plus);
			SuccA(colorT);
			end;
	end;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i:integer;
begin
  creatingBasicColors;
  for i := 1 to n do
  begin
    Image1.Canvas.Brush.Color := RGB( MassOfStandart[i].red, MassOfStandart[i].green, MassOfStandart[i].blue );
    Image1.Canvas.Rectangle(0+i*20,0,i*20 + 20,200);
    image1.Canvas.Brush.Color := clwhite;
    Image1.Canvas.TextOut(i*20, i*20 + 300, IntToStr(MassOfStandart[i].red) + ' ' +  IntToStr(MassOfStandart[i].green) + ' '+ IntToStr(MassOfStandart[i].blue));

  end;
end;

end.
