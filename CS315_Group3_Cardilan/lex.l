%option main

DELETE_CALL	delete
PRINT_CALL	print
INPUT_CALL	input
FILE_INPUT_CALL	file_input
SET_INPUT_CALL	set_input
INSERT_CALL	insert
REMOVE_CALL	remove
UNION_CALL	union
INTERSECT_CALL	intersect
CARTESIAN_CALL	cartesian
DIFF_CALL	diff
SUBSET_CALL	subsetof
PROPERSUBSET_CALL	properSubsetof
SUPERSET_CALL	supersetof
CONTAINS_CALL	contains
ISEMPY_CALL	isempty
EQUALS_CALL	equals
FILE_OUT_CALL	file_output
CARDINALITY_CALL	cardinality

MAIN	main
ENDMAIN	endmain
IF	if
ELSEIF	elseif
ELSE	else
ENDIF	endif
WHILE	while
ENDWHILE	endwhile
DO	do
FOR	for
ENDFOR	endfor
FOREACH	foreach
FUNC	func
ENDFUNC	endfunc

UNDERSCORE	_
COMMA	,
SEMICOLON	;
COLON	:
LP	\(
RP	\)
LCURLY	\{
RCURLY	\}
PLUS	\+
MINUS	-
STAR	\*
SLASH	\/
PERCENT	%
DOUBLESLASH	\/\/
DOUBLESTAR	\*\*
DOT	\.
EQ	\=
LESS	<
GREATER	>
LEQ	<=
GEQ	>=
APOST	'
SYMBOL	\+|\-|_|,|;|:|\(|\)|\{|\}|\*|\/|%|\.|\=|<|>|'|@
GENERIC	G

DIGIT	[0-9]
SIGN	[+-]
ALPHA	[a-zA-z]
SPACE	[ \t]*
ALPHANUM	DIGIT|ALPHA

CHAR	ALPHANUM|SYMBOL
WORD	({ALPHA}|{DIGIT}|{SYMBOL})*
INT	{SIGN}?{DIGIT}+
FLOAT	{SIGN}?({DIGIT}*\.{DIGIT}+|{DIGIT}+\.{DIGIT}*)
VARID	{ALPHA}({ALPHA}|{DIGIT}|_)*
SETID	@{VARID}
TRUE	TRUE
FALSE	FALSE
INT_TYPE	int
FLOAT_TYPE	float
BOOL_TYPE	bool
CHAR_TYPE	char
STRING_TYPE	string
SET_TYPE	set
NOT	NOT
AND	AND
OR	OR
XOR	XOR
IFF	IFF
IMP	IMP
ASSIGNOP	<<

COMMENT {DOUBLESLASH}({WORD}|{SPACE})*
STRING	{APOST}({WORD}|{SPACE})*{APOST}

IMPORTS imports

%%
{IMPORTS}	printf("IMPORTS ");

{DELETE_CALL}	printf("DELETE_CALL ");
{PRINT_CALL}	printf("PRINT_CALL ");
{INPUT_CALL}	printf("INPUT_CALL ");
{FILE_INPUT_CALL}	printf("FILE_INPUT_CALL ");
{SET_INPUT_CALL}	printf("SET_INPUT_CALL ");
{INSERT_CALL}	printf("INSERT_CALL ");
{REMOVE_CALL}	printf("REMOVE_CALL ");
{UNION_CALL}	printf("UNION_CALL ");
{INTERSECT_CALL}	printf("INTERSECT_CALL ");
{CARTESIAN_CALL}	printf("CARTESIAN_CALL ");
{DIFF_CALL}	printf("DIFF_CALL ");
{SUBSET_CALL}	printf("SUBSET_CALL ");
{PROPERSUBSET_CALL}	printf("PROPERSUBSET_CALL ");
{SUPERSET_CALL}	printf("SUPERSET_CALL ");
{CONTAINS_CALL}	printf("CONTAINS_CALL ");
{ISEMPY_CALL}	printf("ISEMPY_CALL ");
{EQUALS_CALL}	printf("EQUALS_CALL ");
{FILE_OUT_CALL}	printf("FILE_OUT_CALL ");
{CARDINALITY_CALL}	printf("CARDINALITY_CALL ");

{MAIN}	printf("MAIN ");
{ENDMAIN}	printf("ENDMAIN ");
{IF}	printf("IF ");
{ELSEIF}	printf("ELSEIF ");
{ELSE}	printf("ELSE ");
{ENDIF}	printf("ENDIF ");
{WHILE}	printf("WHILE ");
{ENDWHILE}	printf("ENDWHILE ");
{DO}	printf("DO ");
{FOR}	printf("FOR ");
{ENDFOR}	printf("ENDFOR ");
{FOREACH}	printf("FOREACH ");
{FUNC}	printf("FUNC ");
{ENDFUNC}	printf("ENDFUNC ");

{GENERIC}	printf("GENERIC ");
{INT_TYPE}	printf("INT_TYPE ");
{FLOAT_TYPE}	printf("FLOAT_TYPE ");
{BOOL_TYPE}	printf("BOOL_TYPE ");
{CHAR_TYPE}	printf("CHAR_TYPE ");
{STRING_TYPE}	printf("STRING_TYPE ");
{SET_TYPE}	printf("SET_TYPE ");

{NOT}	printf("NOT ");
{AND}	printf("AND ");
{OR}	printf("OR ");
{XOR}	printf("XOR ");
{IFF}	printf("IFF ");
{IMP}	printf("IMP ");
{ASSIGNOP}	printf("ASSIGNOP ");

{UNDERSCORE}	printf("UNDERSCORE ");
{COMMA}	printf("COMMA ");
{DOT}	printf("DOT ");
{SEMICOLON}	printf("SEMICOLON ");
{COLON}	printf("COLON ");
{LP}	printf("LP ");
{RP}	printf("RP ");
{LCURLY}	printf("LCURLY ");
{RCURLY}	printf("RCURLY ");
{PLUS}	printf("PLUS ");
{MINUS}	printf("MINUS ");
{STAR}	printf("STAR ");
{SLASH}	printf("SLASH");
{PERCENT}	printf("PERCENT ");
{DOUBLESLASH}	printf("DOUBLESLASH ");
{DOUBLESTAR}	printf("DOUBLESTAR ");
{EQ}	printf("EQ ");
{LESS}	printf("LESS ");
{GREATER}	printf("GREATER ");
{LEQ}	printf("LEQ ");
{GEQ}	printf("GEQ ");
{APOST}	printf("APOST ");

{INT}	printf("INT ");
{FLOAT}	printf("FLOAT ");
{TRUE}	printf("TRUE ");
{FALSE}	printf("FALSE ");
{VARID}	printf("VARID ");
{SETID}	printf("SETID ");

{STRING}	printf("STRING ");
{COMMENT}	printf("COMMENT ");
{SPACE}	;



%%

