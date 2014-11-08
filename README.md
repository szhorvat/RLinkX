RLinkX
======

This is a convenience package for automating the setup steps needed for using an external R installation with [RLink][1].

Put `RLinkX.m` in `FileNameJoin[{$UserBaseDirectory, "Applications"}]`, open it, and adjust the path to your R installation.

Then load RLink using

```
Needs["RLinkX`"]
InstallR[]
```

For Mathematica earlier than 10.0.1, use `InstallRX[]` instead.

 [1]: http://reference.wolfram.com/language/RLink/guide/RLink.html
