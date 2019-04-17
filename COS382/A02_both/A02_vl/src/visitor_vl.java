import java.util.ArrayList;

public class visitor_vl extends Expr_vlBaseVisitor<Void> {
    private ArrayList<String> symbols = new ArrayList<>();

    @Override public Void visitProg(Expr_vlParser.ProgContext ctx){
        visitChildren(ctx);
        System.out.println("EOF");
        System.out.println("Symbol Table: " + symbols);
        return null;
    }
    @Override public Void visitList(Expr_vlParser.ListContext ctx){
        if (ctx.getChildCount() > 0) {
            visit(ctx.children.get(0));
            System.out.println(';');
            visit(ctx.children.get(2));
        }
        return null;
    }

    @Override public Void visitTerms(Expr_vlParser.TermsContext ctx) {
        if (ctx.getChildCount() > 0) {
            visit(ctx.children.get(1));
            System.out.printf(ctx.children.get(0).toString() + " ");
            visit(ctx.children.get(2));
        }
        return null;
    }

    @Override public Void visitFactors(Expr_vlParser.FactorsContext ctx) {
        if (ctx.getChildCount() > 0) {
            visit(ctx.children.get(1));
            System.out.printf(ctx.children.get(0).toString() + " ");
            visit(ctx.children.get(2));
        }
        return null;
    }

    @Override public Void visitFactor(Expr_vlParser.FactorContext ctx){
        if (ctx.ID() != null) {
            symbols.add(ctx.ID().toString());
            System.out.printf(ctx.ID() + " ");
        }
        if (ctx.NUM() != null) {
            System.out.printf(ctx.NUM() + " ");
        }
        return visitChildren(ctx);
    }
}
