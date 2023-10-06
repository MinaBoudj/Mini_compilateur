%{
#include "fonctions.h"	
 int nb_ligne = 1;
 int erreur=1;
char sauvType[20];
char sauvOpr[20];
int sauveVal;
int sauvConst;
float sauvConstR;
char sauv[20];
char temp[20];
 int bibArith=0 ;
  int  bibOut =0;
 int bibArithdejadetecte =0;
 int biboutdejadetecte1=0;
 int biboutdejadetecte2 =0;
 int sauvtermine = 0;
 char val[20];
 char val1[20];
 extern out;
 int indice=0;

 matc matidf[200];
%}
%union {
int     entier;
char*   str;
float reel;
}

%token mc_import bib_io bib_lang pvg 
        aco_frm aco_ouv <str>idf mc_class mc_public mc_entier
		mc_private mc_protected mc_reel mc_chaine vrg <entier>cst cr_ouv cr_frm 
		<str>idf_tab mc_main par_ouv par_frm aff <str>plus <str>sur foix moins mc_for egal 
		inf sup supe infe def gem_o gem_f d f s mc_in mc_out  chaine cs  <reel>cst_float <str>cst_str

%%
S: LISTE_BIB HEADER_CLASS aco_ouv CORPS aco_frm{printf("syntaxe correcte !!");}

;

LISTE_BIB : BIB LISTE_BIB
          |
;		  
BIB: mc_import Nom_BIB pvg    
;	
Nom_BIB:bib_io {bibOut=1}
       |bib_lang {bibArith =1}
;
HEADER_CLASS: MODIFICATEUR mc_class idf 
;

MODIFICATEUR: mc_public
            |mc_private
			|mc_protected
;

CORPS: Partie_DEC Partie_INS
;

Partie_DEC: Partie_DEC_VAR Partie_DEC
           |Partie_DEC_TAB Partie_DEC
		   |PART Partie_DEC
		   |
;	
Partie_INS : mc_main par_ouv par_frm aco_ouv corps_genera aco_frm
;
corps_genera: corps  
;
corps : corps_ins corps  
       | boucle corps
	   | lecture corps 
	   | Ecriture corps
	   |
;
boucle: mc_for par_ouv idf aff cst  pvg idf op1 cst  pvg  idf op2 par_frm aco_ouv corps aco_frm 
;
corps_ins : idf_gauche aff constr pvg 
                    
{if( bibArith==0 && bibArithdejadetecte ==0) {printf("Manque du bibliotheque arithmitique \n") ;bibArithdejadetecte=1;}
if(recherche(sauv) == -1){ 	 
printf("\n==> Erreur semantique: variable '%s' non declaree\n- ligne: %d\n",sauv, nb_ligne);
										}} 
;
op: foix 
   | plus {strcpy(sauvOpr,$1);} 
   | moins
   |sur { strcpy(sauvOpr,$1);
				//  printf("opr=%s\n",sauvOpr);
		           }  
;
op1: inf
    | sup
	| infe
	| supe
	| def
;
op2: plus plus
;
constr : idf_gauche op constr { if((strcmp(sauvOpr,"/")==0)&&(sauvConst==0))
                             printf("division sur zero a la ligne %d\n", nb_ligne); 
						 
							}
        |  cst  {     
					sauvConst=$1;
		            //printf("const=%d\n",sauvConst);
					 //sauveVal= sauvConst;
					 sprintf(temp,"%d",$1); 
					// printf("valeur =%s\n",temp);
					strcpy(val,temp);
					  if(constValeur(sauv) == 0)
					{   // printf("valeursa =%s\n",val);
		                //printf("sauv =%s\n",sauv);
		        
						insererconstante(sauv,val);
						
                    }
					inserervaltype(sauv,"entier");
				if(comparerTypeConst(val1,"Entier")== -1)
					{ 
					//printf("TYPE a la ligne %s\n", val1); 
				    printf("TYPE NON VALIDE a la ligne %d ! \n", nb_ligne); 
                       					
					} 	
					 
		          } 
		| cst_float  
		          {	 
				  sprintf(temp,"%f",$1); 
					 //printf("valeur =%s\n",temp);
					 strcpy(val,temp);
					// printf("valeur =%s\n",val);
					  
					  if(constValeur(sauv) == 0)
					{   // printf("valeursa =%s\n",val);
		               // printf("sauv =%s\n",sauv);
		        
					 
                    }
                     inserervaltype(sauv,"Reel");
   if(comparerTypeConst(val1,"Reel")== -1)
					{ 
					//printf("TYPE a la ligne %s\n", val1); 
				    printf("TYPE NON VALIDE  a la ligne %d ! \n", nb_ligne); 
                       					
					} 
		          }
		| cst_str    {
						 strcpy(temp,$1);
						 // printf("valeur =%s\n",temp);
						 strcpy(val,temp);
					  if(constValeur(sauv) == 0)
					{   // printf("valeursa =%s\n",val);
		               // printf("sauv =%s\n",sauv);
		        
						insererconstante(sauv,val);
                    }
					if(comparerTypeConst(val1,"Chaine")== -1)
					{ 
					//printf("TYPE a la ligne %s\n", val1); 
				    printf("TYPE NON VALIDE  a la ligne %d ! \n", nb_ligne); 
                       					
					} 
					
		                   }
         | idf    	 {
			if(comparerType(sauv,$1)== -1)
					{
				    printf("TYPE NON VALIDE a la ligne %d ! \n", nb_ligne);  
					}
		     if(DoubleDeclaration($1)==0)
printf("erreur semantique:variable  non declaree   a la ligne %d\n",nb_ligne);
       		
						 strcpy(temp,$1);
						 // printf("valeur =%s\n",temp);
						 strcpy(val,temp);
					  if(constValeur(sauv) == 0)
					{   // printf("valeursa =%s\n",val);
		               // printf("sauv =%s\n",sauv);
		        
						insererconstante(sauv,val);
							 
                    }
					insererconstante(sauv,val);
		                   }
         | idf_tab cr_ouv cst cr_frm 
		           {  
				   if(comparerType(sauv,$1)== -1)
					{
				    printf("TYPE NON VALIDE a la ligne %d ! \n", nb_ligne);  
					}
				   {if(DoubleDeclaration($1)==0)
printf("erreur semantique: tableaux  non declaree   a la ligne %d\n",nb_ligne);}
  
				   strcpy(temp,$1);
						 // printf("valeur =%s\n",temp);
						 strcpy(val,temp);
					  if(constValeur(sauv) == 0)
					{   // printf("valeursa =%s\n",val);
		               // printf("sauv =%s\n",sauv);
		        
						insererconstante(sauv,val);
                    }
					insererconstante(sauv,val);
		                   }						   
;
Partie_DEC_TAB: TYPE LISTE_IDF_TAB pvg
;
LISTE_IDF_TAB: idf_tab cr_ouv cst cr_frm vrg LISTE_IDF_TAB { 
if($3<=0) printf("erreur semantique: un tableau ne pas pas etre de taille negative ou nulle a la ligne %d\n", nb_ligne);
// printf("doubledecl=%d\n",DoubleDeclaration($1));
                                 if(DoubleDeclaration($1)==0)
                                   insererType($1,sauvType);
								   
                               else
                            printf("erreur semantique: double declaration du tableau  a la ligne %d\n",nb_ligne);
                           	 inserer_val($1,sauvType);						
							}

             | idf_tab cr_ouv cst cr_frm { 
if($3<=0) printf("erreur semantique: un tableau ne pas pas etre de taille negative ou nulle a la ligne %d\n", nb_ligne);
// printf("doubledecl=%d\n",DoubleDeclaration($1));
                                 if(DoubleDeclaration($1)==0)
                                   insererType($1,sauvType);
                               else
                            printf("erreur semantique: double declaration du tableau  a la ligne %d\n",nb_ligne);
                            	inserer_val($1,sauvType);						
							}
;			   
Partie_DEC_VAR: TYPE LISTE_IDF pvg
;
PART : cs TYPE Partie_DEC_CST pvg
;
Partie_DEC_CST:  idf_gauche_cst VALEUR vrg Partie_DEC_CST 
                |  idf_gauche_cst VALEUR 
                | idf_gauche_cst {insererconstante(sauv," "); }		
;
VALEUR: aff  constr  {insererconstante(sauv,temp); 
                  	
 					 }
;
 TYPE:mc_entier {strcpy(sauvType,"Entier");}
    |mc_reel   {strcpy(sauvType,"Reel");}
	|mc_chaine {strcpy(sauvType,"Chaine");}
;	
LISTE_IDF: idf vrg LISTE_IDF {// printf("doubledecl=%d\n",DoubleDeclaration($1));
                               //  strcpy(sauv,$1);
							  //  strcpy(val1,$1);
							    if(out != 1)
                                 { if(DoubleDeclaration($1)==0)
								      { insererType($1,sauvType);  }
                                   else
                                     printf("erreur semantique: double declaration Du variable a la ligne %d\n",nb_ligne);
                                     inserer_val($1,sauvType);
					            }
								else 
								  { strcpy(matidf[indice].ch ,$1);
								    indice = indice+1;
									}
							}
          |idf { //printf("doubledecl=%d\n",DoubleDeclaration($1));
		           // strcpy(sauv,$1);
				  if(out != 1)           
		          {    if(DoubleDeclaration($1)==0)
					       { insererType($1,sauvType);}
                        else
                            printf("erreur semantique: double declaration Du variable a la ligne %d\n",nb_ligne);
						    inserer_val($1,sauvType);	    
							}
				 else 
								  { strcpy(matidf[indice].ch ,$1);
								    indice = indice+1;
									}
					}
;	
  
idf_gauche :idf   {    strcpy(val1,$1);
                 if(DoubleDeclaration($1)==0)   printf("erreur semantique:variable  non declaree   a la ligne %d\n",nb_ligne);
  
                 if(constValeur($1)==1)
                    printf("erreur semantique a la ligne %d : la constante %s ,a deja une valeur\n ",nb_ligne,$1);
	              // printf("doubledecl=%d\n",DoubleDeclaration($1));
                               //  strcpy(sauv,$1);
							      strcpy(sauv,$1);
                                   								  
					/* if(DoubleDeclaration($1)==0)
                                   insererType($1,sauvType);*/
						inserer_val($1,sauvType);
                           							 
				  }
      | idf_tab cr_ouv cst cr_frm 
	  {      strcpy(val1,$1);                   
	   if(DoubleDeclaration($1)==0)
                                    printf("erreur semantique:tableaux  non declaree   a la ligne %d\n",nb_ligne);
  			
	  if(constValeur($1)==1)
                 printf("erreur semantique a la ligne %d : la constante tableaux %s ,a deja une valeur\n ",nb_ligne,$1);
	                     strcpy(sauv,$1); 
						 /* if(DoubleDeclaration($1)==0)
                                   insererType($1,sauvType);*/
				if(recherche(sauv) == -1){ 	 
printf("\n==> Erreur semantique: tableaux '%s' non declaree ligne: %d\n",sauv, nb_ligne);
										}
					inserer_val($1,sauvType);	
				  }
		| idf_tab cr_ouv cst_float cr_frm 
	  {  if(DoubleDeclaration($1)==0)
                                    printf("erreur semantique:tableaux  non declaree   a la ligne %d\n",nb_ligne);
                          
	   {printf("==> Erreur semantique: l'index du tableau doit être un entier : %d dans la ligne \n", nb_ligne);}
						
	  if(constValeur($1)==1)
                 printf("erreur semantique a la ligne %d : la constante tableaux %s ,a deja une valeur\n ",nb_ligne,$1);
	                     strcpy(sauv,$1); 
						 /* if(DoubleDeclaration($1)==0)
                                   insererType($1,sauvType);*/
				if(recherche(sauv) == -1){ 	 
printf("\n==> Erreur semantique: tableaux '%s' non declaree\n- ligne: %d\n",sauv, nb_ligne);
										}
					inserer_val($1,sauvType);						
				  }
				 
;
idf_gauche_cst:idf   {  

if(constValeur($1)==1)
                 printf("erreur semantique a la ligne %d : la constante %s ,a deja une valeur\n ",nb_ligne,$1);
	              // printf("doubledecl=%d\n",DoubleDeclaration($1));
                               //  strcpy(sauv,$1);
							      strcpy(sauv,$1);
                                 // strcpy(val1,sauv);								  
					 if(DoubleDeclaration($1)==0)
                                   insererType($1,sauvType);
								   
                           							 
				  }
      | idf_tab cr_ouv cst cr_frm 
	  {                         
	if($3<=0)
	printf("==> Erreur semantique: l'index du tableau doit être strictement positif:dans la  ligne  %d \n", nb_ligne);
						
	  if(constValeur($1)==1)
                 printf("erreur semantique a la ligne %d : la constante tableaux %s ,a deja une valeur\n ",nb_ligne,$1);
	                     strcpy(sauv,$1); 
						  if(DoubleDeclaration($1)==0)
                                   insererType($1,sauvType);
				if(recherche(sauv) == -1){ 	 
printf("\n==> Erreur semantique: tableaux '%s' non declaree ligne: %d\n",sauv, nb_ligne);
										}
										
				  }
		| idf_tab cr_ouv cst_float cr_frm 
	  {                   
	   {printf("==> Erreur semantique: l'index du tableau doit être un entier : %d dans la ligne \n", nb_ligne);}
						
	  if(constValeur($1)==1)
                 printf("erreur semantique a la ligne %d : la constante tableaux %s ,a deja une valeur\n ",nb_ligne,$1);
	                     strcpy(sauv,$1); 
						  if(DoubleDeclaration($1)==0)
                                   insererType($1,sauvType);
				if(recherche(sauv) == -1){ 	 
printf("\n==> Erreur semantique: tableaux '%s' non declaree\n- ligne: %d\n",sauv, nb_ligne);
										}
										
				  }
				 
;
lecture: mc_in par_ouv chaine vrg LISTE_IDF par_frm pvg 
                                                 {if( bibOut==0 && biboutdejadetecte1 ==0) 
												     {printf("Manque du bibliotheque des lectures \n") ;
													 biboutdejadetecte1=1;}
													formatage($3, matidf, nb_ligne);
	                                	             out=0;
		                                            indice=0;
		                                            effacerContenu(matidf); 
													
													 }
;
Ecriture : mc_out par_ouv  chaine vrg LISTE_IDF par_frm pvg
                                     {if( bibOut==0 && biboutdejadetecte2 ==0) 
	                                           { printf("Manque du bibliotheque des ecritures \n") ;
		                                         biboutdejadetecte2=1;
		                                           }
	                                	formatage($3, matidf, nb_ligne);
	                                	out=0;
		                                indice=0;
		                                effacerContenu(matidf);
		
		
		                                }
;
%%
main()
{yyparse();
 afficher();
 
 }
yywrap() {}

yyerror(char * msg)
{
	printf("erreur syntaxicement a la ligne %d" ,nb_ligne);
}	
