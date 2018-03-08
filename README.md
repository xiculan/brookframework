# Development of the new Brook framework.

* Version number: 4.0
* Codename: Tardigrade
* Core (under [libbrook](https://github.com/risoflora/libbrook/tree/new_api)):
    * static objects - static objects or library linking, no external library required (I'm inclined to leave static libraries support because I can't fix `ut*` bugs related to Visual Studio - I'm focused to finish and release B4!)
    * ~~shared - dynamic loading, single external library file required, `libbrook.so` or `brook.dll`~~ (I'm inclined to use shared library (as single file `brook.dll` or `libbrook.so`) as explained above)

# Supported platforms:

Tested on:

* Windows 32 and 64 bit (Windows 7 64 bit)
* Linux 32 and 64 bit (Xubuntu 16.04 64 bit)
* ARM 32 bit (ARMv5; installed Android 5 / ARMv7; installed Android 6)

(future testings: Orange PI i96 256 MB Cortex-A5 32bit; minimal Linux core)

# Suported compilers

Successfully compiled for Windows 32/64 bit and Linux 64 bit using:
* Delphi XE family (Delphi Tokyo)
* Lazarus / Free Pascal (Lazarus 1.8.0+ / FPC 3.0.4+)

(future testings: Delphi and FPC building for ARM)

# Dependence linking

* Static ~~and shared~~ 32/64 objects/libraries generated in:
    * MSVC from Visual Studio 2017 version 15.5
    * MinGW-w64 from MSYS

(future testings: Delphi C++ compiler)

~~Planning library distribution:~~

* ~~APT (Debian based systems)~~
* ~~Pacman (MinGW)~~
* ~~Nuget (Visual Studio)~~

# Distribution / installation

* Github branch

Planning package distribution/installation:
 
* Github releasing
* GetIt (Delphi)
* OPM (Lazarus)

# Currently available

Units:

* ~~`BrookUtils` - useful routines and structures.~~ (Done!)
* ~~`BrookString` - low-level string handling.~~ (Done!)
* `BrookStringMap` - Mapped strings for fast key-value handling.~~ (In progress ...)

Classes:

* ~~`TBrookString` - used to represent a HTML body, POST payload and more.~~ (Done!)
* `TBrookStringMap` - used to represent HTML fields, query-string parameters and more. (In progress ...)

Packages:

* `BrookFramework.dpk` - Delphi package. (In progress...)
* `BrookFramework.lpk` - Lazarus package. (In progress...)

Examples:

* ~~`BrookUtils_Example` - utility functions example.~~ (Done!)
* ~~`BrookString_Example` - string class example.~~ (Done!)
* `BrookStringMap_Example` - string map example. (In progress ...)

Testings:

* ~~`TestUtils` - utility testings.~~ (Done!)
* ~~`TestString` - string class testings.~~ (Done!)
* `TestStringMap` - string map testings. (In progress...)

Documentation:

* ~~`BrookUtils` - utility functions reference [HTML/PDF].~~ (Done!)
* ~~`BrookString` - string class reference [HTML/PDF].~~ (Done!)
* `BrookStringMap` - string map reference [HTML/PDF]. (In progress ...)

Bugs & Problems:

* Free Pascal common missing routines/types - all issued at its bugtracker.
* Delphi unit encoding - unwanted UTF8 BOM when saving unit files.
* `utstring.h` win64 building - cannot be built in MSVC for x64 (https://github.com/troydhanson/uthash/pull/143).
* `uthash.h` msvc building - cannot be built declaring the CL's /Wall /WX flags (https://github.com/troydhanson/uthash/issues/150).
