// Generated from C:/UbuntuFiles/COS382/A02_vl\Expr_vl.g4 by ANTLR 4.7.2
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link Expr_vlParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface Expr_vlVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link Expr_vlParser#prog}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProg(Expr_vlParser.ProgContext ctx);
	/**
	 * Visit a parse tree produced by {@link Expr_vlParser#list}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitList(Expr_vlParser.ListContext ctx);
	/**
	 * Visit a parse tree produced by {@link Expr_vlParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpr(Expr_vlParser.ExprContext ctx);
	/**
	 * Visit a parse tree produced by {@link Expr_vlParser#terms}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTerms(Expr_vlParser.TermsContext ctx);
	/**
	 * Visit a parse tree produced by {@link Expr_vlParser#term}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTerm(Expr_vlParser.TermContext ctx);
	/**
	 * Visit a parse tree produced by {@link Expr_vlParser#factors}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFactors(Expr_vlParser.FactorsContext ctx);
	/**
	 * Visit a parse tree produced by {@link Expr_vlParser#factor}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFactor(Expr_vlParser.FactorContext ctx);
}