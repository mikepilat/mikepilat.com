---
layout: post
title: Determining if an application is installed with AppleScript
---
This is a quick post to archive something that took me too long to find online,
and hopefully someone else will find it useful (and perhaps easier to find). As
you might know, in [AppleScript](http://developer.apple.com/AppleScript/) if
you want to tell an application to do something, but only if it's running, you
might do something like this:

<script src="http://gist.github.com/351423.js?file=ifRunning.applescript"></script>

However, this method lacks if you don't have the application installed; When
that's the case, AppleScript pops up a dialog titled "Choose Application" that
asks, "Where is AppYouDontHave?" If, like me, you are developing an application
that scripts another application with AppleScript and you don't want to display
such a dialog to your users, but instead silently fail, or handle the lack of
the other application in some other way, you probably want to detect if the
application is installed.  After some searching online, I came across the
following method using the AppleScript terminology exposed by Finder.app,
wherein you look for the name (e.g., `TextMate.app`) of an application by its
application id, (e.g., `com.macromates.TextMate`)

<script src="http://gist.github.com/351423.js?file=FinderAppName.applescript"></script>

If you want to do this sort of check inside your Cocoa app, you can do something like this:

<script src="http://gist.github.com/351423.js?file=FinderAppName.c"></script>

This works, but it seems a bit silly to do this work through AppleScript that
I'm running from a Cocoa application, so I'll be looking a way to do this with
an actual API (maybe [Launch Services](http://developer.apple.com/mac/library/documentation/Carbon/Conceptual/LaunchServicesConcepts/LSCIntro/LSCIntro.html)?)

