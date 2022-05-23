PROGRAM Goldbach_Vermutung;    (*W. Lauffher, 16.09.88*)
CONST max = 1000;
VAR i,j,t,o  : INTEGER;
    l        : ARRAY [1..max] OF BOOLEAN;
    gef,keks : BOOLEAN;

PROCEDURE Primzahl(a:integer;var t:boolean);
var b:integer;
BEGIN
t:=true;b:=1;
repeat
b:=b+1;
 if a mod b=0 then t:=false;
until (t=false) or(b >= a DIV 2)
end;

BEGIN
FOR t := 2 TO max DO BEGIN
  Primzahl(t,keks);
  IF keks = TRUE THEN l[t] := TRUE
                 ELSE l[t] := FALSE;
  END;
  l[2] := TRUE;
WRITE('Obergrenze :');READLN(o);
j := 2;
REPEAT
  j := j+2; i:= 2 ; gef := FALSE;
  REPEAT
    IF l[i] THEN IF l[j-i] THEN BEGIN
      WRITELN(i,'+',j-i,'=',j);
      gef := TRUE;
      END;
    i := i + 1;
  UNTIL (i >= j ) OR gef = TRUE;
  if gef = false then writeln('         m i s rt !');
UNTIL j >= o
END.