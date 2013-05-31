#!/usr/bin/perl
use strict;
use warnings;

my $ifconfig = `ifconfig`;
my $i = 0;
my @ipaddress;
while ($ifconfig =~ m/(\d+|\d)\.(\d+|\d)\.(\d+|\d)\.(\d+|\d)/g) {
#  print "$&\n";
  $ipaddress[$i] = $&;
  $i++;
}
my $user = `whoami`;
my $pwd = `pwd`;
chomp($user);
chomp($pwd);
foreach(@ipaddress){
  unless($ARGV[0]){
    $ARGV[0] = '';
  }
  print "rsync -avz -P ".$user."@".$_.":".$pwd."/".$ARGV[0]."\n";
}
