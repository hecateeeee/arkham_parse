:- module(arkham_parse,
    [string_to_tokens/2,
    string_to_token/2,
    extract_nl/2]).

string_to_tokens(Str, Tokens):-
    string_lower(Str, Lower),
    split_string(Lower, " ", "\n.", Split),
    %maplist(string_extract_specials, Split, SpecialSplit),
    maplist(string_to_token, Split, Tokens).

% parse_card(Str, Tokens):-
% string_to_tokens(Str, Tokens),
% card(Tokens, []), !.


%string_extract_specials(Result, Head, []).
%string_extract_specials(Result, Head, Rest):-

string_to_token(Str, Tok):-
    atom_string(Atom, Str),
    (atom_number(Atom, Tok), !; Tok = Atom).

extract_nl(ToProcess, ["\n", Rest]):-
    string_concat("\n", Rest, ToProcess), !.
extract_nl(ToProcess, [ToProcess]):-
    string(ToProcess),
    nonvar(ToProcess).