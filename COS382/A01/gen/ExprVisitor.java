// Generated from C:/UbuntuFiles/COS382/A01\Expr.g4 by ANTLR 4.7.2
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link ExprParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface ExprVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link ExprParser#prog}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProg(ExprParser.ProgContext ctx);
	/**
	 * Visit a parse tree produced by {@link ExprParser#s}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitS(ExprParser.SContext ctx);
	/**
	 * Visit a parse tree produced by {@link ExprParser#b}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitB(ExprParser.BContext ctx);
	/**
	 * Visit a parse tree produced by {@link ExprParser#r}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitR(ExprParser.RContext ctx);
	/**
	 * Visit a parse tree produced by {@link ExprParser#x}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitX(ExprParser.XContext ctx);
	/**
	 * Visit a parse tree produced by {@link ExprParser#c}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitC(ExprParser.CContext ctx);
	/**
	 * Visit a parse tree produced by {@link ExprParser#v}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitV(ExprParser.VContext ctx);
	/**
	 * Visit a parse tree produced by {@link ExprParser#l}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitL(ExprParser.LContext ctx);
	/**
	 * Visit a parse tree produced by {@link ExprParser#t}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitT(ExprParser.TContext ctx);
	/**
	 * Visit a parse tree produced by {@link ExprParser#o}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitO(ExprParser.OContext ctx);
	/**
	 * Visit a parse tree produced by {@link ExprParser#d}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitD(ExprParser.DContext ctx);
	/**
	 * Visit a parse tree produced by {@link ExprParser#n}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitN(ExprParser.NContext ctx);
}