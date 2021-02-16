ChromeDriver 2.25
=================

Changes include:
Fixes a bug which causes ChromeDriver to crash during Runtime.consoleAPICalled events from Chrome 54+
Prevents timeouts when fetching logs while a dialog is showing

ChromeDriver 2.24
=================

Changes include:
Fixes for SendKeys errors, particularly with Chrome 53+
Fixes for calls to GetLog, both to reduce timeouts, and support changes in Chrome 53+
Updates to support recent remote debugging protocol changes in Chrome

ChromeDriver 2.23
=================

Changes include:
A fix for ChromeDriver on Android 6.0 Marshmallow, which sometimes causes session initialization failures
A fix for a bug where console log messages were not being seen by ChromeDriver

ChromeDriver 2.22
=================

Changes include many bug fixes, particularly for Chrome 51+. 
This includes fixes for various scenarios that caused ChromeDriver to timeout and/or hang.