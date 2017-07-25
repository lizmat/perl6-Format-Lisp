use v6;

use Test;
use lib 't/lib';
use Utils;
use Format::Lisp;

my $fl = Format::Lisp.new;

# (def-format-test format.?.1
#   "~?" ("" nil) "")
# 
is $fl.format( Q{~?}, '', Nil ), Q{}, 'format.?.1';

#`(
# (def-format-test format.?.2
#   "~?" ("~A" '(1)) "1")
# 
)

#`(
# (def-format-test format.?.3
#   "~?" ("" '(1)) "")
# 
)

#`(
# (def-format-test format.?.4
#   "~? ~A" ("" '(1) 2) " 2")
# 
)

#`(
# (def-format-test format.?.5
#   "a~?z" ("b~?y" '("c~?x" ("~A" (1)))) "abc1xyz")
# 
)

# ;;; Tests of ~@?
# 
#`(
# (def-format-test format.@?.1
#   "~@?" ("") "")
# 
)

#`(
# (def-format-test format.@?.2
#   "~@?" ("~A" 1) "1")
# 
)

#`(
# (def-format-test format.@?.3
#   "~@? ~A" ("<~A>" 1 2) "<1> 2")
# 
)

#`(
# (def-format-test format.@?.4
#   "a~@?z" ("b~@?y" "c~@?x" "~A" 1) "abc1xyz")
# 
)

#`(
# (def-format-test format.@?.5
#   "~{~A~@?~A~}" ('(1 "~4*" 2 3 4 5 6)) "16")
# 
)

done-testing;
