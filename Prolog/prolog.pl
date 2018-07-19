% Define which rooms have a phone ringing.

ringing(5).
ringing(9).
ringing(16).

% Define the doors.

door(2, 1).
door(7, 1).
door(1, 2).
door(8, 2).
door(8, 3).
door(8, 4).
door(9, 4).
door(6, 5).
door(9, 5).
door(5, 6).
door(9, 6).
door(1, 7).
door(8, 7).
door(9, 7).
door(10, 7).
door(11, 7).
door(12, 7).
door(13, 7).
door(14, 7).
door(2, 8).
door(3, 8).
door(4, 8).
door(7, 8).
door(4, 9).
door(5, 9).
door(6, 9).
door(7, 9).
door(7, 10).
door(7, 11).
door(7, 12).
door(7, 13).
door(7, 14).
door(15, 14).
door(14, 15).
door(16, 15).
door(15, 16).


% check if two rooms are door each other.
adjacent(RoomA, RoomB) :- door(RoomA, RoomB); door(RoomB, RoomA).

:- dynamic(traveled/2).

% Check if a path has already been traveled.

banned(RoomA, RoomB) :- adjacent(RoomA, RoomB), (traveled(RoomA, RoomB); traveled(RoomB, RoomA)).


path_to_phone(FirstRoom, LastRoom, Path) :- % Base Case

	ringing(LastRoom),
	door(FirstRoom, LastRoom),
	\+(banned(FirstRoom, LastRoom)),
	\+(FirstRoom = LastRoom),
	nth(1, Path, FirstRoom),
	nth(2, Path, LastRoom),
	length(Path, 2),
	last(Path, LastRoom).


path_to_phone(FirstRoom, LastRoom, Path) :- % Recursive Case

	ringing(LastRoom),
	door(FirstRoom, NextRoom),
	\+(banned(NextRoom, FirstRoom)),
	\+(FirstRoom = LastRoom),
	no_Retrace(FirstRoom, NextRoom),
	[H|T] = Path,
	=(H, FirstRoom),
	;(path_to_phone(NextRoom, LastRoom, T), (travel_ban_overturned(FirstRoom, NextRoom), fail)).

no_Retrace(FirstRoom, NextRoom) :-
	asserta(traveled(FirstRoom,NextRoom)),
	asserta(traveled(NextRoom,FirstRoom)).

travel_ban_overturned(FirstRoom, NextRoom) :-
	retract(traveled(FirstRoom, NextRoom)),
	retract(traveled(NextRoom, FirstRoom)).





