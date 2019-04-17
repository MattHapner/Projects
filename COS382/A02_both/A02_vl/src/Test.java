import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.FileInputStream;

public class Test {
    public static void main(String[] args) throws Exception {
        FileInputStream inputstream = new FileInputStream("inputs/test.txt");
        ANTLRInputStream input = new ANTLRInputStream(inputstream);

        Expr_vlLexer lexer_vl = new Expr_vlLexer(input);
        CommonTokenStream tokens_vl = new CommonTokenStream(lexer_vl);
        Expr_vlParser parser_vl = new Expr_vlParser(tokens_vl);
        System.out.println("***** ANTLR Code w/ Visitor *****\n");
        ParseTree tree = parser_vl.prog(); // parse the input stream!
        visitor_vl visitor = new visitor_vl();
        visitor.visit(tree);
        }

}
