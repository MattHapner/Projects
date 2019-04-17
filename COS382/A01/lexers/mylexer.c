#include "tokens.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int lookahead;
char value[20];

int next(FILE *fptr) {
    int t;
    int ctr=0;
    t = fgetc(fptr);
    if (t != EOF) {
        while(t==' ' || t=='\t') t = fgetc(fptr);
	if(isalpha(t)) {
	  // have N - get rest
	  value[ctr++]=t;
	  t=fgetc(fptr);
	  while(isalpha(t)) {
            value[ctr++]=t;
            t=fgetc(fptr);
          }  
          value[ctr]='\0';
	  ungetc(t,fptr);
	  return N;
	}
	if(isdigit(t)) {
	  value[ctr++]=t;
          t=fgetc(fptr);
	  while(isdigit(t)) {
            value[ctr++]=t;
            t=fgetc(fptr);
          }
          value[ctr]='\0';
	  ungetc(t,fptr);
	  return D;
	}
	if (t==';' || t==':' || t==',' || t=='(' || t==')' || t=='-' ||
	          t=='\n' || t=='\r') return t;
	return ERR;


    }
    else return EOF;

}