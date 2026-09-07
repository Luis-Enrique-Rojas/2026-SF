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
      function digMayor():integer;
      function digMenor():integer;
      function invertir():integer;
      function capicua():boolean;
      function esPar():boolean; //si el numero es par o no
      function esImpar():boolean;
      function esPrimo():boolean;
      function binario():string;
      function octal():string;
      function hexadecimal():string;
      function baseN(b:integer):string;
      function romano():string;
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

function Natural.digMayor: integer; //AGREGAR MAS BOTONES
  var
  aux,dig,mayor:integer;
begin
  aux:=valor;
  mayor:=0;
  while (aux <> 0) do
  begin
    dig:=aux mod 10;
    if (dig > mayor) then
      mayor:=dig;
    aux:=aux div 10;
  end;
  result:=mayor;
end;

function Natural.digMenor: integer;
var
  aux,dig,menor:integer;
begin
  aux:=valor;
  menor:=9;
  while (aux <> 0) do
  begin
    dig:=aux mod 10;
    if (dig < menor) then
      menor:=dig;
    aux:=aux div 10;
  end;
  result:=menor;
end;

function Natural.invertir: integer;
var
  aux,dig,inv:integer;
begin
  aux:=valor;
  inv:=0;
  while (aux <> 0) do
  begin
    dig:=aux mod 10;
    inv:=inv*10+dig;
    aux:=aux div 10;
  end;
  result:=inv;
end;

function Natural.capicua: boolean;
begin
  result:=valor=Invertir;
end;

function Natural.esPar: boolean;
begin
  result:=valor mod 2=0;
end;

function Natural.esImpar: boolean;
begin
  result:=valor mod 2<>0;
end;

function Natural.esPrimo: boolean;
var
  i:integer;
  primo:boolean;
begin
  if (valor < 2) then
    result:=false
  else
  begin
    primo:=true;
    i:=2;
    while (i <= valor div 2) and primo do
    begin
      if (valor mod i=0) then
        primo:=false;
      i:=i+1;
    end;
    result:=primo;
  end;
end;

function Natural.binario: string;
var
  aux,resto:integer;
  cad:string;
begin
  aux:=valor;
  cad:='';
  if aux=0 then
    cad:='0';
  while (aux > 0) do
  begin
    resto:=aux mod 2;
    cad:=IntToStr(resto)+cad;
    aux:=aux div 2;
  end;
  result:=cad;
end;

function Natural.octal: string;
  var
  aux,resto:integer;
  cad:string;
begin
  aux:=valor;
  cad:='';
  if aux=0 then
    cad:='0';
  while (aux > 0) do
  begin
    resto:=aux mod 8;
    cad:=IntToStr(resto)+cad;
    aux:=aux div 8;
  end;
  result:=cad;
end;

function Natural.hexadecimal: string;
var
  aux,resto:integer;
  cad:string;
begin
  aux:=valor;
  cad:='';
  if aux=0 then
    cad:='0';
  while (aux > 0) do
  begin
    resto:=aux mod 16;
    if (resto < 10) then
      cad:=IntToStr(resto)+cad
    else
      cad:=Chr(Ord('A')+resto-10)+cad;
    aux:=aux div 16;
  end;
  result:=cad;
end;

function Natural.baseN(b: integer): string;
var
  aux,resto:integer;
  cad:string;
begin
  aux:=valor;
  cad:='';
  if aux=0 then
    cad:='0';
  while (aux > 0) do
  begin
    resto:=aux mod b;
    if (resto < 10) then
      cad:=IntToStr(resto)+cad
    else
      cad:=Chr(Ord('A')+resto-10)+cad;
    aux:=aux div b;
  end;
  result:=cad;
end;

function Natural.romano: string;
var
  aux:integer;
  cad:string;
begin
  aux:=valor;
  cad:='';
  while (aux >= 1000) do
  begin
    cad:=cad+'M';
    aux:=aux-1000;
  end;
  while (aux >= 900) do
  begin
    cad:=cad+'CM';
    aux:=aux-900;
  end;
  while (aux >= 500) do
  begin
    cad:=cad+'D';
    aux:=aux-500;
  end;
  while (aux >= 400) do
  begin
    cad:=cad+'CD';
    aux:=aux-400;
  end;
  while (aux >= 100) do
  begin
    cad:=cad+'C';
    aux:=aux-100;
  end;
  while (aux >= 90) do
  begin
    cad:=cad+'XC';
    aux:=aux-90;
  end;
  while (aux >= 50) do
  begin
    cad:=cad+'L';
    aux:=aux-50;
  end;
  while (aux >= 40) do
  begin
    cad:=cad+'XL';
    aux:=aux-40;
  end;
  while (aux >= 10) do
  begin
    cad:=cad+'X';
    aux:=aux-10;
  end;
  while (aux >= 9) do
  begin
    cad:=cad+'IX';
    aux:=aux-9;
  end;
  while (aux >= 5) do
  begin
    cad:=cad+'V';
    aux:=aux-5;
  end;
  while (aux >= 4) do
  begin
    cad:=cad+'IV';
    aux:=aux-4;
  end;
  while (aux >= 1) do
  begin
    cad:=cad+'I';
    aux:=aux-1;
  end;
  result:=cad;
end;

end.

