:- module(debug, [pldoc/0, portray_list_innerds/1]).
/**   <module> Consult me to bring up normal dev environment.

   To run the server, query cutterselect/0.
   To run the pldoc server, query pldoc/0, which starts the
   pldoc server on http://127.0.0.1:4040/help/source

   @copyright Copyright (C) 2012, University of Houston
   Released under the LGPL as part of the Weblog project

   This file is part of cutterselect.
   It is licensed under the MIT license.
*/

:- license(lgpl_compatible).

% Needed for http:location/3, don't remove even if red!!!
:- use_module(library(http/http_path)).

:- multifile http:location/3.

http:location(pldoc, root('help/source'), [priority(10)]).

:- use_module(library(doc_http)).
:- doc_server(4040).

% more reasonable default for how many items to print before ellipsizing
:- set_prolog_flag(toplevel_print_options,
	[backquoted_string(true), max_depth(9999),
	 portray(true), spacing(next_argument)]).
:- set_prolog_flag(debugger_print_options,
	[backquoted_string(true), max_depth(9999),
	 portray(true), spacing(next_argument)]).
user:portray([H|T]) :-
	write('['),
	portray_list_innerds([H|T]),
	write(']').

% This library allows for exploiting the color and attribute facilities
% of most modern terminals using ANSI escape sequences.
% The Windows console (swipl-win) does not (yet) support ANSI (color)
% codes.
:- use_module(library(ansi_term)).

/**   portray_list_innerds(+List:list) is det

Displays a list without ellipsizing it.
When debugging termerized HTML ellipsizing gets in
the way

*/
portray_list_innerds([]).
portray_list_innerds([H]) :-
	print(H).
portray_list_innerds([H|T]) :-
	print(H),
	write(','),
	portray_list_innerds(T).

% ensure that we print debug messages from weblog
% particularly important for missing keys
:- debug(weblog).

:- ensure_loaded(load).
:- use_module(cutterselect).

% reexport so user can control from the interactor
:- reexport(cutterselect, [cutterselect/0, start_server/0, stop_server/0]).

%%	pldoc is det
%
%	Run the pldoc server on 4040 and open the root page
%
:- use_module(library(www_browser)).
pldoc :-
	doc_server(4040),
	www_open_url('http://127.0.0.1:4040/help/source').

:- writeln('\
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n\
%                                           %\n\
%    To run the pldoc server query pldoc.   %\n\
% To run cutterselect query cutterselect/0. %\n\
%                                           %\n\
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%').

