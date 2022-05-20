
%token IMPORTS
%token FNAME
%token MAIN ENDMAIN
%token STRING COMMENT
%token TRUE FALSE
%token RETURN
%token GET
%token IF ELSEIF ELSE ENDIF
%token DOT COMMA COLON SEMICOLON
%token LP RP LCURLY RCURLY LESS GREATER
%token LEQ EQ GEQ
%token AND OR XOR IFF IMP NOT
%token FUNC ENDFUNC
%token INT_TYPE FLOAT_TYPE BOOL_TYPE CHAR_TYPE STRING_TYPE GENERIC SET_TYPE
%token WHILE ENDWHILE DO
%token FOR ENDFOR
%token PLUS MINUS STAR DOUBLESTAR SLASH PERCENT ASSIGNOP
%token VARID SETID
%token DELETE_CALL PRINT_CALL INPUT_CALL FILE_INPUT_CALL FILE_OUTPUT_CALL SET_INPUT_CALL 
%token INSERT_CALL REMOVE_CALL UNION_CALL INTERSECT_CALL CARTESIAN_CALL DIFF_CALL 
%token SUBSETOF_CALL PROPERSUBSETOF_CALL SUPERSETOF_CALL CONTAINS_CALL ISEMPTY_CALL EQUALS_CALL 
%token CARDINALITY_CALL 
%token FOREACH IN 
%token INT FLOAT
%%
program: imports stmts | imports stmts main
;
main: MAIN stmts ENDMAIN
;
imports: empty 
	| IMPORTS LCURLY empty RCURLY 
	| IMPORTS LCURLY import_list RCURLY
;
import_list: STRING | import_list COMMA STRING
;
stmts: empty | stmts stmt
;
stmt: expr_stmt
	| set_expr_stmt;
	| if_stmt
	| decl_stmt
	| ret_stmt
	| comment_stmt
	| loop_stmt
	| assign_stmt
;

set_expr_stmt: set_expr SEMICOLON
;
if_stmt: IF expr COLON stmts elseif_list ENDIF
	| IF expr COLON stmts elseif_list ELSE COLON stmts ENDIF
;
elseif_list: empty 
	| elseif_list ELSEIF expr COLON stmts
;
decl_stmt: var_decl | set_decl | func_decl
;
var_decl: var_type var_decl_list SEMICOLON
;
var_decl_list: var_decl_list_elem
	| var_decl_list COMMA var_decl_list_elem
;
var_decl_list_elem: var_id | var_id assign_op expr
;
set_decl: set_type LESS var_type GREATER set_decl_list SEMICOLON
;
set_decl_list: set_decl_list_elem
	| set_decl_list COMMA set_decl_list_elem
;
set_decl_list_elem: set_id | set_id assign_op expr | set_id assign_op set_expr
;
func_decl: FUNC var_id LP params RP COLON stmts ENDFUNC
	| FUNC func_ret var_id LP params RP COLON stmts ENDFUNC
;
func_ret: var_type | SET_TYPE LESS var_type GREATER
;
params: empty | param_list
;
param_list: param_list_elem | param_list COMMA param_list_elem
;
param_list_elem: var_type var_id | set_type LESS var_type GREATER set_id
;


ret_stmt: RETURN expr SEMICOLON | RETURN set_expr SEMICOLON
;



loop_stmt: while_loop | dowhile_loop | for_loop
;
while_loop: WHILE expr COLON stmts ENDWHILE
;
dowhile_loop: DO COLON stmts WHILE expr SEMICOLON
;
for_loop: FOR expr COMMA assignments COLON stmts ENDFOR
;

func_call: var_id LP RP
	| var_id LP expr_list RP
	| prim_func_call
;

expr_list: expr | set_expr | expr_list COMMA expr | expr_list COMMA set_expr
;


expr_stmt: expr SEMICOLON
;
assign_stmt: assignments SEMICOLON
;
assignment: var_id assign_op expr
	| set_id assign_op expr
	| set_id assign_op set_expr
;
assignments: assignment
	| var_id COMMA assignments COMMA expr
	| set_id COMMA assignments COMMA expr
;


expr: arith_expr | logic_expr | var_id | func_call | string
;
general_term: var_id | func_call
;
arith_expr: arith_term_1
	| arith_expr additive_op arith_term_1
	| arith_expr additive_op general_term
	| general_term additive_op general_term
	| general_term additive_op arith_term_1
;
arith_term_1: arith_term_2
	| arith_term_1 multiplicative_op arith_term_2
	| arith_term_1 multiplicative_op general_term
	| general_term multiplicative_op general_term
	| general_term multiplicative_op arith_term_2
;
arith_term_2: arith_term_3
	| arith_term_2 exp_op arith_term_3
	| arith_term_2 exp_op general_term
	| general_term exp_op general_term
	| general_term exp_op arith_term_3
;
arith_term_3: LP arith_expr RP 
	| numeric 
	| set_expr DOT CARDINALITY_CALL LP RP 
;
logic_expr: logic_term_1
	| logic_expr binary_logic_op logic_term_1
	| logic_expr binary_logic_op general_term
	| general_term binary_logic_op general_term
	| general_term binary_logic_op logic_term_1
;
logic_term_1: logic_term_2
	| unary_logic_op logic_term_2
	| unary_logic_op general_term
;
logic_term_2: LP logic_expr RP
	| boolean
	| set_expr DOT SUBSETOF_CALL LP set_expr RP
	| set_expr DOT PROPERSUBSETOF_CALL LP set_expr RP
	| set_expr DOT SUPERSETOF_CALL LP set_expr RP
	| set_expr DOT CONTAINS_CALL LP expr RP
	| set_expr DOT ISEMPTY_CALL LP RP
	| relational_expr
;
arith_eval: arith_expr | general_term
;
relational_expr: arith_eval relational_op arith_eval
;

prim_func_call: delete_call
	| print_call
	| input_call
	| file_input_call
	| file_output_call
;
delete_call: DELETE_CALL LP set_id RP
;
print_call: PRINT_CALL LP expr RP 
	|  PRINT_CALL LP set_expr RP 
;
input_call: INPUT_CALL LP RP
;
file_input_call: FILE_INPUT_CALL LP string RP
	| FILE_INPUT_CALL LP var_id RP
;
file_output_call: FILE_OUTPUT_CALL LP expr COMMA expr RP
	| FILE_OUTPUT_CALL LP set_expr COMMA expr RP
;

set_expr: set_expr DOT set_func_call
	| set_expr powerset_op numeric
	| prim_set_decl
	| foreach_set_decl
	| LP set_expr RP
	| SET_INPUT_CALL LP RP
	| set_id
;
set_func_call: INSERT_CALL LP expr RP
	| REMOVE_CALL LP expr RP
	| UNION_CALL LP set_expr RP
	| INTERSECT_CALL LP set_expr RP
	| CARTESIAN_CALL LP set_expr RP
	| DIFF_CALL LP set_expr RP
;
prim_set_decl: LCURLY empty RCURLY
	| LCURLY element_list RCURLY
;

element_list: element | element_list COMMA element
;
element: expr
;
foreach_set_decl: GET expr FOREACH LP foreach_list RP
;
foreach_list: foreach_list_elem | foreach_list COMMA foreach_list_elem
;
foreach_list_elem: var_id IN set_id
;



var_type: INT_TYPE | FLOAT_TYPE | BOOL_TYPE | CHAR_TYPE | STRING_TYPE | GENERIC
;
set_type: SET_TYPE
numeric: INT | FLOAT
;
string: STRING
;
comment_stmt: COMMENT
;
boolean: TRUE | FALSE
;
assign_op: ASSIGNOP
;
relational_op: LESS | LEQ | EQ | GEQ | GREATER
;
binary_logic_op: AND | OR | XOR | IFF | IMP
;
unary_logic_op: NOT
;
additive_op: PLUS | MINUS
;
multiplicative_op: STAR | SLASH | PERCENT
;
exp_op: DOUBLESTAR
;
powerset_op: DOUBLESTAR
;
var_id: VARID
;
set_id: SETID
;
empty:
;
%%
#include "lex.yy.c"
void yyerror(const char *str) {
	fprintf(stderr,"Error | Line: %d\n%s\n",yylineno,str);
}
main() {
	return yyparse();
}