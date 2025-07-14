#!/usr/local/bin/wolframscript -function

(* Comment *)
Module[{
		l = 0,
		c = {

		},
		symbolGroups
	},
	symbolGroups =  Reap[
		Map[
			Function[word,
				l += StringLength[word];
				AppendTo[c, word];
				If[l >= 50,
					AppendTo[c, word];
					Sow[c];
					l = 0;
					c = {};
				]
			],
			Names["System`*"]
		];
	][[2, 1]];
	StringRiffle[
		Function[group,
			"syntax keyword wlSystemSymbol " <> StringRiffle[group]
		] /@ symbolGroups,
		"\n"
	]
]
