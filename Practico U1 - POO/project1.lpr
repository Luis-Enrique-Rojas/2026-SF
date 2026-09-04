program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, SysUtils;

// DEFINICION DE LA CLASE
type
  PracticoU1 = class
    public
      procedure ej1(k:integer);
      procedure ej2(n:integer);
      function ej3(n:integer):integer;
      procedure ej4(n:integer);
      procedure ej5(n:integer);
      function ej6(n,m:integer):integer;
      function ej7(n,m:integer):integer;
      function ej8(n,m:integer):integer;
      function ej9(n,m:integer):integer;
      function ej10(n,m:integer):integer;
      function ej11(n, m: integer): integer;
      function ej12(n, b: integer): LongInt;
      function ej13(c1, c2, c3: char): integer;
      function ej14(s, c1, c2, c3: char): integer;
      function ej15(s: char; digitos: string): LongInt;
      function ej16(n1, n2: integer; oper: char): real;
      function ej17(s1: char; d1: string; s2: char; d2: string; oper: char): real;
      function ej18(n: integer): string;
      function ej19(f: real): string;
      function ej20(n: real): string;
      procedure ej21(n: Int64; var m1, m2: integer);
      procedure ej22(n: Int64; var min1, min2: integer);
      function ej23(a, b: Int64): string;
      function ej24(a, b: Int64): string;
  end;

// IMPLEMENTACION

// 1. Imprimir primeros k naturales
procedure PracticoU1.ej1(k:integer);
var
  i:integer;
begin
  writeln('Primeros ',k,' numeros naturales:');
  for i:=1 to k do
    write(i,' ');
  writeln;
end;

// 2. Imprimir primeros n naturales
procedure PracticoU1.ej2(n:integer);
var
  i:integer;
begin
  writeln('Primeros ',n,' numeros naturales:');
  for i:=1 to n do
    write(i,' ');
  writeln;
end;

// 3. Suma de los primeros n naturales
function PracticoU1.ej3(n:integer):integer;
var
  i,suma:integer;
begin
  suma:=0;
  for i:=1 to n do
    suma:=suma+i;
  result:=suma;
end;

// 4. Primeras n letras del alfabeto
procedure PracticoU1.ej4(n:integer);
var
  i:integer;
  letra:char;
begin
  if (n>=1) and (n<=26) then
  begin
    writeln('Primeras ',n,' letras del alfabeto:');
    for i:=0 to n-1 do
    begin
      letra:=chr(65+i); // ASCII A=65
      write(letra,' ');
    end;
    writeln;
  end
  else
    writeln('Error: n debe estar entre 1 y 26');
end;
 procedure PracticoU1.ej5(n:integer);
var
  i,contador:integer;
begin
  contador:=0;

  if (n mod 2 = 0) then
  begin
    writeln('Primeros ',n,' numeros PARES:');
    i:=2;
    while contador<n do
    begin
      write(i,' ');
      i:=i+2;
      contador:=contador+1;
    end;
  end
  else
  begin
    writeln('Primeros ',n,' numeros IMPARES:');
    i:=1;
    while contador<n do
    begin
      write(i,' ');
      i:=i+2;
      contador:=contador+1;
    end;
  end;

  writeln;
end;
function PracticoU1.ej6(n,m:integer):integer;
var
  i,res:integer;
begin
  res:=0;
  for i:=1 to m do
    res:=res+n;

  result:=res;
end;
function PracticoU1.ej7(n,m:integer):integer;
var
  contador:integer;
begin
  contador:=0;

  while n>=m do
  begin
    n:=n-m;
    contador:=contador+1;
  end;

  result:=contador; // cociente entero
end;
function PracticoU1.ej8(n,m:integer):integer;
var
  i,res,signo:integer;
begin
  res:=0;
  signo:=1;

  if (m<0) then
  begin
    m:=-m;
    signo:=-1;
  end;

  for i:=1 to m do
    res:=res+n;

  result:=res*signo;
end;
function PracticoU1.ej9(n,m:integer):integer;
var
  contador,signo:integer;
begin
  contador:=0;
  signo:=1;

  if (n<0) then
  begin
    n:=-n;
    signo:=-signo;
  end;

  if (m<0) then
  begin
    m:=-m;
    signo:=-signo;
  end;

  while n>=m do
  begin
    n:=n-m;
    contador:=contador+1;
  end;
  if m=0 then
begin
  writeln('Error: division por cero');

  result:=contador*signo;
  readln();
  end;
end;
function PracticoU1.ej10(n,m:integer):integer;
var
  i,res:integer;
begin
  res:=1;

  for i:=1 to m do
    res:=res*n;

  result:=res;
end;
function PracticoU1.ej11(n, m: integer): integer;
var i, res: integer;
begin
  if m=0 then exit(1);
  res := n;
  for i := 2 to m do res := ej6(res, n); // Reutiliza producto por sumas
  result := res;
end;

function PracticoU1.ej12(n, b: integer): LongInt;
var residuo, p10, res: LongInt;
begin
  res := 0; p10 := 1;
  while n > 0 do begin
    residuo := n mod b;
    res := res + (residuo * p10);
    n := n div b;
    p10 := p10 * 10;
  end;
  result := res;
end;

function PracticoU1.ej13(c1, c2, c3: char): integer;
begin
  result := (ord(c1)-48)*100 + (ord(c2)-48)*10 + (ord(c3)-48);
end;

function PracticoU1.ej14(s, c1, c2, c3: char): integer;
var num, signo: integer;
begin
  num := ej13(c1, c2, c3);
  if s = '-' then signo := -1 else signo := 1;
  result := num * signo;
end;

function PracticoU1.ej15(s: char; digitos: string): LongInt;
var i: integer; num, p10: LongInt;
begin
  num := 0; p10 := 1;
  for i := length(digitos) downto 1 do begin
    num := num + (ord(digitos[i]) - 48) * p10;
    p10 := p10 * 10;
  end;
  if s = '-' then num := -num;
  if (num < -32768) or (num > 32767) then writeln('Fuera de rango 16-bit!');
  result := num;
end;
function PracticoU1.ej16(n1, n2: integer; oper: char): real;
begin
  case oper of
    '+': result := n1 + n2;
    '-': result := n1 - n2;
    '*': result := n1 * n2;
    '/': if n2<>0 then result := n1 / n2 else result := 0;
  else result := 0;
  end;
end;

// 17. Calculadora caracter a caracter
function PracticoU1.ej17(s1: char; d1: string; s2: char; d2: string; oper: char): real;
var v1, v2: LongInt;
begin
  v1 := ej15(s1, d1);
  v2 := ej15(s2, d2);
  result := ej16(v1, v2, oper);
end;

// 18. Numeros Romanos (1 a 1999)
function PracticoU1.ej18(n: integer): string;
const
  V: array[1..13] of integer = (1000,900,500,400,100,90,50,40,10,9,5,4,1);
  R: array[1..13] of string = ('M','CM','D','CD','C','XC','L','XL','X','IX','V','IV','I');
var i: integer; res: string;
begin
  res := '';
  for i := 1 to 13 do begin
    while n >= V[i] do begin res := res + R[i]; n := n - V[i]; end;
  end;
  result := res;
end;

// 19. Decimal fraccionario a Binario
function PracticoU1.ej19(f: real): string;
var res: string; c: integer;
begin
  res := '0.'; c := 0;
  while (f > 0) and (c < 10) do begin
    f := f * 2;
    if f >= 1 then begin res := res + '1'; f := f - 1; end
    else res := res + '0';
    c := c + 1;
  end;
  result := res;
end;

// 20. Decimal (12.125) a Octal
function PracticoU1.ej20(n: real): string;
var
  parteEntera, c: integer;
  parteFraccionaria: real;
  resEnt, resFrac: string;
begin
  parteEntera := trunc(n);
  parteFraccionaria := n - parteEntera; // Esto reemplaza a frac(n) para evitar errores
  resEnt := '';
  resFrac := '';

  if parteEntera = 0 then
    resEnt := '0';

  // Conversion de la parte entera
  while parteEntera > 0 do
  begin
    resEnt := IntToStr(parteEntera mod 8) + resEnt;
    parteEntera := parteEntera div 8;
  end;

  // Conversion de la parte fraccionaria
  c := 0;
  while (parteFraccionaria > 0) and (c < 8) do
  begin
    parteFraccionaria := parteFraccionaria * 8;
    resFrac := resFrac + IntToStr(trunc(parteFraccionaria));
    parteFraccionaria := parteFraccionaria - trunc(parteFraccionaria); // En lugar de frac()
    c := c + 1;
  end;

  if resFrac <> '' then
    result := resEnt + '.' + resFrac
  else
    result := resEnt;
end;

// 21. Dos mayores digitos
procedure PracticoU1.ej21(n: Int64; var m1, m2: integer);
var d: integer;
begin
  m1 := -1; m2 := -1;
  if n = 0 then m1 := 0;
  while n > 0 do begin
    d := n mod 10;
    if d > m1 then begin m2 := m1; m1 := d; end
    else if d > m2 then m2 := d;
    n := n div 10;
  end;
end;

// 22. Dos menores digitos
procedure PracticoU1.ej22(n: Int64; var min1, min2: integer);
var d: integer;
begin
  min1 := 10; min2 := 10;
  while n > 0 do begin
    d := n mod 10;
    if d < min1 then begin min2 := min1; min1 := d; end
    else if d < min2 then min2 := d;
    n := n div 10;
  end;
end;

// 23. Union de dos numeros
function PracticoU1.ej23(a, b: Int64): string;
begin
  result := IntToStr(a) + IntToStr(b);
end;

// 24. Mezcla de dos numeros
function PracticoU1.ej24(a, b: Int64): string;
var s1, s2, res: string; i: integer;
begin
  s1 := IntToStr(a); s2 := IntToStr(b); res := ''; i := 1;
  while (i <= length(s1)) or (i <= length(s2)) do begin
    if i <= length(s1) then res := res + s1[i];
    if i <= length(s2) then res := res + s2[i];
    i := i + 1;
  end;
  result := res;
end;

// PROGRAMA PRINCIPAL
var
  obj:PracticoU1;
  opcion,n,k,res,m,r1,r2:integer;
  c1, c2, c3, signoChar, signo1, signo2, opChar: char;
  cadena: string;
  num64a, num64b: Int64;
  cad1, cad2: string;
  valReal: real;

begin
  obj:=PracticoU1.Create;
  writeln('==============================');
  writeln('        MENU PRACTICO U1');
  writeln('==============================');
  writeln('1. Primeros k naturales');
  writeln('2. Primeros n naturales');
  writeln('3. Suma de los primeros n');
  writeln('4. Primeras n letras');
  writeln('5. Pares o impares');
writeln('6. Producto con suma');
writeln('7. Division con resta');
writeln('8. Producto con signo');
writeln('9. Division con signo');
writeln('10. Potencia');
writeln('11.');
writeln('12.');
writeln('13.');
writeln('14.');
writeln('15.');
writeln('16.');
writeln('17.');
writeln('18.');
writeln('19.');
writeln('20.');
writeln('21.');
writeln('22.');
writeln('23.');
writeln('24.');

  writeln('==============================');

  write('Elija una opcion: ');
  readln(opcion);

  case opcion of
    1: begin
         write('Digite k: ');
         readln(k);
         obj.ej1(k);
       end;

    2: begin
         write('Digite n: ');
         readln(n);
         obj.ej2(n);
       end;

    3: begin
         write('Digite n: ');
         readln(n);
         res:=obj.ej3(n);
         writeln('La suma es: ',res);
       end;

    4: begin
         write('Digite n: ');
         readln(n);
         obj.ej4(n);
       end;
    5: begin
     write('Digite n: ');
     readln(n);
     obj.ej5(n);
   end;

6: begin
     write('Digite n y m: ');
     readln(n);
     readln(m);
     writeln('Resultado: ', obj.ej6(n,m));
   end;

7: begin
     write('Digite n y m: ');
     readln(n,m);
     writeln('Cociente: ', obj.ej7(n,m));
     if m=0 then
begin
  writeln('Error: division por cero');
  readln();
   end;

end;

8: begin
     write('Digite n y m: ');
     readln(n,m);
     writeln('Resultado: ', obj.ej8(n,m));
   end;

9: begin
     write('Digite n y m: ');
     readln(n,m);
     writeln('Cociente: ', obj.ej9(n,m));
   end;

10: begin
      write('Digite base y exponente: ');
      readln(n,m);
      writeln('Resultado: ', obj.ej10(n,m));
    end;
  11: begin
    write('n y m: '); readln(n,m);
    writeln('Res: ', obj.ej11(n,m));
  end;
      12: begin
        write('n y base b: ');
        readln(n,m);
        writeln('Res: ', obj.ej12(n,m));
      end;
      13: begin
            write('3 digitos: ');
            readln(c1, c2, c3);
            writeln('Num: ', obj.ej13(c1, c2, c3));
          end;
      14: begin
            write('Signo y 3 digitos: ');
            readln(signoChar, c1, c2, c3);
            writeln('Num: ', obj.ej14(signoChar, c1, c2, c3));
          end;
      15: begin
            write('Signo (+/-): ');
            readln(signoChar);
            write('Digitos: ');
            readln(cadena);
            writeln('Num: ', obj.ej15(signoChar, cadena));
          end;

  16: begin
          write('N1, N2 y Oper (+-*/): ');
          readln(n, m);
          readln(opChar);
          writeln('Res: ', obj.ej16(n, m, opChar):0:2);
        end;
  17: begin
            write('Num1 (Signo y Digitos): ');
            readln(signo1, cad1);
            write('Num2 (Signo y Digitos): ');
            readln(signo2, cad2);
            write('Operador: ');
            readln(opChar);
            writeln('Res: ', obj.ej17(signo1, cad1, signo2, cad2, opChar):0:2);
          end;
18: begin write('N (1-1999): ');
  readln(n);
  writeln('Romano: ', obj.ej18(n));
end;
19: begin write('Fraccion (ej 0.551): ');
  readln(valReal); writeln('Binario: ', obj.ej19(valReal));
end;
20: begin write('Decimal (ej 12.125): ');
  readln(valReal);
  writeln('Octal: ', obj.ej20(valReal));
end;
21: begin
  write('Numero: ');
  r1 := 0;
  r2 := 0;
  readln(num64a);
  obj.ej21(num64a, r1, r2);
  writeln('Mayores: ', r1, ' y ', r2);
end;
    22: begin
      write('Numero: ');
      r1 := 10; r2 := 10;
      readln(num64a);
      obj.ej22(num64a, r1, r2);
      writeln('Menores: ', r1, ' y ', r2);
    end;
23: begin write('A y B: ');
  readln(num64a, num64b);
  writeln('C: ', obj.ej23(num64a, num64b));
end;
24: begin write('A y B: ');
  readln(num64a, num64b);
  writeln('C: ', obj.ej24(num64a, num64b));
    end;
end;
  obj.Free;
  readln;
end.

