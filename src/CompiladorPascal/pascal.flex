package pascal;
import java.util.ArrayList;
import java_cup.runtime.*;

%%
%class Lexer
%line
%column
%cup

%{
    public ArrayList<Token> ts = new ArrayList<Token>();
    public String errlex = "";
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
%}

//alfabetos
letra = [a-z]
letra2 = [A-Z]
numero = [1-9]
espacio = [\n\t\r ]
signos = [":","-","_","+","/"]

num = {numero} ({numero} | "0")*
id = {letra} ({letra} | {letra2} | {numero} | "0" | "_")*
texto = "'"({letra} | {letra2} | {numero} | "0" | " " | {signos})*"'"

%%

"program" {ts.add(new Token("Programa",yytext()));return symbol(sym.program);}
";" {ts.add(new Token("Fin",yytext()));return symbol(sym.fin);}
"uses" {ts.add(new Token("Usar",yytext()));return symbol(sym.uses);}
"crt" {ts.add(new Token("Libreria",yytext()));return symbol(sym.crt);}
"var" {ts.add(new Token("Variable: ",yytext()));return symbol(sym.var);}
"," {ts.add(new Token("Coma: ",yytext()));return symbol(sym.coma);}
":" {ts.add(new Token("Tipo: ",yytext()));return symbol(sym.tipo);}
"integer" {ts.add(new Token("Integer: ",yytext()));return symbol(sym.inte);}
"char" {ts.add(new Token("Char: ",yytext()));return symbol(sym.chare);}
"begin" {ts.add(new Token("Empiezo: ",yytext()));return symbol(sym.begin);}
"clrscr" {ts.add(new Token("Limpiar: ",yytext()));return symbol(sym.clrscr);}
"write" {ts.add(new Token("Escribir: ",yytext()));return symbol(sym.write);}
"writeln" {ts.add(new Token("Escribir Sobre: ",yytext()));return symbol(sym.writeln);}
"(" {ts.add(new Token("Parentesis Iz: ",yytext()));return symbol(sym.pi);}
")" {ts.add(new Token("Parentesis De: ",yytext()));return symbol(sym.pd);}
"readln" {ts.add(new Token("Leer: ",yytext()));return symbol(sym.readln);}
":=" {ts.add(new Token("Igualdad: ",yytext()));return symbol(sym.igualdad);}
"if" {ts.add(new Token("Si: ",yytext()));return symbol(sym.ifF);}
"then" {ts.add(new Token("Entonces: ",yytext()));return symbol(sym.then);}
"else" {ts.add(new Token("Sino: ",yytext()));return symbol(sym.elseF);}
"readkey" {ts.add(new Token("Leer tecla: ",yytext()));return symbol(sym.readkey);}
"end" {ts.add(new Token("Fin: ",yytext()));return symbol(sym.end);}
"." {ts.add(new Token("Fin . : ",yytext()));return symbol(sym.punto);}
">" {ts.add(new Token("Mayor Que: ",yytext()));return symbol(sym.mayorQ);}
"<" {ts.add(new Token("Menor Que : ",yytext()));return symbol(sym.menorQ);}
">=" {ts.add(new Token("Mayor o Igual : ",yytext()));return symbol(sym.mayorOI);}
"<=" {ts.add(new Token("Menor o Igual",yytext()));return symbol(sym.menorOI);}
"=" {ts.add(new Token("Igual: ",yytext()));return symbol(sym.igual);}

{id} {ts.add(new Token("Identificador: ",yytext()));return symbol(sym.id);}
{texto} {ts.add(new Token("Texto: ",yytext()));return symbol(sym.texto);}
{num} {ts.add(new Token("Numero: ",yytext()));return symbol(sym.num);}
{espacio} {}
. {errlex+=("\nError: Invalid symbol. Line " + (yyline+1) + " Column " + (yycolumn+1));}

