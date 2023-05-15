#1o Task(1,2,3(commongenre))

prolog.assertz('(commongenre_5(X,Y):-genre(X,A),genre(X,B),genre(X,C),genre(X,D),genre(X,E),genre(Y,A),genre(Y,B),genre(Y,C),genre(Y,D),genre(Y,E),X\=Y,A\=B,A\=C,A\=D,A\=E,B\=C,B\=D,B\=E,C\=D,C\=E,D\=E)')
prolog.assertz('(commongenre_4(X,Y):-genre(X,A),genre(X,B),genre(X,C),genre(X,D),genre(Y,A),genre(Y,B),genre(Y,C),genre(Y,D),X\=Y,A\=B,A\=C,A\=D,B\=C,B\=D,C\=D, not(commongenre_5(X,Y)))')
prolog.assertz('(commongenre_3(X,Y):-genre(X,A),genre(X,B),genre(X,C),genre(Y,A),genre(Y,B),genre(Y,C),X\=Y,A\=B,A\=C,B\=C, not(commongenre_4(X,Y)), not(commongenre_5(X,Y)))')
prolog.assertz('(commongenre_2(X,Y):-genre(X,A),genre(X,B),genre(Y,A),genre(Y,B),X\=Y,A\=B, not(commongenre_3(X,Y)), not(commongenre_4(X,Y)), not(commongenre_5(X,Y)))')
prolog.assertz('(commongenre_1(X,Y):-genre(X,A),genre(Y,A),X\=Y, not(commongenre_2(X,Y)), not(commongenre_3(X,Y)), not(commongenre_4(X,Y)), not(commongenre_5(X,Y)))')

prolog.assertz('(commongenre_very(X,Y):-genre(X,A),genre(X,B),genre(X,C),genre(X,D),genre(Y,A),genre(Y,B),genre(Y,C),genre(Y,D),X\=Y,A\=B,A\=C,A\=D,B\=C,B\=D,C\=D)')
prolog.assertz('(commongenre_medium(X,Y):-genre(X,A),genre(X,B),genre(Y,A),genre(Y,B),X\=Y,A\=B, not(commongenre_4(X,Y)), not(commongenre_5(X,Y)))')
prolog.assertz('(commongenre_low(X,Y):-commongenre_1(X,Y))')

def common_genre(movie):

    q = prolog.query("commongenre_1('" + movie + "',M)")
    ans5 = []
    for soln in q:
        ans5.append(soln["M"])

    print("hey")
    q = prolog.query("commongenre_2('" + movie + "',M)")
    ans4 = []
    for soln in q:
        ans4.append(soln["M"])

    print("hey2")
    q = prolog.query("commongenre_3('" + movie + "',M)")
    ans3 = []
    for soln in q:
        ans3.append(soln["M"])

    q = prolog.query("commongenre_4('" + movie +"',M)")
    ans2 = []
    for soln in q:
        ans2.append(soln["M"])
    q = prolog.query("commongenre_5('" +  movie +"',M)")
    ans1 = []
    for soln in q:
        ans1.append(soln["M"])

    return list(set(ans5))[:10], list(set(ans4))[:10], list(set(ans3))[:10], list(set(ans2))[:10], list(set(ans1))[:10]
    #return list(set(ans3))[:10], list(set(ans2))[:10], list(set(ans1))[:10]

#2o Task(4(commondirector))

prolog.assertz('(common_director(X, Y) :- director(X, A), director(Y, A), X \= Y )')

def common_director(movie):
    q = prolog.query("common_director('" + movie +"',M)")
    ans = []
    for soln in q:
        ans.append(soln["M"])
    return list(set(ans))[:10]

#3o Task(5,6(commonplot))

prolog.assertz('(commonplot_high(X,Y):-plot_keyword(X,A),plot_keyword(X,B),plot_keyword(Y,A),plot_keyword(Y,B),X\=Y,A\=B)')
prolog.assertz('(commonplot_low(X,Y):-plot_keyword(X,A),plot_keyword(Y,A),X\=Y, not(commonplot_high(X,Y)) )')

def common_plot(movie):

    q = prolog.query("commonplot_high('" + movie + "',M)")
    ans5 = []
    for soln in q:
        ans5.append(soln["M"])

    q = prolog.query("commonplot_low('" + movie + "',M)")
    ans4 = []
    for soln in q:
        ans4.append(soln["M"])
    return list(set(ans5))[:10], list(set(ans4))[:10]

#4o Task(7,8,9(commonactor))

prolog.assertz('(three_common_actors(X, Y) :- actor(X, A), actor(X, B), actor(X, C), actor(Y, A), actor(Y, B), actor(Y, C), X \= Y, A \= B, B \= C, C \= A )')
prolog.assertz('(two_common_actors(X, Y) :- actor(X, A), actor(X, B), actor(Y, A), actor(Y, B), X \= Y, A \= B, not(three_common_actors(X, Y)) )')
prolog.assertz('(one_common_actor(X, Y) :- actor(X, A), actor(Y, A), X \= Y, not(two_common_actors(X, Y)), not(three_common_actors(X, Y)) )')

def common_actors(movie):
    q = prolog.query("three_common_actors('" + movie + "',M)")
    ans3 = []
    for soln in q:
        ans3.append(soln["M"])


    q = prolog.query("two_common_actors('" + movie +"',M)")
    ans2 = []
    for soln in q:
        ans2.append(soln["M"])


    q = prolog.query("one_common_actor('" + movie +"',M)")
    ans1 = []
    for soln in q:
        ans1.append(soln["M"])


    return list(set(ans3)), list(set(ans2)), list(set(ans1))[:10]

#5o Task(10,(Same language))

prolog.assertz('(same_language(X, Y) :- language(X, A), language(Y, A), X \= Y )')

def same_language(movie):
    q = prolog.query("same_language('" + movie +"',M)")
    ans = []
    for soln in q:
        ans.append(soln["M"])
    return list(set(ans))[:10]

#6o Task(11(Color))
