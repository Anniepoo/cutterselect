:- module(load, []).
/** <module>  Set up server environment
   Cutterselect

   This file is part of cutterselect.
   It is licensed under the MIT license.

   Copyright (c) 2012, University of Houston
   Which has released it under the terms of the LGPL


*/

init_cutterselect_demo:-
  % The use of `file_search_path(cutterselecttest, .)` is unreliable,
  % since the meaning of point depends on the directory from
  % which swipl was called.
  source_file(init_cutterselect_demo, ThisFile),
  file_directory_name(ThisFile, ThisDirectory),
  assert(user:file_search_path(cutterselecttest, ThisDirectory)),
  assert(user:file_search_path(cutterselect, cutterselecttest('../prolog'))),
  assert(user:file_search_path(css, cutterselect('static/css'))),
  assert(user:file_search_path(js, cutterselect('static/js'))),
  assert(user:file_search_path(icons, cutterselect('static/icons'))).

:- init_cutterselect_demo.

% Turn on the logger
:- ensure_loaded(library(http/http_log)).
% Turn on sessions
:- ensure_loaded(library(http/http_session)).
% Needed for http:location/3, don't remove even if red
:- use_module(library(http/http_path)).

% these are suspicious
%http:location(admin, '/admin' , []).
%http:location(demo, '/demo', []).





