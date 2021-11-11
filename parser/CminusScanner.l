WS [\t]

%{
  #include "CminusScanner.h"

	#include <string>
	#include <variant>
  
  // Place any include directives here
%}

%option bison-bridge
%option prefix="Cminus_"

int    { return INTEGER; }
while	 { return WHILE; }
else	 { return ELSE; }
exit	 { return EXIT; }
if		 { return IF; }
read	 { return READ; }
write	 { return WRITE; }
return { return RETURN; }

\!     { return NOT; }
"||"	 { return OR; }
\&&		 { return AND; }
\<=		 { return LE; }
\<		 { return LT; }
\>=		 { return GE; }
\>		 { return GT; }
\==		 { return EQ; }
\!=		 { return NE; }
\=		 { return ASSIGN; }
\;		 { return SEMICOLON; }
\{		 { return LBRACE; }
"}"		 { return RBRACE; }
\[		 { return LBRACKET; }
\]		 { return RBRACKET; }
\(		 { return LPAREN; }
\)		 { return RPAREN; }
\+		 { return PLUS; }
\-     { return MINUS; }
\*		 { return TIMES; }
\/		 { return DIVIDE; }
","		 { return COMMA; }

\"[^\"]*\" {
	return STRING;
}

[a-zA-Z]([a-zA-Z]|[0-9])*	{
	return IDENTIFIER;
}

[0-9]+ {
	return INTCON;
}

{WS} { ; }

"\n" { Cminus_lineno++; }

.	{ fprintf(stderr, "Scanner: lexical error '%s'.\n", Cminus_text); }

%%