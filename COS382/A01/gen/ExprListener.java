// Generated from C:/UbuntuFiles/COS382/A01\Expr.g4 by ANTLR 4.7.2
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link ExprParser}.
 */
public interface ExprListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link ExprParser#prog}.
	 * @param ctx the parse tree
	 */
	void enterProg(ExprParser.ProgContext ctx);
	/**
	 * Exit a parse tree produced by {@link ExprParser#prog}.
	 * @param ctx the parse tree
	 */
	void exitProg(ExprParser.ProgContext ctx);
	/**
	 * Enter a parse tree produced by {@link ExprParser#s}.
	 * @param ctx the parse tree
	 */
	void enterS(ExprParser.SContext ctx);
	/**
	 * Exit a parse tree produced by {@link ExprParser#s}.
	 * @param ctx the parse tree
	 */
	void exitS(ExprParser.SContext ctx);
	/**
	 * Enter a parse tree produced by {@link ExprParser#b}.
	 * @param ctx the parse tree
	 */
	void enterB(ExprParser.BContext ctx);
	/**
	 * Exit a parse tree produced by {@link ExprParser#b}.
	 * @param ctx the parse tree
	 */
	void exitB(ExprParser.BContext ctx);
	/**
	 * Enter a parse tree produced by {@link ExprParser#r}.
	 * @param ctx the parse tree
	 */
	void enterR(ExprParser.RContext ctx);
	/**
	 * Exit a parse tree produced by {@link ExprParser#r}.
	 * @param ctx the parse tree
	 */
	void exitR(ExprParser.RContext ctx);
	/**
	 * Enter a parse tree produced by {@link ExprParser#x}.
	 * @param ctx the parse tree
	 */
	void enterX(ExprParser.XContext ctx);
	/**
	 * Exit a parse tree produced by {@link ExprParser#x}.
	 * @param ctx the parse tree
	 */
	void exitX(ExprParser.XContext ctx);
	/**
	 * Enter a parse tree produced by {@link ExprParser#c}.
	 * @param ctx the parse tree
	 */
	void enterC(ExprParser.CContext ctx);
	/**
	 * Exit a parse tree produced by {@link ExprParser#c}.
	 * @param ctx the parse tree
	 */
	void exitC(ExprParser.CContext ctx);
	/**
	 * Enter a parse tree produced by {@link ExprParser#v}.
	 * @param ctx the parse tree
	 */
	void enterV(ExprParser.VContext ctx);
	/**
	 * Exit a parse tree produced by {@link ExprParser#v}.
	 * @param ctx the parse tree
	 */
	void exitV(ExprParser.VContext ctx);
	/**
	 * Enter a parse tree produced by {@link ExprParser#l}.
	 * @param ctx the parse tree
	 */
	void enterL(ExprParser.LContext ctx);
	/**
	 * Exit a parse tree produced by {@link ExprParser#l}.
	 * @param ctx the parse tree
	 */
	void exitL(ExprParser.LContext ctx);
	/**
	 * Enter a parse tree produced by {@link ExprParser#t}.
	 * @param ctx the parse tree
	 */
	void enterT(ExprParser.TContext ctx);
	/**
	 * Exit a parse tree produced by {@link ExprParser#t}.
	 * @param ctx the parse tree
	 */
	void exitT(ExprParser.TContext ctx);
	/**
	 * Enter a parse tree produced by {@link ExprParser#o}.
	 * @param ctx the parse tree
	 */
	void enterO(ExprParser.OContext ctx);
	/**
	 * Exit a parse tree produced by {@link ExprParser#o}.
	 * @param ctx the parse tree
	 */
	void exitO(ExprParser.OContext ctx);
	/**
	 * Enter a parse tree produced by {@link ExprParser#d}.
	 * @param ctx the parse tree
	 */
	void enterD(ExprParser.DContext ctx);
	/**
	 * Exit a parse tree produced by {@link ExprParser#d}.
	 * @param ctx the parse tree
	 */
	void exitD(ExprParser.DContext ctx);
	/**
	 * Enter a parse tree produced by {@link ExprParser#n}.
	 * @param ctx the parse tree
	 */
	void enterN(ExprParser.NContext ctx);
	/**
	 * Exit a parse tree produced by {@link ExprParser#n}.
	 * @param ctx the parse tree
	 */
	void exitN(ExprParser.NContext ctx);
}