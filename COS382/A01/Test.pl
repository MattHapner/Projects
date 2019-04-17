use strict;
use warnings;

print "***** RegEx in Perl *****\n\n";

my $filename = $ARGV[0];

open(my $fh, '<:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";

my $regex = qr`^(\d( )+)?[a-zA-Z]+(( )+(\d+(:( )*\d+|,( )*\d+|;( )*\d+|-{1,2}( )*\d+|)*))?(( )+\([a-zA-Z]+\))?$`mp;

while (my $row = <$fh>) {
    chomp $row;

    if ($row =~ /$regex/g) {
        print "Valid: $row\n";
    } else {
        print "Invalid: $row\n"
    }
}