unit fnatural;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, UNatural;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    v: TEdit;
    dig: TEdit;
    posi: TEdit;
    Label1: TLabel;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
     N:Natural;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  N:=Natural.crear();//Inicializa Instancia
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
   v.Text := IntToStr(N.digMenor());
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
    v.Text:=N.binario();
end;

procedure TForm1.Button22Click(Sender: TObject);
begin
   v.Text:=N.octal();
end;

procedure TForm1.Button23Click(Sender: TObject);
begin
    v.Text:=N.hexadecimal();
end;

procedure TForm1.Button24Click(Sender: TObject);
begin
    v.Text:=N.baseN(StrToInt(dig.Text));
end;

procedure TForm1.Button25Click(Sender: TObject);
begin
     v.Text:=N.romano();
end;

procedure TForm1.Button10Click(Sender: TObject);
var
  p: integer;
begin
  p := StrToInt(posi.Text);
  N.eliminar(p);
  v.Text := IntToStr(N.getValor());
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
   v.Text := N.digPares();
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
    v.Text := N.digImpares();
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
     v.Text := BoolToStr(N.capicua(),True);
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
    v.Text := IntToStr(N.invertir());
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
   v.Text := BoolToStr(N.esPar(), True);
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
    v.Text := BoolToStr(N.esImpar(), True);
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
   v.Text := IntToStr(N.digMayor());
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
    v.Text := N.digPrimos();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  N.setValor(StrToInt(v.text));
  v.Text:='';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  v.text:=IntToStr(N.getValor());
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  v.Text:=IntToStr(N.digSum());
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  v.Text:=IntToStr(N.digCant());
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Close();
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  d, p: integer;
begin
  d := StrToInt(dig.Text);
  p := StrToInt(posi.Text);
  N.insertar(d, p);
  v.Text := IntToStr(N.getValor());
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  v.Clear;
  dig.Clear;
  posi.Clear;
end;

procedure TForm1.Button9Click(Sender: TObject);
var
  p,dig_posi:integer;
begin
  p:=StrToInt(posi.Text);
  dig_posi:=N.obtener(p);
  v.Text:=IntToStr(dig_posi);
end;

end.

