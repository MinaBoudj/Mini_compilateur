
//1- definir la strucuture de la table

	typedef struct
	{
	char NomEntite[20];
	char CodeEntite[20];
	char TypeEntite[20];
	char constante[20];
	char  valeur [20]; 
	} TypeTS;
//2-declarer la table
    TypeTS ts[100]; 
//3-initialiser le compteur de la table
	int CpTabSym=0;
	typedef struct
	{
	char NomEntite[20];
	char TypeEntite[20];
	char  Typevaleur[20]; 
	} Type;
//2-declarer la table
    Type tp[100];
//3-initialiser le compteur de la table
	int Ct=0;
//4-programmer la fonction recherche dans la table

	 int recherche(char entite[])
	{
	int i=0;
	while(i<CpTabSym)
	{
	if (strcmp(entite,ts[i].NomEntite)==0) return i;
	i++;
	}

	return -1;
	}
//5- programmer la fonction inserer
	
	void inserer(char entite[], char code[])
	{

	if ( recherche(entite)==-1)
	{
	strcpy(ts[CpTabSym].NomEntite,entite); 
	strcpy(ts[CpTabSym].CodeEntite,code);
	strcpy(ts[CpTabSym].constante,"Non");
	strcpy(ts[CpTabSym].valeur,"");
	
	CpTabSym++;
	}
	}
//6-programmer la fonction qui affiche la table
	void afficher ()
	{
	printf("\n/***************Table des symboles ******************/\n");
	printf("_____________________________________________\n");
	printf("\t| NomEntite |  CodeEntite | TypeEntite  | Constante      |  Valeur \n");
	printf("_________________________________________________________________________\n");
	int i=0;
	  while(i<CpTabSym)
	  {
		printf("\t|%10s |%12s  |%12s | %12s | %10s \n",ts[i].NomEntite,ts[i].CodeEntite,ts[i].TypeEntite,ts[i].constante,ts[i].valeur);
		 i++;
	   }
	}
 //7-programmer une fonction qui permet d'inserer le type
 
	void insererType(char entite[], char type[])
	{
       int position;
	   position =recherche(entite);
	 if(position !=-1)
	{
	strcpy(ts[position].TypeEntite,type); 
	
	}
	}
 //8-detecter la double declaration de la variable
  int DoubleDeclaration(char entite[])
  {
   int position;
   position =recherche(entite);
   //printf("position =%d\n",position);
   if(strcmp(ts[position].TypeEntite,"")==0) return 0;
   else return -1;
  
  }
    
   void  insererconstante(char entite[], char valeur[])
    {
	  int position;
	  position = recherche(entite);
	  strcpy(ts[position].constante,"oui");
	  strcpy(ts[position].valeur ,valeur); 
	  
	  
	}   

  int  constValeur(char entite [])
      {
	  int pos;
	  pos=recherche(entite);
	  if(strcmp(ts[pos].constante,"Non")==0 ) return -1;
	  else
	  {   if(strcmp(ts[pos].valeur," ")==0  ) return 0;
		  else
		  return 1;
		  
	  }	
	  
      } 
	 int rech(char entite[])
	{
	int i=0;
	while(i<Ct)
	{
	if (strcmp(entite,tp[i].NomEntite)==0) return i;
	i++;
	}

	return -1;
	}
	void inserer_val(char entite[],char val[] )
	{

	if ( rech(entite)==-1)
	{
	strcpy(tp[Ct].NomEntite,entite); 
	strcpy(tp[Ct].TypeEntite,val);
	strcpy(tp[Ct].Typevaleur," ");
	
	Ct++;
	}
	}  
	void afficher1()
	{
	printf("\n/***************Table des symboles ******************/\n");
	printf("_____________________________________________\n");
	printf("\t| NomEntite |  typ | TypeV    \n");
	printf("_________________________________________________________________________\n");
	int i=0;
	  while(i<Ct)
	  {
		printf("\t|%10s |%12s  |%12s  \n",tp[i].NomEntite,tp[i].TypeEntite,tp[i].Typevaleur);
		 i++;
	   } 
	} 
void  inserervaltype(char entite[], char valeur[])
    {
	  int position;
	  position = rech(entite); 
	  strcpy(tp[position].Typevaleur ,valeur); 
	} 


		typedef struct {
		char ch[20];
		} matc ;
		int cmptype = 0;
		matc mattype[100];
		
int  compteur(matc m[])
{int i =0 , x =0;  
for(i=0; i<200; i++)
{  

if (strcmp(m[i].ch , "") !=0)
	 x=x+1;
 else return x;	 
}
}
//15-programmer la fonction format elle crée la liste des formats  

void formatage (char chaine[] , matc tabidf[] , int n )
{
char formatage[20] ;
char frm[20];
matc tabformatage[100];
int taille = strlen(chaine);	
int i =0;
int j =0;
int k =0;
int x= 0;
int y= 0;
while(i<taille )
{ if (chaine[i] == '%')
	{ if (chaine[i+1] == 'd')	
       {  
	      strcpy(frm, "%");
          strcat(frm, "d");
	      strcpy(tabformatage[j].ch,frm);
	      j++; 
       }
		else if (chaine[i+1] == 'f')	
               {  
			      strcpy(frm, "%");
                  strcat(frm, "f");
	              strcpy(tabformatage[j].ch,frm);
	              j++; 
               }
		    else if (chaine[i+1] == 's')	
                  {  
				     strcpy(frm, "%");
                     strcat(frm, "s");
	                 strcpy(tabformatage[j].ch,frm);
	                  j++; 
                  } 
    }
	i++;
 }
 x = compteur(tabidf);

 
 if ( x != (j) )
   {
	 printf ("erreur semantique: formatge incorrecte a la ligne plus ou moins de format que de variable %d\n", n);
   }
  else {
	   y=j-1;
	  for(k=0; k<j; k++)
	      
	  { if (strcmp (tabformatage[k].ch, "%d")==0)
		  {   
			  if (isInt(tabidf[y].ch) != 0)
			  {
				  printf ("erreur semantique: formatge int  incorrecte a la ligne %d sur l'entite %s\n", n , tabidf[y].ch);
			   
			  }
			   y= y-1;
		  }
		  else if (strcmp (tabformatage[k].ch, "%f")==0)
		     {
				
			  if (isFloat(tabidf[y].ch) != 0)
			  {
				  
				  printf ("erreur semantique: formatge float incorrecte a la ligne %d sur l'entite %s\n", n , tabidf[y].ch);
			    
			  }
			   y= y-1;
		     }
			 else  if (strcmp (tabformatage[k].ch, "%s")==0)
		       {
			      if (isString(tabidf[y].ch) != 0)
			      {
				  printf ("erreur semantique: formatge string incorrecte a la ligne %d sur l'entite %s\n", n , tabidf[y].ch);
				  
				  }
				  y=y-1;
		       }
	  }
  }
}

//18-programmer la fonction isString 
int isString(char entite[])
{   int pos;
	pos=rech(entite);
	if(strcmp(ts[pos].TypeEntite, "chaine")==0) 
	{return 0;}
	else return -1;
}

//19-programmer la fonction isInt 
int isInt(char entite[])
{   int pos;
	pos=rech(entite);
	if(strcmp(ts[pos].TypeEntite, "Entier")==0) 
	{return 0;}
	else return -1;
}

//20-programmer la fonction isFloat 
int isFloat (char entite[])
{   int pos;
	pos=rech(entite);
	if(strcmp(ts[pos].TypeEntite, "Reel")==0) 
	{return 0;}
	else return -1;
}

//21-programmer la fonction isFloat 
void effacerContenu(matc tabidf[])
{   int i ;
	for (i=0; i<200 ; i++)
	{
	strcpy(tabidf[i].ch,"");
	}
}

int comparerType (char entite[]  , char entite1[] )
{   int pos;
	int pos1;
	pos=recherche(entite);
	pos1=recherche(entite1);
	if(strcmp(ts[pos].TypeEntite, ts[pos1].TypeEntite)==0) 
	{return 0;}
	else return -1;
}
int comparerTypeConst (char entite[]  , char type2[] )
{   int pos;
    pos=recherche(entite);  
	//printf("val a la ligne %s\n", ts[pos].TypeEntite);
	if(strcmp(ts[pos].TypeEntite,type2) ==0) 
	{return 0;}
	else return -1;
}


	
	
	  