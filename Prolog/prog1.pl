% Definition of Rooms with Phones
ringing(5).
ringing(9).
ringing(16).

:- dynamic(max/2). % Change to ringing rooms.
max(5, 0).
max(9, 0).
max(16, 0).

:- dynamic(min/2). % Change to ringing rooms.
min(5, 20).
min(9, 20).
min(16, 20).

% Definition of Rooms that touch each other
touching(2, 1).
touching(7, 1).
touching(1, 2).
touching(8, 2).
touching(8, 3).
touching(8, 4).
touching(9, 4).
touching(6, 5).
touching(9, 5).
touching(5, 6).
touching(9, 6).
touching(1, 7).
touching(8, 7).
touching(9, 7).
touching(10, 7).
touching(11, 7).
touching(12, 7).
touching(13, 7).
touching(14, 7).
touching(2, 8).
touching(3, 8).
touching(4, 8).
touching(7, 8).
touching(4, 9).
touching(5, 9).
touching(6, 9).
touching(7, 9).
touching(7, 10).
touching(7, 11).
touching(7, 12).
touching(7, 13).
touching(7, 14).
touching(15, 14).
touching(14, 15).
touching(16, 15).
touching(15, 16).

% Dynamic definition of banned doors.
:- dynamic(traveled/2).

% Check touching status.
adjacent(RoomA, RoomB) :- touching(RoomA, RoomB); touching(RoomB, RoomA).

% Check if a path is banned.
banned(RoomA, RoomB) :- adjacent(RoomA, RoomB), (traveled(RoomA, RoomB); traveled(RoomB, RoomA)).

path_to_phone(FirstRoom, LastRoom, Path) :- % Base Case
	ringing(LastRoom),
	touching(FirstRoom, LastRoom),
	\+(banned(FirstRoom, LastRoom)),
	\+(FirstRoom = LastRoom),
	nth(1, Path, FirstRoom),
	nth(2, Path, LastRoom),
	length(Path, 2),
	last(Path, LastRoom).

path_to_phone(FirstRoom, LastRoom, Path) :- % Recursive Case
	ringing(LastRoom),
	touching(FirstRoom, NextRoom),
	\+(banned(NextRoom, FirstRoom)),
	\+(FirstRoom = LastRoom),
	travel_ban(FirstRoom, NextRoom),
	[H|T] = Path,
	=(H, FirstRoom),
	;(path_to_phone(NextRoom, LastRoom, T), (travel_ban_overturned(FirstRoom, NextRoom), fail)).

travel_ban(FirstRoom, NextRoom) :-
	asserta(traveled(FirstRoom, NextRoom)),
	asserta(traveled(NextRoom, FirstRoom)).

travel_ban_overturned(FirstRoom, NextRoom) :-
	retract(traveled(FirstRoom, NextRoom)),
	retract(traveled(NextRoom, FirstRoom)).

min_path_to_phone(FirstRoom, LastRoom, Path, Distance) :-
	findall(Path, min_path_solver(FirstRoom, LastRoom, Path, Distance), _),
	min_path_solver(FirstRoom, LastRoom, Path, Distance).

min_path_solver(FirstRoom, LastRoom, Path, Distance) :-
	path_to_phone(FirstRoom, LastRoom, Path),
	length(Path, Distance),
	min(LastRoom, CurrentMin),
	@=<(Distance, CurrentMin),
	retractall(min(LastRoom, _)),
	asserta(min(LastRoom, Distance)).

max_path_to_phone(FirstRoom, LastRoom, Path, Distance) :-
	findall(Path, max_path_solver(FirstRoom, LastRoom, Path, Distance), _),
	max_path_solver(FirstRoom, LastRoom, Path, Distance).

max_path_solver(FirstRoom, LastRoom, Path, Distance) :-
	path_to_phone(FirstRoom, LastRoom, Path),
	length(Path, Distance),
	max(LastRoom, CurrentMax),
	@>=(Distance, CurrentMax),
	retractall(max(LastRoom, _)),
	asserta(max(LastRoom, Distance)).