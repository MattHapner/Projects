grammar Expr;prog    locals [        List<String> symbols = new ArrayList<String>()    ]: list END {                System.out.println("EOF");                System.out.println("Symbol Table: " + $symbols);               };list: expr ';' {System.out.println(";");} list |        /* epsilon */;expr: term terms;terms: '+' term {System.out.printf("+ ");} terms |       '-' term {System.out.printf("- ");} terms |       /* epsilon */;term: factor factors;factors: '*' factor {System.out.printf("* ");} factors |        '/' factor {System.out.printf("/ ");} factors |        MOD factor {System.out.printf("MOD ");} factors |        /* epsilon */;factor: '(' expr ')' |        ID {            System.out.printf($ID.text + " ");            $prog::symbols.add($ID.text + ": line #" + $ID.line);           } |        NUM {System.out.printf($NUM.text + " ");} |        REAL {System.out.printf($REAL.text + " ");};MOD: 'MOD';END: 'EOF';ID: [a-zA-Z]([a-zA-Z]|[0-9])*;NUM: [0-9]+;REAL: [0-9]* '.' [0-9]+;WS: [ \t\r\n]+ -> skip;