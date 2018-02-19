(*    _____   _____    _____   _____   _   __
 *   |  _  \ |  _  \  /  _  \ /  _  \ | | / /
 *   | |_) | | |_) |  | | | | | | | | | |/ /
 *   |  _ <  |  _ <   | | | | | | | | |   (
 *   | |_) | | | \ \  | |_| | | |_| | | |\ \
 *   |_____/ |_|  \_\ \_____/ \_____/ |_| \_\
 *
 *   –– a small library which helps you write quickly REST APIs.
 *
 * Copyright (c) 2012-2018 Silvio Clecio <silvioprog@gmail.com>
 *
 * This file is part of Brook library.
 *
 * Brook library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Brook library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with Brook library.  If not, see <http://www.gnu.org/licenses/>.
 *)

unit libbrook;

{$I libbrook.inc}

{$IF DEFINED(FPC) OR DEFINED(POSIX)}
 {$DEFINE BK_GNUCC_BUILT} // uses Brook library built in any GNU C compiler
{$ELSEIF DEFINED(MSWINDOWS)}
 {$DEFINE BK_MSVC_BUILT} // uses Brook library built in any GNU C compiler
{$ELSE}
 {$MESSAGE FATAL 'Unknown environment'}
{$ENDIF}

{.$DEFINE BK_SHARED_LIB} // enable to use Brook as shared library

interface

{$IF DEFINED(BK_GNUCC_BUILT)}
uses
  SysUtils
 {$IF DEFINED(UNIX)}
  , BaseUnix
 {$ELSEIF DEFINED(POSIX)}
  , Posix.SysTypes
 {$ENDIF};
{$ELSEIF DEFINED(BK_MSVC_BUILT)}
uses
  System.Win.Crtl,
  Winapi.Windows;
{$ENDIF}

type
  Pcchar = MarshaledAString;
  cuint = Cardinal;
  csize =
{$IFDEF FPC}
 {$IFDEF UNIX}
    BaseUnix
 {$ELSE}
    System
 {$ENDIF}
{$ELSE}
 {$IFDEF POSIX}
    Posix.SysTypes
 {$ELSE}
    Winapi.Windows
 {$ENDIF}
{$ENDIF}.size_t;
  Pcvoid = Pointer;

const
  BK_PU = {$IFDEF BK_MSVC_BUILT}'_'{$ELSE}''{$ENDIF};

{$IFDEF BK_SHARED_LIB}

  BK_VERSION_MAJOR_STR = '0';

  BK_LIB_NAME =
{$IFDEF BK_GNUCC_BUILT}
    Concat('libbrook-', BK_VERSION_MAJOR_STR)
{$ELSE}
    'brook'
{$ENDIF};

{$IFDEF BK_MSVC_BUILT}
procedure _exit; cdecl; external msvcrt name 'exit';
{$ENDIF}

{$ENDIF}

function bk_version: cuint; cdecl;
  external {$IFDEF BK_SHARED_LIB}BK_LIB_NAME{$ENDIF} name Concat(BK_PU, 'bk_version');

function bk_version_str: Pcchar; cdecl;
  external {$IFDEF BK_SHARED_LIB}BK_LIB_NAME{$ENDIF} name Concat(BK_PU, 'bk_version_str');

function bk_alloc(size: csize): Pcvoid; cdecl;
  external {$IFDEF BK_SHARED_LIB}BK_LIB_NAME{$ENDIF} name Concat(BK_PU, 'bk_alloc');

procedure bk_free(ptr: Pcvoid); cdecl;
  external {$IFDEF BK_SHARED_LIB}BK_LIB_NAME{$ENDIF} name Concat(BK_PU, 'bk_free');

implementation

{$IF DEFINED(BK_MSVC_BUILT)}
 {$LINK bk_str.obj}
 {$LINK bk_utils.obj}
{$ELSEIF DEFINED(BK_GNUCC_BUILT)}
 {$LINKLIB libbrook.a}
 {$IFDEF WIN32}
  {$LINKLiB libmingwex.a}
  {$LINKLIB libcrtdll.a}
 {$ENDIF}
{$ENDIF}

end.