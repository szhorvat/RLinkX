(* RLinkX.m, place in FileNameJoin[{$UserBaseDirectory, "Applications"}] *)

BeginPackage["RLinkX`", {"RLink`"}]

Begin["`Private`"]

(* set the location of your R installation here *)
Switch[$OperatingSystem,
    "MacOSX",  rloc = "/Library/Frameworks/R.framework/Resources/",
    "Unix",    rloc = "/usr/lib/R", (* "/usr/lib64/R" for Fedora *)
    "Windows", rloc = "C:\\Program Files\\R\\R-3.1.2"
]

addLibPath[var_] := Module[{lpath, rlibloc},
    rlibloc = FileNameJoin[{rloc, "lib"}];
    lpath = var /. GetEnvironment[var]; 
    SetEnvironment[var -> If[lpath === None, rlibloc, lpath <> ":" <> rlibloc]]
]

Switch[$OperatingSystem,
    "MacOSX", 
    addLibPath["DYLD_LIBRARY_PATH"];
    SetOptions[RLink`InstallR, "RHomeLocation" -> rloc];
    SetOptions[RLink`InstallR, "RVersion" -> 3];
    ,
    "Unix",
    (* addLibPath["LD_LIBRARY_PATH"]; *)
    SetOptions[RLink`InstallR, "RHomeLocation" -> rloc];
    SetOptions[RLink`InstallR, "RVersion" -> 3];
    ,
    "Windows",
    SetOptions[RLink`InstallR, "RHomeLocation" -> rloc];
]

(* for Mathematica earlier than 10.0.1: *)
InstallRX[] := 
  RLink`InstallR["RHomeLocation" -> rloc, 
    If[$OperatingSystem =!= "Windows" && OrderedQ[{{10., 1}, {$VersionNumber, $ReleaseNumber}}],
      "RVersion" -> 3,
      Unevaluated@Sequence[]
    ]
  ]

End[] (* `Private` *)

EndPackage[]
