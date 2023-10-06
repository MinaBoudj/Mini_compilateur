%{
#include "synt.tab.h"
extern nb_ligne;
int out;
extern YYSTYPE yylval;

%}
lettres [a-zA-Z]
chiffres [0-9] 
constante {chiffres}+ 
idf "$"{lettres}({lettres}|{chiffres}|_)*
idf_Tab "@"{lettres}({lettres}|{chiffres}|_)*
chain  \"[^"]*\"
const_real  [0-9]+\.[0-9]*|\.[0-9]+
const_str   [a-zA-Z_][0-9a-zA-Z_]*
%%
import {return mc_import;}
ISIL.io return bib_io;
ISIL.lang return bib_lang;
public return mc_public;
private return mc_private;
protected return mc_protected;
class return mc_class;
Entier return mc_entier;
Reel return mc_reel;
Chaine return mc_chaine;
main return mc_main;
For return mc_for;
In { out =1; return mc_in;}
Out { out =1; 
         return mc_out;}
CONST return cs;
              
{idf}  {if (yyleng<=20) {yylval.str=strdup(yytext);
                         inserer(yytext,"idf");
 						 return idf;}
          else printf("erreur lexicale : idf trop long a la ligne %d sur %s\n",nb_ligne, yytext);
		 } 
          
{idf_Tab} {  yylval.str=strdup(yytext);
                         inserer(yytext,"idf_Tab"); return idf_tab;
          }
{constante} {  yylval.entier=atoi(yytext);
              return cst;
			 }
{const_real}  {yylval.reel = atof(yytext);
                return cst_float; 
              }
{const_str}  {
	            yylval.str = strdup(yytext); 
				return cst_str;
              } 	
{chain} {   
            yylval.str = strdup(yytext);
            return chaine;
			}
"[" return cr_ouv;
"]" return cr_frm;
"," return vrg;
"{" return aco_ouv;
"}" return aco_frm;
"(" return par_ouv;
")" return par_frm;
":=" return aff;
"+" {yylval.str=strdup(yytext);
         return plus;
		 }
"/" {yylval.str=strdup(yytext);
             return sur;
			  } ;
"*" return foix;
"-" return moins;
"=" return egal; 
"<" return inf; 
">" return sup;
"<=" return infe;
">=" return supe;
"!=" return def;

 "##"[^#]*"##"
; return pvg;
[ \t]
\n nb_ligne++;
. printf("erreur lexicale a la ligne %d avec l'entite %s\n",nb_ligne,yytext);

