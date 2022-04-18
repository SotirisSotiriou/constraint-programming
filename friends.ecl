/*---------------------------------------------------------------------------
  This code is part of the book
  LOGIC PROGRAMMING TECHNIQUES: THE PROLOG LANGUAGE
  Ilias Sakellariou, Nikos Bassiliades, Petros Kefalas, Demosthenes Stamatis
  Hellenic Academic On-line Publications, 2015
  Extended: Ilias Sakellariou 2016
----------------------------------------------------------------------------*/

%%% Encoding friendship relations in a Social Network.
%%% Version 1.

%%% follows/2
%%% follows(Follower,User).
%%% Succeeds if Follower  follows the user
%%% in the social network.

follows(ilias, petros).
follows(petros,ilias).
follows(petros, demos).
follows(petros,sofia).
follows(nikos, petros).
follows(nikos, ilias).
follows(demos, sofia).
follows(demos,petros).
follows(ilias,katerina).
follows(katerina,petros).

follows(sofia,helen).
follows(sofia,demos). 
follows(helen,sofia).

%%% belongs/2
%%% belongs(GroupID,User)
%%% Succeeds if User belongs to the group with GroupID.

belongs_to(a,ilias).
belongs_to(a,petros).

belongs_to(b,ilias).
belongs_to(b,demos).
belongs_to(b,nikos).

belongs_to(c,petros).
belongs_to(c,katerina).
belongs_to(c,nikos).
belongs_to(c,sofia).

%%% same_group/2
%%% same_group(User1,User2)
%%% Succeeds if User1 and User2, belong to the 
%%% same group. Note that User1 and User2 can be 
%%% the same user.

same_group(X,Y):-
	belongs_to(Group,X),
	belongs_to(Group,Y),
	X \= Y.

%%% male/1
%%% male(User)
%%% Succeeds if the user is a male.

male(petros).
male(ilias).
male(demos).
male(nikos).

%%% female/1
%%% female(User)
%%% Succeeds if the user is a female.

female(sofia).
female(helen).
female(katerina).

%%% user/2
%%% user(User,Info)
%%% Succeeds if User is a user of the social network with Info a 
%%% complex term of the form info(Nationality,Birthday,Job), where
%%% Birthday and Job are complex terms representing the relevant information.

user(ilias,info(greek,birthday(30,6,1985),job(instructor))).
user(petros,info(greek,birthday(12,1,1980),job(director))).
user(demos,info(greek,birthday(14,1,1980),job(professor))).
user(nikos,info(greek,birthday(1,12,1982),job(researcher))).
user(sofia,info(greek,birthday(1,12,1989),job(professor))).

%%% same_age/2
%%% same_age(User1,User2)
%%% Succeeds if User1 and User2 have the same age.
same_age(User1,User2):-
	user(User1,info(_,BDay1,_)),
	user(User2,info(_,BDay2,_)),
	same_birth_year(BDay1,BDay2),
	User1 \= User2.

%%% same_birth_year/2
%%% same_birth_year(BirthInfo1,BirthInfo2)
%%% Succeeds if the complex terms that store the date information
%%% for the birthday are "poiting" to the same year.
same_birth_year(birthday(_,_,Year),birthday(_,_,Year)).


%%% female_friends/2
%%% female_friends(X,Y)
%%% Succeeds if Y is a female friend of X.
female_friends(X,Y):-
	friends(X,Y),
	female(Y).

%%% male_friends/2
%%% male_friends(X,Y)
%%% Succeeds if Y is a male friend of X.
male_friends(X,Y):-
	friends(X,Y),
	male(Y).

%%% friends/2
%%% friends(X,Y)
%%% Succeeds if Y is a friend of X, i.e. 
%%% if X follows Y and Y follows X. 
friends(X,Y):-
	follows(X,Y),
	follows(Y,X).


%%% recommend_common_friends/2
%%% recommend_common_friends(X,Y)
%%% Suceeds if Y is a friend of a friend of X.
recommend_common_friends(X,Y):-
	friends(X,Z), 
	friends(Z,Y),
	X\=Y.

%%% friend_same_gender2/2
%%% friend_same_gender2(X,Y)
%%% Succeeds if X and Y are friends of the same gender.
%%% Alternative version demonstrating the OR (;) operator.
friend_same_gender2(X,Y):- 
 female(X), 
 friends(X,Y), 
 female(Y);
 male(X), 
 friends(X,Y), 
 male(Y).

%%%%%%%%% Recursion 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Endorse
%%% endorse(Endorser,Endorsee)

endorse(petros,ilias).
endorse(petros,demos).
endorse(petros,sofia).
endorse(demos,nikos).
endorse(nikos,helen).
endorse(nikos,katerina).

%%% Linked_by_endorsement/2
%%% linked_by_endorsement(Endorser,User),
%%% Succeeds if user Endorser is linked by endorsements
%%% to another user User. 

linked_by_E(Endorser,User):-
	endorse(Endorser,User).

linked_by_E(Endorser,User):-
	endorse(Endorser,UserX),
	linked_by_E(UserX,User). 

%%% linked_by_E_loop/2
%%% linked_by_E_loop(Endorser,User)
%%% Version with Possible Loop.
linked_by_E_loop(Endorser,User):-
	endorse(Endorser,User).

linked_by_E_loop(Endorser,User):-
	linked_by_E_loop(Endorser,UserX),
	endorse(UserX,User).

%%% Another Loop
endorse_link(petros,ilias).
endorse_link(petros,demos).
endorse_link(petros,sofia).
endorse_link(demos,nikos).
endorse_link(nikos,helen).
endorse_link(nikos,katerina).

endorse_link(X,Y):-
	endorse_link(X,Z),
	endorse_link(Z,Y).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% LISTS %%%%%
%%% User Preds
%%% likes/2
%%% likes(User,InterestList)
%%% Suceeds if InterestList is the list of user interests.

likes(petros,[math,prolog,music,cinema]).
likes(ilias,[math,prolog,theatre,travel]).
likes(nikos,[prolog,travel,c,cooking]).
likes(demos,[music,cinema,theatre]).
likes(helen,[music,cinema,travel,cooking]).
likes(sofia,[physics,cinema,reading]).







