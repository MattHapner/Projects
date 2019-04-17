// Generated from C:/UbuntuFiles/COS382/A02_vl\Expr_vl.g4 by ANTLR 4.7.2
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link Expr_vlParser}.
 */
public interface Expr_vlListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link Expr_vlParser#prog}.
	 * @param ctx the parse tree
	 */
	void enterProg(Expr_vlParser.ProgContext ctx);
	/**
	 * Exit a parse tree produced by {@link Expr_vlParser#prog}.
	 * @param ctx the parse tree
	 */
	void exitProg(Expr_vlParser.ProgContext ctx);
	/**
	 * Enter a parse tree produced by {@link Expr_vlParser#list}.
	 * @param ctx the parse tree
	 */
	void enterList(Expr_vlParser.ListContext ctx);
	/**
	 * Exit a parse tree produced by {@link Expr_vlParser#list}.
	 * @param ctx the parse tree
	 */
	void exitList(Expr_vlParser.ListContext ctx);
	/**
	 * Enter a parse tree produced by {@link Expr_vlParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExpr(Expr_vlParser.ExprContext ctx);
	/**
	 * Exit a parse tree produced by {@link Expr_vlParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExpr(Expr_vlParser.ExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link Expr_vlParser#terms}.
	 * @param ctx the parse tree
	 */
	void enterTerms(Expr_vlParser.TermsContext ctx);
	/**
	 * Exit a parse tree produced by {@link Expr_vlParser#terms}.
	 * @param ctx the parse tree
	 */
	void exitTerms(Expr_vlParser.TermsContext ctx);
	/**
	 * Enter a parse tree produced by {@link Expr_vlParser#term}.
	 * @param ctx the parse tree
	 */
	void enterTerm(Expr_vlParser.TermContext ctx);
	/**
	 * Exit a parse tree produced by {@link Expr_vlParser#term}.
	 * @param ctx the parse tree
	 */
	void exitTerm(Expr_vlParser.TermContext ctx);
	/**
	 * Enter a parse tree produced by {@link Expr_vlParser#factors}.
	 * @param ctx the parse tree
	 */
	void enterFactors(Expr_vlParser.FactorsContext ctx);
	/**
	 * Exit a parse tree produced by {@link Expr_vlParser#factors}.
	 * @param ctx the parse tree
	 */
	void exitFactors(Expr_vlParser.FactorsContext ctx);
	/**
	 * Enter a parse tree produced by {@link Expr_vlParser#factor}.
	 * @param ctx the parse tree
	 */
	void enterFactor(Expr_vlParser.FactorContext ctx);
	/**
	 * Exit a parse tree produced by {@link Expr_vlParser#factor}.
	 * @param ctx the parse tree
	 */
	void exitFactor(Expr_vlParser.FactorContext ctx);
}