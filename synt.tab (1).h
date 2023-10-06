
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     mc_import = 258,
     bib_io = 259,
     bib_lang = 260,
     pvg = 261,
     aco_frm = 262,
     aco_ouv = 263,
     idf = 264,
     mc_class = 265,
     mc_public = 266,
     mc_entier = 267,
     mc_private = 268,
     mc_protected = 269,
     mc_reel = 270,
     mc_chaine = 271,
     vrg = 272,
     cst = 273,
     cr_ouv = 274,
     cr_frm = 275,
     idf_tab = 276,
     mc_main = 277,
     par_ouv = 278,
     par_frm = 279,
     aff = 280,
     plus = 281,
     sur = 282,
     foix = 283,
     moins = 284,
     mc_for = 285,
     egal = 286,
     inf = 287,
     sup = 288,
     supe = 289,
     infe = 290,
     def = 291,
     gem_o = 292,
     gem_f = 293,
     d = 294,
     f = 295,
     s = 296,
     mc_in = 297,
     mc_out = 298,
     chaine = 299,
     cs = 300,
     cst_float = 301,
     cst_str = 302
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 25 "synt.y"

int     entier;
char*   str;
float reel;



/* Line 1676 of yacc.c  */
#line 107 "synt.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


