%%%%%%%%%%%%%%%%%%%%%%%%%%
% tree.pl
% https://gfx.cse.taylor.edu/courses/cos382/assignments/04_ParadigmLogic_Prolog
% The goal of this assignment is to write a collection of Prolog rules
% to represent and manipulate binary trees.
%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%
% Starter code

% tree(Tree)
% "Tree" is a binary tree.

tree(void).
tree(tree(_,Left,Right)) :-  tree(Left),
                             tree(Right).


% tree_member(Element,Tree)
% "Element" is an element of the binary tree "Tree".

tree_member(X,tree(X,_,_)).
tree_member(X,tree(_,Left,_)) :- tree_member(X,Left).
tree_member(X,tree(_,_,Right)) :- tree_member(X,Right).



% preorder(Tree,Pre)
% "Pre" is a list of elements of "Tree" accumulated during a
% preorder traversal.

preorder(tree(X,L,R),Xs) :- preorder(L,Ls), preorder(R,Rs),
                            append([X|Ls],Rs,Xs).
preorder(void,[]).



% append(Xs,Ys,XsYs)
% "XsYs" is the result of appending the lists "Xs" and "Ys".

append([],Ys,Ys).
append([X|Xs],Ys,[X|Zs]) :- append(Xs,Ys,Zs).


% Some sample trees
%
%    tree1       tree2         tree3
%
%      1           4             1
%     / \         / \           / \
%    2   3       5   6         2   3
%                             / \
%                            5   6
%                               /
%                              7
%

tree1(tree(1,tree(2,void,void),tree(3,void,void))).
tree2(tree(4,tree(5,void,void),tree(6,void,void))).
tree3(
        tree(   1,
                tree(   2,
                        tree(5,void,void),
                        tree(   6,
                                tree(7,void,void),
                                void
                        )
                ),
                tree(3,void,void)
        )
).



%%%%%%%%%%%%%%%%%%%%%%%%%%
% Place your code here


% Additional test data


% inorder - Left, Root, Right
inorder(tree(X,L,R), Xs) :-
        inorder(L,Ls),
        inorder(R,Rs),
        append(Ls,[X|Rs],Xs).

inorder(void, []).

% ordered - Verifies BST
ordered(tree(X,L,R)) :-
        bigger(X,L),
        smaller(X,R).

bigger(_, void) :- !.
bigger(X, tree(Y,L,R)) :-
        X > Y,
        bigger(X,L),
        bigger(X,R).

smaller(_, void) :- !.
smaller(X, tree(Y,L,R)) :-
        X < Y,
        smaller(X,L),
        smaller(X,R).

% subtree
subtree(T, T) :- !.
subtree(S, tree(_,L,R)) :-
        subtree(S, L);
        subtree(S, R).

% sumtree
sumtree(void,Sum) :- Sum is 0.
sumtree(tree(X,L,R), Sum) :-
        sumtree(L, Lsum),
        sumtree(R, Rsum),
        Sum is X + Lsum + Rsum.

% search
search(tree(X,L,R), Key) :-
        (X == Key; search(L, Key); search(R, Key)), !.

% substitute(X, Y, TreeX, TreeY) is true where TreeY is the result of replacing all occurrences of X in TreeX by element Y.
% substitute
substitute(_,_,void,void).
substitute(X, Y, tree(X,LX,RX), tree(Y,LY,RY)) :-
        substitute(X, Y, LX, LY),
        substitute(X, Y, RX, RY).
substitute(X, Y, tree(HX,LX,RX), tree(HY,LY,RY)) :-
        \+(X == HX),
        HX = HY,
        substitute(X,Y,LX,LY),
        substitute(X,Y,RX,RY).

% binsearch


