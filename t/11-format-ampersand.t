use v6;

use Test;
use lib 't/lib';
use Utils;
use Format::Lisp;

my $fl = Format::Lisp.new;

#`(
subtest {
#`(
	is $fl.format( Q{X~~~D&}, 4 ), Q{X~4&}, 'non-nil';
)
}, 'missing coverage';
)

# (def-format-test format.&.1
#   "~0&" nil "")
# 
is $fl.format( Q{~0&} ), Q{}, 'format.&.1';

# (def-format-test format.&.2
#   "~&" nil "")
# 
is $fl.format( Q{~&} ), Q{}, 'format.&.2';

#`(
# (def-format-test format.&.3
#   "X~&" nil #.(concatenate 'string "X" (string #\Newline)))
# 
is $fl.format( Q{X~&} ), qq{X\n}, 'format.&.3';
)

# (def-format-test format.&.4
#   "X~%~&" nil #.(concatenate 'string "X" (string #\Newline)))
# 
is $fl.format( Q{X~%~&} ), qq{X\n}, 'format.&.4';

#`(
# (deftest format.&.5
#   (loop for i from 1 to 100
#         for s1 = (make-string (1- i) :initial-element #\Newline)
#         for format-string = (format nil "~~~D&" i)
#         for s2 = (format nil format-string)
#         unless (string= s1 s2)
#         collect i)
#   nil)
# 
is do {
	my @collected;
	for 1 .. 100 -> $i {
		my $s1 = "\n" xx ( $i - 1 );
		my $format-string = $fl.format( "~~~D&", $i );
		my $s2 = $fl.format( $format-string );
		unless $s1 eq $s2 {
			@collected.append( $i );
		}
	}
	@collected.elems;
}, 0, 'format.&.5';
)

#`(
# (deftest formatter.&.5
#   (loop for i from 1 to 100
#         for s1 = (make-string (1- i) :initial-element #\Newline)
#         for format-string = (format nil "~~~D&" i)
#         for fn = (eval `(formatter ,format-string))
#         for s2 = (formatter-call-to-string fn)
#         unless (string= s1 s2)
#         collect i)
#   nil)
# 
is do {
	my @collected;
	for 1 .. 100 -> $i {
		my $s1 = "\n" xx ( $i - 1 );
		my $format-string = $fl.format( "~~~D&", $i );
		my $fn = $fl.formatter( $format-string );
		my $s2 = $fl.formatter-call-to-string( $fn );
		unless $s1 eq $s2 {
			@collected.append( $i );
		}
	}
	@collected.elems;
}, 0, 'formatter.&.5';
)

#`(
# (deftest format.&.6
#   (loop for i from 1 to 100
#         for s1 = (concatenate 'string
#                               "X"
#                               (make-string i :initial-element #\Newline))
#         for format-string = (format nil "X~~~D&" i)
#         for s2 = (format nil format-string)
#         unless (string= s1 s2)
#         collect i)
#   nil)
# 
is do {
	my @collected;
	for 1 .. 100 -> $i {
		my $s1 = 'X' ~ ( "\n" xx ( $i - 1 ) );
		my $format-string = $fl.format( "X~~~D&", $i );
		my $s2 = $fl.format( $format-string );
		unless $s1 eq $s2 {
			@collected.append( $i );
		}
	}
	@collected.elems;
}, 0, 'format.&.6';
)

#`(
# (deftest formatter.&.6
#   (loop for i from 1 to 100
#         for s1 = (concatenate 'string
#                               "X"
#                               (make-string i :initial-element #\Newline))
#         for format-string = (format nil "X~~~D&" i)
#         for fn = (eval `(formatter ,format-string))
#         for s2 = (formatter-call-to-string fn)
#         unless (string= s1 s2)
#         collect i)
#   nil)
# 
is do {
	my @collected;
	for 1 .. 100 -> $i {
		my $s1 = 'X' ~ ( "\n" xx ( $i - 1 ) );
		my $format-string = $fl.format( "X~~~D&", $i );
		my $fn = $fl.formatter( $format-string );
		my $s2 = $fl.formatter-call-to-string( $fn );
		unless $s1 eq $s2 {
			@collected.append( $i );
		}
	}
	@collected.elems;
}, 0, 'formatter.&.6';
)

# (def-format-test format.&.7
#   "~v&" (nil) "")
# 
is $fl.format( Q{~v&}, Nil ), Q{}, 'format.&.7';

#`(
# (def-format-test format.&.8
#   "X~v&" (nil) #.(concatenate 'string "X" (string #\Newline)))
# 
is $fl.format( Q{X~v&}, Nil ), qq{X\n}, 'format.&.8';
)

#`(
# (deftest format.&.9
#   (loop for i from 1 to 100
#         for s1 = (make-string (1- i) :initial-element #\Newline)
#         for s2 = (format nil "~V&" i)
#         unless (string= s1 s2)
#         collect i)
#   nil)
# 
is do {
	my @collected;
	for 1 .. 100 -> $i {
		my $s1 = "\n" xx ( $i - 1 );
		my $s2 = $fl.format( "~V&", $i );
		unless $s1 eq $s2 {
			@collected.append( $i );
		}
	}
	@collected.elems;
}, 0, 'format.&.9';
)

#`(
# (deftest formatter.&.9
#   (let ((fn (formatter "~V&")))
#     (loop for i from 1 to 100
#           for s1 = (make-string (1- i) :initial-element #\Newline)
#           for s2 = (formatter-call-to-string fn i)
#           unless (string= s1 s2)
#           collect i))
#   nil)
# 
is do {
	my @collected;
	my $fn = $fl.formatter( "~V&" );
	for 1 .. 100 -> $i {
		my $s1 = "\n" xx ( $i - 1 );
		my $s2 = $fl.formatter-call-to-string( $fn, $i );
		unless $s1 eq $s2 {
			@collected.append( $i );
		}
	}
	@collected.elems;
}, 0, 'formatter.&.9';
)

#`(
# (deftest format.&.10
#   (loop for i from 1 to (min (- call-arguments-limit 3) 100)
#         for s1 = (make-string (1- i) :initial-element #\Newline)
#         for args = (make-list i)
#         for s2 = (apply #'format nil "~#&" args)
#         unless (string= s1 s2)
#         collect i)
#   nil)
# 
)

#`(
# (deftest formatter.&.10
#   (let ((fn (formatter "~#&")))
#     (loop for i from 1 to (min (- call-arguments-limit 3) 100)
#           for s1 = (make-string (1- i) :initial-element #\Newline)
#           for args = (loop for j below i collect j)
#           for s2 = (with-output-to-string
#                      (stream)
#                      (assert (equal (apply fn stream args) args)))
#           unless (string= s1 s2)
#           collect i))
#   nil)
# 
)

# (def-format-test format.&.11
#   "X~V%" (0) "X")
# 
is $fl.format( Q{X~V&}, 0 ), Q{X}, 'format.&.11';

# (def-format-test format.&.12
#   "X~#%" nil "X")
# 
is $fl.format( Q{X~#%} ), Q{X}, 'format.&.12';

#`(
# (def-format-test format.&.13
#   "X~#%" ('a 'b 'c) #.(let ((nl (string #\Newline)))
#                         (concatenate 'string "X" nl nl nl))
#   3)
#
is $fl.format( Q{X~#%}, 'a', 'b', 'c' ), qq{X\n\n\n}, 'format.&.1';
)

done-testing;

# vim: ft=perl6
