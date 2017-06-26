use v6;

use Test;
use Format::Lisp;

plan 8;

my $fl = Format::Lisp.new;
my $*CONSISTENCY-CHECK = True;
my $*FALL-THROUGH = True;
my $parsed;

subtest {
	my @options =
		Q{~#,#@A},
		Q{~#,#A},
		Q{~#@A},
		Q{~#@a},
		Q{~#A},
		Q{~#a},
		Q{~-100000000000000000000a},
		Q{~-100A},
		Q{~10,,,v@A},
		Q{~10,,,v@a},
		Q{~10,,,vA},
		Q{~10,,,va},
		Q{~3,,+2A},
		Q{~3,,-1A},
		Q{~3,,0A},
		Q{~3,,v@A},
		Q{~3,,vA},
		Q{~3,1a},
		Q{~3,3@a},
		Q{~4,#@A},
		Q{~4,#A},
		Q{~4,,,'X@a},
		Q{~4,,,'XA},
		Q{~4,,,@A},
		Q{~4,,,a},
		Q{~4,,va},
		Q{~4,3a},
		Q{~4,4@a},
		Q{~5,#@A},
		Q{~5,#a},
		Q{~5,3@a},
		Q{~5,3A},
		Q{~5,v@A},
		Q{~5,vA},
		Q{~7,3@a},
		Q{~7,3A},
		Q{~:A},
		Q{~:a},
		Q{~? ~A},
		Q{~@? ~A},
		Q{~@A},
		Q{~@[X~]Y~A},
		Q{~@a},
		Q{~@{~2,#^~A~}X~A},
		Q{~A},
		Q{~AY~?X~A},
		Q{~AY~@?X~A},
		Q{~A~*~A},
		Q{~A~0*~A},
		Q{~A~1{~A~*~A~}~A},
		Q{~A~1{~A~0*~A~}~A},
		Q{~A~1{~A~:*~A~}~A},
		Q{~A~1{~A~A~A~2:*~A~A~}~A},
		Q{~A~1{~A~A~A~:*~A~}~A},
		Q{~A~1{~A~A~v@*~A~A~}~A},
		Q{~A~:*~A},
		Q{~A~?X~A},
		Q{~A~@?X~A},
		Q{~A~A~0:*~A},
		Q{~A~A~1@*~A~A},
		Q{~A~A~2:*~A},
		Q{~A~A~2@*~A~A},
		Q{~A~A~3@*~A~A},
		Q{~A~A~:*~A},
		Q{~A~A~@*~A~A},
		Q{~A~A~v:*~A},
		Q{~A~A~v@*~A~A},
		Q{~A~v*~A},
		Q{~A~{~A~*~A~}~A},
		Q{~A~{~A~A~0@*~A~A~}~A},
		Q{~A~{~A~A~1@*~A~}~A},
		Q{~A~{~A~A~@*~A~A~}~A},
		Q{~A~{~A~A~A~3:*~A~A~A~A~}~A},
		Q{~A~{~A~A~A~A~4:*~^~A~A~A~A~}~A},
		Q{~A~{~A~A~A~A~v*~^~A~A~A~A~}~A},
		Q{~A~{~A~A~A~A~v:*~^~A~}~A},
		Q{~V:@A},
		Q{~V:@a},
		Q{~V:A},
		Q{~V:a},
		Q{~V@:A},
		Q{~V@:a},
		Q{~V@A},
		Q{~V@a},
		Q{~VA},
		Q{~Va},
		Q{~a},
		Q{~v,,2A},
		Q{~v:@A},
		Q{~v:@a},
		Q{~v:A},
		Q{~v:a},
		Q{~v@:A},
		Q{~v@:a},
		Q{~v@A},
		Q{~v@a},
		Q{~vA},
		Q{~va},
		Q{~{~2,#^~A~}~A},
		Q{~~~d:a},
		Q{~~~d@:A},
		Q{~~~d@a},
		Q{~~~da},
	;
	for @options -> $str {
		ok $fl._parse( $str ), $str;
	}
}

subtest {
	my @options =
		Q{~b},
		Q{~@b},
		Q{~~~db},
		Q{~~~d@b},
		Q{~v,vb},
		Q{~:b},
		Q{~,,v:b},
		Q{~,,V,V:b},
		Q{~,,v,v:@b},
		Q{~vb},
		Q{~,,v:b},
		Q{~:@b},
		Q{~#b},
		Q{~,,,#:b},
		Q{~+10b},
		Q{~-1b},
		Q{~vb},
		Q{~db},
		Q{~v,v,v,vb},
		Q{~B},
		Q{~@B},
		Q{~v,vB},
		Q{~:B},
		Q{~,,v:B},
		Q{~,,V,V@:B},
		Q{~@B},
		Q{~,,v,v:B},
		Q{~6,vB},
		Q{~,,'*,v:B},
		Q{~:B},
		Q{~@:B},
		Q{~#B},
		Q{~,,,#:B},
		Q{~,,,#@:B},
		Q{~+10@B},
		Q{~-1000000000000000000B},
		Q{~V,V,V,VB},
	;
	for @options -> $str {
		ok $fl._parse( $str ), $str;
	}
}

subtest {
	my @options =
		Q{~~~d,'~c~c},
		Q{~~,,'~c:~c},
		Q{~:c},
		Q{~@c},
		Q{'~c},
		Q{~~~d,'~c~c},
		Q{~~,,'~c:~c},
		Q{#\\~:c},
		Q{~c},
		Q{~@:c},
		Q{~~~d~c},
		Q{~~~d@~c},
		Q{~~~d,'~c~c},
		Q{~~,,'~c:~c},
		Q{~C},
		Q{~:C},
		Q{~@C},
		Q{~:@C},
		Q{~C},
		Q{~:C},
		Q{~@C},
		Q{~@:C},
	;
	for @options -> $str {
		ok $fl._parse( $str ), $str;
	}
}

subtest {
	my @options =
		Q{~@d},
		Q{~~~dd},
		Q{~d},
		Q{~~~dd},
		Q{~~~d@d},
		Q{~~~d,'~cd},
		Q{~v,vd},
		Q{~@d},
		Q{~v,v@d},
		Q{~:d},
		Q{~,,v:d},
		Q{~,,v:d},
		Q{~~,,'~c:d},
		Q{~,,v,v:d},
		Q{~@d},
		Q{~,,v,v:@d},
		Q{~,,v:d},
		Q{~,,'*,v:d},
		Q{~@d},
		Q{~@:d},
		Q{~#d},
		Q{~,,,#:d},
		Q{~,,,#:@d},
		Q{~+10d},
		Q{~+10@d},
		Q{~-1d},
		Q{~-1000000000000000000d},
		Q{~vd},
		Q{~dd},
		Q{~v,v,v,vd},
		Q{~,,,#@:D},
		Q{~v,v,v,vD},
		Q{~D},
		Q{~@D},
		Q{~v,vD},
		Q{~v,v@D},
		Q{~,,v,v:D},
		Q{~,,v,v:@D},
		Q{~vD},
		Q{~6,vD},
		Q{~#D},
		Q{~,,,#:D},
	;
	for @options -> $str {
		ok $fl._parse( $str ), $str;
	}
}

# XXX No ~e tests?

subtest {
	my @options =
		Q{~,,,,',f},
		Q{~,,,,VF},
		Q{~,,,,vf},
		Q{~,,,vF},
		Q{~,,2f},
		Q{~,,Vf},
		Q{~,,vf},
		Q{~,2F},
		Q{~,vf},
		Q{~0,0f},
		Q{~0f},
		Q{~1,1,,f},
		Q{~10,1,,,'*F},
		Q{~10,1,,,'*f},
		Q{~10,1,,f},
		Q{~2,1F},
		Q{~2,1f},
		Q{~2,2F},
		Q{~2,2f},
		Q{~2f},
		Q{~3,2F},
		Q{~3,2f},
		Q{~3@F},
		Q{~3F},
		Q{~3f},
		Q{~4,0,,'*f},
		Q{~4,2,-1F},
		Q{~4,2,-1f},
		Q{~4,2,0F},
		Q{~4,2,0f},
		Q{~4,2,1f},
		Q{~4,2@F},
		Q{~4,2@f},
		Q{~4,2F},
		Q{~4,2f},
		Q{~4@F},
		Q{~4@f},
		Q{~4F},
		Q{~4f},
		Q{~5,1,,'*F},
		Q{~5,1,,'*f},
		Q{~F},
		Q{~VF},
		Q{~f},
		Q{~v,v,v,v,vf},
		Q{~v,vf},
		Q{~vf},
		Q{~~,,,,'~cf},
	;
	for @options -> $str {
		ok $fl._parse( $str ), $str;
	}
}

# XXX No trailing-g tests?
# XXX No trailing-h tests?
# XXX No trailing-i tests?
# XXX No trailing-j tests?
# XXX No trailing-k tests?
# XXX No trailing-l tests?
# XXX No trailing-m tests?
# XXX No trailing-n tests?

subtest {
	my @options =
		Q{~#o},
		Q{~+10@O},
		Q{~+10o},
		Q{~,,'*,v:o},
		Q{~,,,#:@o},
		Q{~,,,#:o},
		Q{~,,,#@:O},
		Q{~,,V,v:O},
		Q{~,,v,V@:O},
		Q{~,,v,v:@o},
		Q{~,,v,v:O},
		Q{~,,v:o},
		Q{~-1000000000000000000o},
		Q{~-1O},
		Q{~6,vO},
		Q{~:@o},
		Q{~:O},
		Q{~:o},
		Q{~@:o},
		Q{~@O},
		Q{~@o},
		Q{~O},
		Q{~O},
		Q{~V,Vo},
		Q{~o},
		Q{~v,V@O},
		Q{~v,v,v,vo},
		Q{~v,v@o},
		Q{~v,vO},
		Q{~vO},
		Q{~vo},
		Q{~~~d@o},
		Q{~~~do},
	;
	for @options -> $str {
		ok $fl._parse( $str ), $str;
	}
}

subtest {
	my @options =
		Q{~@p},
		Q{~D cat~:p},
		Q{~D penn~:@p},
		Q{~D penn~@:p},
		Q{~p},
		Q{~@P},
		Q{~D cat~:P},
		Q{~D penn~:@P},
		Q{~D penn~@:P},
		Q{~P},
	;
	for @options -> $str {
		ok $fl._parse( $str ), $str;
	}
}

# XXX No trailing-q tests?

subtest {
	my @options =
		Q{~#r},
		Q{~+10r},
		Q{~10,#r},
		Q{~10,+8r},
		Q{~10,,,v:r},
		Q{~10,-1000000000000000r},
		Q{~10,-1r},
		Q{~10,0r},
		Q{~10,12,vr},
		Q{~10,vr},
		Q{~10,vr},
		Q{~10r},
		Q{~10r},
		Q{~16,,,,#:r},
		Q{~2,,,,1000000000000000000r},
		Q{~2,12,,'*:r},
		Q{~2:r},
		Q{~2r},
		Q{~3@:r},
		Q{~3r},
		Q{~8,10:@r},
		Q{~:@r},
		Q{~:r},
		Q{~@r},
		Q{~dr},
		Q{~r},
		Q{~v,v,v,v,vr},
		Q{~vr},
		Q{~~~D,~D,'*r},
		Q{~3,14,'X,',:R},
		Q{~8,,,,v:R},
		Q{~8@R},
		Q{~@:R},
		Q{~@R},
		Q{~~~D,~DR},
	;
	for @options -> $str {
		ok $fl._parse( $str ), $str;
	}
}

# ----------------------------------

# " ~v,vT"
# "'~c,"
# "(~:@{~A~:^,~})"
# "(~:{~A~:^,~})"
# "(~A ~A)"
# "A             ~_"
# "A ~:@_A ~:@_A ~:@_A ~:@_"
# "A ~:@_A ~:@_A ~:@_A ~:@_A ~:@_"
# "A ~:_A ~:_A ~:_A ~:_A ~:_"
# "A ~:_A ~:_A ~:_A ~:_A ~:_A ~:_A ~:_A ~:_A ~:_A ~:_"
# "A ~@:_A "
# "A ~@:_A ~@:_A ~@:_A ~@:_"
# "A ~@_A ~@_A ~@_A ~@_"
# "A ~@_A ~@_A ~@_A ~@_A ~@_"
# "A ~@_A ~@_A ~@_A ~@_A ~@_A ~@_A ~@_A ~@_A ~@_A ~@_"
# "A ~_A ~_A ~_A ~_"
# "A ~_A ~_A ~_A ~_A ~_"
# "A ~_A ~_A ~_A ~_A ~_A ~_A ~_A ~_A ~_A ~_"
# "A ~_A ~_A ~_A ~_~%A ~_A ~_A ~_A ~_"
# "AAAA ~:@_"
# "AAAA ~_"
# "B ~_"
# "B ~_"
# "D ~_"
# "X"
# "XXXXX~2,0T"
# "XXX~<MMM~-1I~:@_MMMMM~:>"
# "XXX~<MMM~1I~:@_MMMMM~:>"
# "XXX~<MMM~I~:@_MMMMM~:>"
# "XXX~<MMM~vI~:@_MMMMM~:>"
# "XXX~<MMM~vI~:@_MMMMM~:>"
# "XX~10,20:@tYY"
# "XX~10,20@:tYY"
# "XX~10:tYY"
# "X~#%"
# "X~#%"
# "X~%~&"
# "X~&"
# "X~AY"
# "X~V%"
# "X~v&"
# "X~~~D&"
# "a~?z"
# "a~@?z"
# "~#%"
# "~#%"
# "~#&"
# "~#&"
# "~#:@{A~:}"
# "~#:{~A~}"
# "~#@{~A~}"
# "~#X"
# "~#[A~:;B~]"
# "~#[A~;B~]"
# "~#x"
# "~#{~A~}"
# "~#{~}"
# "~#~"
# "~%"
# "~%A~@_"
# "~%X ~,,1<~%X ~:;AAA~;BBB~;CCC~>"
# "~%X ~<~%X ~0,30:;AAA~>~<~%X ~0,30:;BBB~>~<~%X ~0,30:;CCC~>"
# "~%X ~<~%X ~0,3:;AAA~>,~<~%X ~0,3:;BBB~>,~<~%X ~0,3:;CCC~>"
# "~%X ~<~%X ~0,3:;AAA~>~<~%X ~0,3:;BBB~>~<~%X ~0,3:;CCC~>"
# "~&"
# "~',@/cl-test::function-for-format-slash-19/"
# "~'X:/cl-test::function-for-format-slash-19/"
# "~(XXyy~AuuVV~)"
# "~(aBc ~(def~) GHi~)"
# "~(aBc ~:(def~) GHi~)"
# "~(aBc ~@(def~) GHi~)"
# "~(~c~)"
# "~+10@X"
# "~+10x"
# "~,,'*,v:x"
# "~,,,#:X"
# "~,,,#:x"
# "~,,,#@:X"
# "~,,1,',<~A~;~A~>"
# "~,,1,v<~A~;~A~>"
# "~,,1,v<~A~;~A~>"
# "~,,1<~A~;~A~>"
# "~,,2<~A~;~A~>"
# "~,,V:x"
# "~,,v,V:@x"
# "~,,v,v:@x"
# "~,,v,v:X"
# "~,,v,v:X"
# "~,,v:X"
# "~,,v:x"
# "~,,v<~A~;~A~>"
# "~,v<~A~;~A~>"
# "~,v<~A~>"
# "~-1000000000000000000x"
# "~-1@/cl-test::function-for-format-slash-19/"
# "~-1X"
# "~-1[a~;b~;c~;d~]"
# "~/CL-TEST::FUNCTION-FOR-FORMAT-SLASH-9/"
# "~/PPRINT-LINEAR/"
# "~/cL-tESt:FUNCTION:FOR::FORMAT:SLASH:11/"
# "~/cl-test::function-for-format-slash-19/"
# "~/cl-test:FUNCTION-FOR-FORMAT-SLASH-10/"
# "~/pPrINt-lINeaR/"
# "~/pprint-linear/"
# "~0&"
# "~0,0T"
# "~0,1T"
# "~0,vT"
# "~0:@{~A~:}"
# "~0:{XYZ~}"
# "~0@{~A~^~A~}"
# "~0[a~;b~;c~;d~]"
# "~0{FOO~:}"
# "~0{~A~^~A~}"
# "~0{~}"
# "~0{~}"
# "~0|"
# "~1,0T"
# "~1,1@t"
# "~1,2,3,4,5,6,7,8,9,10@/cl-test::function-for-format-slash-19/"
# "~10,,,v@S"
# "~10,,,v@s"
# "~10,,,vS"
# "~10,,,vs"
# "~100000000000000000000000000000000[a~;b~;c~;d~]"
# "~10:<abcdef~>"
# "~10:@<abcdef~>"
# "~10@<abcdef~>"
# "~13,,2<aaa~;bbb~;ccc~>"
# "~18@:/cl-test::function-for-format-slash-19/"
# "~1@{FOO~}"
# "~1@{~A~^~A~}"
# "~1[a~;b~;c~;d~]"
# "~1{FOO~:}"
# "~1{~A~^~A~}"
# "~1{~}"
# "~1{~}"
# "~2:{XYZ~}"
# "~2:{~A~}"
# "~2{FOO~:}"
# "~2{FOO~}"
# "~3,,+2S"
# "~3,,-1S"
# "~3,,0S"
# "~3,,V@S"
# "~3,,vS"
# "~3,,vs"
# "~3,1s"
# "~3,3@s"
# "~3{~}"
# "~4,,,'X@s"
# "~4,,,'XS"
# "~4,,,@S"
# "~4,,,s"
# "~4,,vs"
# "~4,3s"
# "~4,4@s"
# "~4@<~>"
# "~4[a~;b~;c~;d~]"
# "~5,3@s"
# "~5,3S"
# "~5,v@S"
# "~5,vS"
# "~5,vS"
# "~5:@<~>"
# "~6,vX"
# "~6:<~>"
# "~6<abc~;def~^~>"
# "~6@<abc~;def~^~>"
# "~7,3@s"
# "~7,3S"
# "~:(aBc ~(def~) GHi~)"
# "~:(aBc ~:(def~) GHi~)"
# "~:(aBc ~@(def~) GHi~)"
# "~:(aBc ~@:(def~) GHi~)"
# "~:(this is a TEST.~)"
# "~:(this is7a TEST.~)"
# "~:/cl-test::function-for-format-slash-19/"
# "~:/pprint-linear/"
# "~:<MMM~I~:@_MMMMM~:>"
# "~:<M~-1:i~:@_M~:>"
# "~:<M~-2:i~:@_M~:>"
# "~:<M~1:I~@:_M~:>"
# "~:<[~;~@{~A~^/~}~:>"
# "~:<[~;~@{~A~^/~}~;]~:>"
# "~:<~;~@{~A~^/~}~;]~:>"
# "~:<~@{~A~^ ~}~:>"
# "~:<~@{~A~^*~}~:>"
# "~:<~A~:>"
# "~:@(aBc ~(def~) GHi~)"
# "~:@(aBc ~@(def~) GHi~)"
# "~:@(this is AlSo A teSt~)"
# "~:@/cl-test::function-for-format-slash-19/"
# "~:@<**~@;~@{~A~^       ~}~:@>"
# "~:@<~@{~A~^            ~:_~}~:>"
# "~:@<~@{~A~^            ~}~:@>"
# "~:@<~@{~A~^ ~_~}~:>"
# "~:@<~@{~A~^ ~}~:@>"
# "~:@<~@{~A~^/~
# "~:@<~@{~A~^~}~:@>"
# "~:@<~A~:>"
# "~:@x"
# "~:@{(~A ~A)~}"
# "~:@{~#,#,#:^~A~}"
# "~:@{~#,#,#^~A~}"
# "~:@{~#,#,2:^~A~}"
# "~:@{~#,#,3^~A~}"
# "~:@{~#,#:^~A~}"
# "~:@{~#,#:^~A~}"
# "~:@{~#,#^~A~}"
# "~:@{~#,1:^~A~}"
# "~:@{~#,1^~A~}"
# "~:@{~#,2,#:^~A~}"
# "~:@{~#,2,2:^~A~}"
# "~:@{~#,3,#^~A~}"
# "~:@{~#,3,3^~A~}"
# "~:@{~#,v:^~A~}"
# "~:@{~#:^~A~}"
# "~:@{~#^~A~}"
# "~:@{~'X,'X:^~A~}"
# "~:@{~'X,'Y:^~A~}"
# "~:@{~'X:^~A~}"
# "~:@{~'x,'x^~A~}"
# "~:@{~'x,3^~A~}"
# "~:@{~0,1:^~A~}"
# "~:@{~0,3,#^~A~}"
# "~:@{~0,v^~A~}"
# "~:@{~0:^~A~}"
# "~:@{~1,#:^~A~}"
# "~:@{~1,#^~A~}"
# "~:@{~1,0,1^~A~}"
# "~:@{~1,1,1^~A~}"
# "~:@{~1,1,v:^~A~}"
# "~:@{~1,1:^~A~}"
# "~:@{~1,2,1:^~A~}"
# "~:@{~1,2,1^~A~}"
# "~:@{~1,2,3:^~A~}"
# "~:@{~1,2,3^~A~}"
# "~:@{~1,2,v^~A~}"
# "~:@{~1,3,#:^~A~}"
# "~:@{~1,V:^~A~}"
# "~:@{~1,v,2:^~A~}"
# "~:@{~1,v,3^~A~}"
# "~:@{~1,v,v^~A~}"
# "~:@{~1,v^~A~}"
# "~:@{~1:^~A~}"
# "~:@{~2,#,3:^~A~}"
# "~:@{~2,#,3^~A~}"
# "~:@{~2,1,3:^~A~}"
# "~:@{~2,V,v:^~A~}"
# "~:@{~2,v^~A~}"
# "~:@{~3,#,#:^~A~}"
# "~:@{~3,#,#^~A~}"
# "~:@{~3,'x^~A~}"
# "~:@{~3,2,1^~A~}"
# "~:@{~:^~A~}"
# "~:@{~:^~A~}"
# "~:@{~A~:}"
# "~:@{~A~^~A~A~}"
# "~:@{~A~}"
# "~:@{~V,#:^~A~}"
# "~:@{~V,v,3:^~A~}"
# "~:@{~V,v:^~A~}"
# "~:@{~V:^~A~}"
# "~:@{~v,1,v^~A~}"
# "~:@{~v,1:^~A~}"
# "~:@{~v,2,2:^~A~}"
# "~:@{~v,2,3^~A~}"
# "~:@{~v,2,v:^~A~}"
# "~:@{~v,3^~A~}"
# "~:@{~v,3^~A~}"
# "~:@{~v,v,V:^~A~}"
# "~:@{~v,v^~A~}"
# "~:@{~v,v^~A~}"
# "~:@{~v:^~A~}"
# "~:@{~v^~A~}"
# "~:@{~v^~A~}"
# "~:@{~v^~A~}"
# "~:@{~}"
# "~:@{~}"
# "~:X"
# "~:[a~;b~]"
# "~:s"
# "~:x"
# "~:{(~A ~A)~}"
# "~:{ABC~:}"
# "~:{~#,#,#:^~A~}"
# "~:{~#,#,#^~A~}"
# "~:{~#,#,2:^~A~}"
# "~:{~#,#,3^~A~}"
# "~:{~#,#:^~A~}"
# "~:{~#,#^~A~}"
# "~:{~#,1:^~A~}"
# "~:{~#,1^~A~}"
# "~:{~#,2,#:^~A~}"
# "~:{~#,2,2:^~A~}"
# "~:{~#,3,#^~A~}"
# "~:{~#,3,3^~A~}"
# "~:{~#,v:^~A~}"
# "~:{~#:^~A~}"
# "~:{~#^~A~#^~A~#^~A~#^~A~}"
# "~:{~#^~A~}"
# "~:{~'X,'X:^~A~}"
# "~:{~'X,'Y:^~A~}"
# "~:{~'X:^~A~}"
# "~:{~'x,'x^~A~}"
# "~:{~'x,3^~A~}"
# "~:{~0,1:^~A~}"
# "~:{~0,3,#^~A~}"
# "~:{~0,v^~A~}"
# "~:{~0:^~A~}"
# "~:{~1,#:^~A~}"
# "~:{~1,#^~A~}"
# "~:{~1,0,1^~A~}"
# "~:{~1,1,1^~A~}"
# "~:{~1,1,v:^~A~}"
# "~:{~1,1:^~A~}"
# "~:{~1,2,1:^~A~}"
# "~:{~1,2,1^~A~}"
# "~:{~1,2,3:^~A~}"
# "~:{~1,2,3^~A~}"
# "~:{~1,2,v^~A~}"
# "~:{~1,2,v^~A~}"
# "~:{~1,3,#:^~A~}"
# "~:{~1,V:^~A~}"
# "~:{~1,v,2:^~A~}"
# "~:{~1,v,3^~A~}"
# "~:{~1,v,v^~A~}"
# "~:{~1,v^~A~}"
# "~:{~1:^~A~}"
# "~:{~2,#,3:^~A~}"
# "~:{~2,#,3^~A~}"
# "~:{~2,1,3:^~A~}"
# "~:{~2,V,v:^~A~}"
# "~:{~2,v^~A~}"
# "~:{~3,#,#:^~A~}"
# "~:{~3,#,#^~A~}"
# "~:{~3,'x^~A~}"
# "~:{~3,2,1^~A~}"
# "~:{~3,v^~A~}"
# "~:{~:^~A~}"
# "~:{~:^~A~}"
# "~:{~A~0^~A~A~}"
# "~:{~A~:}"
# "~:{~A~^~A~A~}"
# "~:{~V,#:^~A~}"
# "~:{~V,v,3:^~A~}"
# "~:{~V,v:^~A~}"
# "~:{~V:^~A~}"
# "~:{~v,1,v^~A~}"
# "~:{~v,1:^~A~}"
# "~:{~v,2,2:^~A~}"
# "~:{~v,2,3^~A~}"
# "~:{~v,2,v:^~A~}"
# "~:{~v,3^~A~}"
# "~:{~v,3^~A~}"
# "~:{~v,v,V:^~A~}"
# "~:{~v,v^~A~}"
# "~:{~v:^~A~}"
# "~:{~v^~A~}"
# "~:{~}"
# "~<(~;M~-1:i~:@_M~;)~:>"
# "~<(~;M~:I~:@_M~;)~:>"
# "~<(~;M~v:i~:@_M~;)~:>"
# "~<ABC~;~v,0:T~;DEF~:>"
# "~<MMM~1I~:@_MMMMM~:>"
# "~<MMM~I~:@_MMMMM~:>"
# "~<M~3:i~:@_M~:>"
# "~<M~:i~:@_M~:>"
# "~<XXXXXX~;YYYYYYY~^~;ZZZZZ~>"
# "~<XXXXXX~;YYYYYYY~^~>"
# "~<XXXXXX~^~>"
# "~<XXXX~;~v,1:@t~:>"
# "~<XXX~;~,1:@t~;YYY~:>"
# "~<XXX~;~1,1:@t~;YYY~:>"
# "~<XXX~;~1,:@t~;YYY~:>"
# "~<XXX~;~1:@t~;YYY~:>"
# "~<XXX~;~:@t~;YYY~:>"
# "~<X~;~0,v:T~;Y~:>"
# "~<[~;XXXX~2,0:T~;]~:>"
# "~<[~;~,0:T~;]~:>"
# "~<[~;~0,0:T~;]~:>"
# "~<[~;~0,1:T~;]~:>"
# "~<[~;~0,:T~;]~:>"
# "~<[~;~0:T~;]~:>"
# "~<[~;~1,0:T~;]~:>"
# "~<[~;~2,0:T~;]~:>"
# "~<~/pprint-tabular/~:>"
# "~<~4:/pprint-tabular/~:>"
# "~<~:/pprint-tabular/~:>"
# "~<~:@/pprint-tabular/~:>"
# "~<~;~A~:>"
# "~<~;~A~;~:>"
# "~<~<XXXXXX~;YYYYYYY~^~>~>"
# "~<~<~A~^xxx~:>yyy~:>"
# "~<~>"
# "~<~@/pprint-tabular/~:>"
# "~<~@{~A~^*~}~:>"
# "~<~A~:>"
# "~<~A~;~A~>"
# "~<~A~>"
# "~<~A~^xxxx~:>"
# "~<~v:/pprint-tabular/~:>"
# "~<~v:/pprint-tabular/~:>"
# "~?"
# "~@(!@#$%^&*this is a TEST.~)"
# "~@(aBc ~(def~) GHi~)"
# "~@(aBc ~:(def~) GHi~)"
# "~@(aBc ~@(def~) GHi~)"
# "~@(aBc ~@:(def~) GHi~)"
# "~@(this is a TEST.~)"
# "~@/cl-test::function-for-format-slash-19/"
# "~@/pprint-linear/"
# "~@:(aBc ~:(def~) GHi~)"
# "~@:(aBc ~@:(def~) GHi~)"
# "~@:(~c~)"
# "~@:(~c~)"
# "~@:/cl-test::function-for-format-slash-19/"
# "~@:/pprint-linear/"
# "~@:<~@{~A~^ ~:_~}~:>"
# "~@:<~@{~A~^ ~}~:>"
# "~@:<~A~:>"
# "~@:x"
# "~@:{~#^~A~#^~A~#^~A~#^~A~}"
# "~@:{~3,v^~A~}"
# "~@:{~A~0^~A~A~}"
# "~@<**~@;~@{~A~^       ~}~:@>"
# "~@<**~@;~@{~A~^       ~}~;XX~:@>"
# "~@<~;~A~:>"
# "~@<~;~A~;~:>"
# "~@<~@{~A~^ ~_~}~:>"
# "~@<~@{~A~^*~}~:>"
# "~@<~A~:>"
# "~@?"
# "~@S"
# "~@X"
# "~@_A~%"
# "~@x"
# "~@{ ~}"
# "~@{X ~A Y Z~}"
# "~@{X ~A~^ Y ~A~^ ~}"
# "~@{X~:}"
# "~@{~#,#,#^~A~}"
# "~@{~#,#,v^~A~}"
# "~@{~#,#^~A~}"
# "~@{~#,1,2^~A~}"
# "~@{~#,3^~A~}"
# "~@{~',,',^~A~}"
# "~@{~'X,v^~A~}"
# "~@{~'X^~A~}"
# "~@{~0,v,v^~A~}"
# "~@{~0,v,v^~A~}"
# "~@{~0,v^~A~}"
# "~@{~1,1,v^~A~}"
# "~@{~1,2,v^~A~}"
# "~@{~1,v,v^~A~}"
# "~@{~1,v^~A~}"
# "~@{~1{~A~}~}"
# "~@{~A~A~0^~A~}"
# "~@{~A~A~v^~A~}"
# "~@{~A~}"
# "~@{~v,'X^~A~}"
# "~@{~v,1,v^~A~}"
# "~@{~v,v,v^~A~}"
# "~@{~v,v^~A~}"
# "~@{~v,v^~A~}"
# "~@{~{~A~}~}"
# "~@{~}"
# "~@{~}"
# "~A~<~A~v,v:t~:>"
# "~A~<~v,v:@t~:>"
# "~A~v,vt"
# "~A~~<~A~~~D,~D:T~~:>"
# "~A~~~D,~DT"
# "~S"
# "~S"
# "~V%"
# "~V&"
# "~V&"
# "~V,,2s"
# "~V,vx"
# "~V:@{~A~}"
# "~V:s"
# "~V:{X~}"
# "~V@:s"
# "~V@:{~A~}"
# "~V[a~;b~;c~;d~;e~;f~;g~;h~;i~]"
# "~V{FOO~:}"
# "~V{~A~}"
# "~V{~}"
# "~V|"
# "~V~"
# "~W~W~:_~W~W~:_~W~W~:_~W~W~:_~W~W~:_"
# "~X" i
# "~[a~:;b~]"
# "~[a~;b~;c~;d~:;e~]"
# "~[a~;b~;c~;d~;e~;f~;g~;h~;i~]"
# "~[a~]"
# "~[~:;a~]"
# "~[~]"
# "~d,"
# "~dx"
# "~s"
# "~v&"
# "~v,,,v<~A~>"
# "~v,,2S"
# "~v,,v<~A~>"
# "~v,0T"
# "~v,1@T~0,v@t"
# "~v,1@t"
# "~v,V@X"
# "~v,v,v,v,v,v,v,v,v,v@/cl-test::function-for-format-slash-19/"
# "~v,v,v,vx"
# "~v,v@t"
# "~v,v@x"
# "~v,vX"
# "~v/cl-test::function-for-format-slash-19/"
# "~v:@s"
# "~v:@s"
# "~v:@{~A~}"
# "~v:S"
# "~v:S"
# "~v:{ABC~:}"
# "~v:{~A~:}"
# "~v:{~A~}"
# "~v<~A~>"
# "~v@:s"
# "~v@S"
# "~v@{~A~}"
# "~v@{~}"
# "~vS"
# "~v[a~;b~;c~;d~:;e~]"
# "~v[a~;b~;c~;d~;e~;f~;g~;h~;i~]"
# "~vx"
# "~v{~A~}"
# "~v{~a~}"
# "~v|"
# "~v~"
# "~x"
# "~{ ~}"
# "~{FOO~:}"
# "~{X Y Z~}"
# "~{X ~A~^ Y ~A~^ ~}"
# "~{~#,#,#^~A~}"
# "~{~#,#,v^~A~}"
# "~{~#,#^~A~}"
# "~{~#,1,2^~A~}"
# "~{~#,3^~A~}"
# "~{~',,',^~A~}"
# "~{~'X,v^~A~}"
# "~{~'X^~A~}"
# "~{~(~C~C~0^~C~)W~}"
# "~{~0,v,v^~A~}"
# "~{~0,v^~A~}"
# "~{~1,1,v^~A~}"
# "~{~1,2,v^~A~}"
# "~{~1,v,v^~A~}"
# "~{~1,v^~A~}"
# "~{~1{~A~}~}"
# "~{~:(~C~C~0^~C~)U~}"
# "~{~@(~CA ~Cb ~0^~C~)V~}"
# "~{~@:(~CA ~Cb ~0^~C~)W~}"
# "~{~A~:}"
# "~{~A~@?~A~}"
# "~{~A~A~0^~A~}"
# "~{~A~A~v^~A~}"
# "~{~A~}"
# "~{~[X~;Y~0^NO~;Z~;~^~]~}"
# "~{~[X~;Y~;Z~:;~0^~]~}"
# "~{~[X~;Y~;Z~;~0^~]~}"
# "~{~v,'X^~A~}"
# "~{~v,1,v^~A~}"
# "~{~v,v,v^~A~}"
# "~{~v,v^~A~}"
# "~{~v,v^~A~}"
# "~{~{~A~}~}"
# "~{~}"
# "~|"
# "~~"
# "~~~D%"
# "~~~D&"
# "~~~D|"
# "~~~D~~"
# "~~~d,"
# "~~~d,,,'~c,~d:R"
# "~~~d,,,'~c<~~A~~>"
# "~~~d,~d@t"
# "~~~d:R"
# "~~~d:s"
# "~~~d@:S"
# "~~~d@s"
# "~~~dR"
# "~~~dS"
# (signals-error (format nil "~:@{~A ~A~}" '(x . y)) type-error)
# (signals-error (format nil "~:{~A~}" '("X")) type-error)
# (signals-error (format nil "~:{~A~}" '(#(X Y Z))) type-error)
# (signals-error (format nil "~:{~A~}" '((x) . y)) type-error)
# (signals-error (format nil "~:{~A~}" '(x)) type-error)
# (signals-error (format nil "~{~A~}" '(x y . z)) type-error)
# (signals-error-always (format nil "1~<X~<Y~:>Z~>2" nil nil nil) error)
# (signals-error-always (format nil "AAAA~1,1:TBBB~<XXX~:;YYY~>ZZZ"
# (signals-error-always (format nil "~:<foo~;~A~;bar~A~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~:<foo~@;~A~;bar~A~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~:<foo~A~;~A~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~:<foo~A~;~A~;bar~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~:<foo~A~@;~A~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~:<foo~A~@;~A~;bar~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~:<~;~A~;bar~A~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~:<~@;~A~;bar~A~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~< ~W ~>" nil) error)
# (signals-error-always (format nil "~< ~_ ~>") error)
# (signals-error-always (format nil "~< ~i ~>") error)
# (signals-error-always (format nil "~<XXX~1,1:TYYY~>"
# (signals-error-always (format nil "~<XXX~:;YYY~>ZZZ~4,5:tWWW"
# (signals-error-always (format nil "~<X~:;Y~>~I") error)
# (signals-error-always (format nil "~<X~:;Y~>~W" nil) error)
# (signals-error-always (format nil "~<X~:;Y~>~_") error)
# (signals-error-always (format nil "~<foo~;~A~;bar~A~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~<foo~@;~A~;bar~A~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~<foo~A~;~A~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~<foo~A~;~A~;bar~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~<foo~A~@;~A~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~<foo~A~@;~A~;bar~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~<~:;~>~<~:>" nil nil nil) error)
# (signals-error-always (format nil "~<~:>~<~:;~>" nil nil nil) error)
# (signals-error-always (format nil "~<~;~A~;bar~A~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~<~@;~A~;bar~A~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~@<foo~;~A~;bar~A~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~@<foo~@;~A~;bar~A~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~@<foo~A~;~A~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~@<foo~A~;~A~;bar~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~@<foo~A~@;~A~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~@<foo~A~@;~A~;bar~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~@<~;~A~;bar~A~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~@<~@;~A~;bar~A~:>" '(X) '(Y)) error)
# (signals-error-always (format nil "~_~<X~:;Y~>") error)
# (signals-error-always (format nil "~i~<X~:;Y~>") error)
# (signals-error-always (format nil "~w~<X~:;Y~>" nil) error)
# (signals-type-error x "abc" (format nil "~:@{~A~}" x))
# (signals-type-error x "foo" (format nil "~{~A~}" x))
# (signals-type-error x #*01101 (format nil "~:@{~A~}" x))
# (signals-type-error x #*01101 (format nil "~{~A~}" x))
# (signals-type-error x 'A (format nil "~{~A~}" x))
# (signals-type-error x 'x (format nil "~:@{~A~}" x))
# (signals-type-error x 'x (format nil "~:{~A~}" x))
# (signals-type-error x 0 (format nil "~:@{~A~}" x))
# (signals-type-error x 1 (format nil "~{~A~}" x))
# ~}~:@>"
