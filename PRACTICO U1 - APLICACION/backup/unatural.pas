unit unatural;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type

  { Natural }

  Natural = Class
    private
      valor:integer;
    public
      constructor crear();
      procedure setValor(val:integer);
      function getValor():integer;
      function digCant():integer;
      function digSum():integer; //CTRL+SFHIT+C
      procedure insertar(dig,posi:integer);
      function obtener(posi:integer):integer;
      procedure eliminar(posi:integer);
      function digPares():string;
      function digImpares():string;
      function digPrimos():string;
  end;

implementation

{ Natural }

constructor Natural.crear;
begin
  valor:=0;
end;

procedure Natural.setValor(val:integer);
begin
   valor:=val;
end;

function Natural.getValor: integer;
begin
    result:=valor;
end;

function Natural.digCant: integer;
var
  cd,aux:integer;
begin
  cd:=0;
  aux:=valor;
  while (aux <> 0) do
  begin
       aux:= aux div 10;
       cd:= cd + 1;
  end;
  result:=cd;
end;

function Natural.digSum: integer;
var
  sum,aux,dig:integer;
begin
   sum:=0;
   aux:=valor;
   while (aux <> 0) do
   begin
       dig:= aux MOD 10;
       aux:= aux DIV 10;
       sum:= sum + dig;
   end;
   result:=sum;
end;

procedure Natural.insertar(dig, posi: integer);
var
  der, izq, pot, totalDig: integer;
begin
  totalDig := digCant();

  if (posi >= 1) and (posi <= totalDig + 1) then
  begin
    pot := Trunc(Exp((totalDig - posi + 1) * Ln(10)));
    izq := valor div pot;
    der := valor mod pot;
    valor := (izq * 10 + dig) * pot + der;
  end;
end;

function Natural.obtener(posi: integer): integer;
var
  aux,potencia,dig:integer;
begin
  aux:=valor;
  potencia:=1;
  while (posi < digCant) do
  begin
    potencia:=potencia*10;
    posi:=posi+1;
  end;
  dig:=aux div potencia;
  dig:=dig mod 10;
  result:=dig;
end;

procedure Natural.eliminar(posi: integer);
var
  potencia,parte1,parte2,cant:integer;
begin
  cant:=digCant;
  potencia:=1;
  while (posi < cant) do
  begin
    potencia:=potencia*10;
    posi:=posi+1;
  end;
  parte1:=valor div (potencia*10);
  parte2:=valor mod potencia;
  valor:=parte1*potencia+parte2;
end;

function Natural.digPares: string;
var
  aux,dig:integer;
  cad:string;
begin
  aux:=valor;
  cad:='';
  while (aux <> 0) do
  begin
    dig:=aux mod 10;
    if (dig mod 2 = 0) then
      cad:=IntToStr(dig)+' '+cad;
    aux:=aux div 10;
  end;
  result:=cad;
end;

function Natural.digImpares: string;
var
  aux,dig:integer;
  cad:string;
begin
  aux:=valor;
  cad:='';
  while (aux <> 0) do
  begin
    dig:=aux mod 10;
    if (dig mod 2 <> 0) then
      cad:=IntToStr(dig)+' '+cad;
    aux:=aux div 10;
  end;
  result:=cad;
end;

function Natural.digPrimos: string;
var
  aux,dig:integer;
  cad:string;
begin
  aux:=valor;
  cad:='';
  while (aux <> 0) do
  begin
    dig:=aux mod 10;
    if (dig=2) or (dig=3) or (dig=5) or (dig=7) then
      cad:=IntToStr(dig)+' '+cad;
    aux:=aux div 10;
  end;
  result:=cad;
end;

end.

