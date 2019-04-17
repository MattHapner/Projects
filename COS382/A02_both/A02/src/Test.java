import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;

import java.io.FileInputStream;

public class Test {
    public static void main(String[] args) throws Exception {
        FileInputStream inputstream = new FileInputStream("inputs/test_real.txt");
        ANTLRInputStream input = new ANTLRInputStream(inputstream);

        ExprLexer lexer = new ExprLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        ExprParser parser = new ExprParser(tokens);
        System.out.println("***** ANTLR Code w/ Actions *****\n");
        parser.prog(); // parse the input stream!
        System.out.println();

        /*
        Expr_vlLexer lexer_vl = new Expr_vlLexer(input);
        CommonTokenStream tokens_vl = new CommonTokenStream(lexer_vl);
        Expr_vlParser parser_vl = new Expr_vlParser(tokens_vl);
        System.out.println("***** ANTLR Code w/ Visitor *****\n");
        parser_vl.prog(); // parse the input stream!
        */
        };

}
