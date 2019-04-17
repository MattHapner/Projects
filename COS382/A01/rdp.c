#include "./lexers/mylexer.c"
#include <string.h> /* memset */

void read_tokens();
char tokens[20];
int t_idx = 0;

int main(int argc, char *argv[]) {
    FILE *fptr;
    printf("***** C Recursive Descent Parser *****\n\n");
    if (argc != 2) {
        printf("No file inputted\n");
        exit(0);
    } else {
        fptr = fopen(argv[1], "r");
        if (fptr == NULL) {
            printf("Cannot open file\n");
            exit(0);
        }
    }
    read_tokens(fptr);

    fclose(fptr);
}

int get_token() {
    int val = tokens[t_idx++];
    //printf("%d ",val);
    return val;
}

int S();
int B();
int R();
int X();
int T();

// 1 for success, 0 for failure
int S() {
    return B() && R() && T();
}

int B() {
    char c = get_token();
    if (c == D) {
        c = get_token();
        if (c == N) {
            return 1;
        }
    }
    if (c == N) {
        return 1;
    }
    return 0;
}

int R() {
    char c = get_token();
    if (c == '\n' || c == '(') {
        --t_idx;
        return 1;
    }
    if (c != D) {
        return 0;
    }
    return X();
}

int X() {
    char c = get_token();
    if (c == '\n' || c == '(') {
        --t_idx;
        return 1;
    }
    // || c == '--' || c == '-'
    if (c == ';' || c == ':' || c == ',' || c == '-') {
        char c = get_token();
        if (c != D) {
            return 0;
        }
        X();
    }
}

int T() {
    char c = get_token();
    if (c == '\n') {
        return 1;
    }
    if (c == '(') {
        c = get_token();
        if (c == N) {
            c = get_token();
            if (c == ')') {
                c = get_token();
                if (c == '\n') {
                    return 1;
                }
            }
        }
    }
    return 0;
}

void read_tokens(FILE *fptr) {
    int lookahead;
    int idx = 0;
    int line_num = 1;

    while((lookahead=next(fptr))!=EOF) {
        // sequence of digits
        if(lookahead==D) {
            //printf("D{%s}",value);
            //printf("D");
        // sequence of letters
        } else if(lookahead==N) {
            //printf("N{%s}",value);
            //printf("N");
        // ERR
        } else if(lookahead==ERR) {
            //printf("*ERR*");
        // ';', ':', ','. '(', ')', '-', '\n' and '\r'
        } else {
            //printf("%c",lookahead);
        }
        tokens[idx++] = lookahead;
        // \n
        if (lookahead == 10){
            int res = S();
            if (res == 0) printf("Invalid scripture reference");
            else printf("Valid scripture reference");
            printf(" for line #%d\n",line_num);
            memset(tokens, 0, sizeof(tokens));
            line_num++;
            idx = 0;
            t_idx = 0;
        }
    }
    printf("\n");
}

