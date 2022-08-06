Program TateticonlosPi;

Const 
  tope = 3;

Type 
  fila = array [1..tope] Of integer;
  tablero = array [1..tope] Of fila;

Procedure seleccion(var t:tablero; f:integer; c:integer; s:integer);
//READY
Begin
  writeln('pos: ',f,' ',c);
  t[f][c] := s;
  writeln('casilla ',f,',',c,': ',t[f][c]);
End;

Function comprobarC(t:tablero): integer;
//READY

Var 
  i, j, p1, p2, tot: integer;
Begin
  p1 := 0;
  p2 := 0;
  tot := 0;
  For i:= 1 To tope Do
    Begin
      For j:= 1 To tope Do
        Begin
          If (t[i][j] = 1) Then
            p1 := p1 + 1
          Else if (t[i][j]=2) then
            p2 := p2 + 1;
        End;
      If (p1 = tope) Then
        tot := 1;
      If (p2 = tope) Then
        tot := 2;
      p1 := 0;
      p2 := 0;
    End;
  writeln('comprobarC: ',tot);
  comprobarC:=tot;
End;

Function comprobarF(t:tablero): integer;
//READY

Var 
  i, j, p1, p2, tot: integer;
Begin
  p1 := 0;
  p2 := 0;
  tot := 0;
  For i:= 1 To tope Do
    Begin
      For j:= 1 To tope Do
        Begin
          If (t[j][i] = 1) Then
            p1 := p1 + 1
          Else If (t[j][i] = 2) Then
                 p2 := p2 + 1;
        End;
      If (p1 = tope) Then
        tot := 1;
      If (p2 = tope) Then
        tot := 2;
      p1 := 0;
      p2 := 0;
    End;
  writeln('comprobarF: ',tot);
  comprobarF:=tot;
End;

Function comprobarD(t:tablero): integer;//READY
Var 
  i, p1, p2, tot: integer;
Begin
  p1 := 0;
  p2 := 0;
  tot := 0;
  For i:=1 To tope Do
    Begin
      If (t[i][i] = 1) Then
        p1 := p1 + 1
      Else If (t[i][i] = 2) Then
        p2 := p2 + 1;
    End;
  If (p1 = tope) Then
    tot := 1;
  If (p2 = tope) Then
    tot := 2;
  p1 := 0;
  p2 := 0;

  For i:=tope Downto 1 Do
    Begin
      If (t[i][i]=1) Then
        p1 := p1 + 1
      Else If (t[i][i]=2) Then
             p2 := p2 + 1;
    End;
  If (p1 = tope) Then
    tot:= 1;
  if (p2 = tope) Then
    tot := 2;

writeln('CompD: ',tot);
comprobarD:=tot;
End;

Procedure preguntarFilaYColumna (t:tablero;Var f:integer; Var c:integer);//READy
var
  no:boolean;
Begin
  no:=True;
  While (no=True) do begin
    Write('Introduzca la fila: ');
    readln(f);
    Write('Introduzca la columna: ');
    readln(c);
    if ((t[f][c]<>0) or (f > tope) or (c>tope)) then
      no:=True
    else
      no:=False;
  end;
End;

Procedure inicializar (Var t:tablero);//READY
Var 
  j,i: integer;
Begin
  For i:=1 To tope Do
    For j:=1 To tope Do
      t[j][i] := 0;
End;

Procedure mostrar (t:tablero);
//READY

Var 
  j,i: integer;
Begin
  For i:=1 To tope Do begin
    For j:=1 To tope Do
      write(i,',',j,'  ');
    writeln(' ');
  end;
  For i:=1 To tope Do begin
    For j:=1 To tope Do
      write(t[i][j],'  ');
    writeln(' ');
  end;
End;

Function gana(t:tablero): integer;
//READY
Var 
  rta: integer;
Begin
  rta := comprobarC(t);
  If rta=0 Then begin
    rta := comprobarD(t);
    If rta=0 Then
      rta := comprobarF(t);
  end;

  if rta<>0 then
    gana:=rta
  else
    gana:=0;
End;

{PP}
//READY
Var 
  turno,f,c,ganador: integer;
  table: tablero;
Begin
  turno := 1;
  ganador := 0;
  f := 0;
  c := 0;
  inicializar(table);
  mostrar(table);
  While (turno<=9) And (ganador=0) Do
    Begin
      preguntarFilaYColumna(table,f,c);
      If (turno Mod 2 = 0) Then begin
        writeln('Turno del jugador 1');
        seleccion(table,f,c,1);
      end
      Else begin
        writeln('Turno del jugador 2');
        seleccion(table,f,c,2);
      end;
      mostrar(table);
      ganador := gana(table);
      turno := turno+1;
    End;
  writeln('El ganador es el jugador ', ganador);
End.

{ TATETI by: Luciano onaicul#2054, Francisco .【𝓚𝓮𝓵𝓲𝓼𝓮𝓲】#6143, CHARLY felipemass#2262 , Martin　Munetta#8976, Tomas Tomeik125#2552 }
