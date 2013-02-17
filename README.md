runInfo
=======

Mul-tilanguage time and memory system informations. 
The languages:

Action Script 3
---------------
Using the flash.system.System.

C#
---
Using the GC static object.

C++
---
Windows: Using Microsoft PsApi.h and PsApi.dll.
Linux: Reading "/proc/self/status" file. 

Java
----
Using the Runtime static object.

JavaScript
----------
Runs only in Chrome or Chromium, using window.performance.

Object Pascal
-------------
Using Free Pascal.
Windows: Using PsApi unit.
Linux: Reading "/proc/self/status" file.

Perl
----
Install packages with cpan.
Windows: Using Package Win32::Process.
Linux: Using Package Proc::ProcessTable.

PHP
---
Using standart memory_get_usage() function.

VB.NET
------
Using the GC static object.
