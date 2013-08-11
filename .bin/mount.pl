#!/usr/bin/perl

use strict;
use warnings;

use IPC::System::Simple qw(capture system);

my ($volume, $ip_regex) = @ARGV;
my @mounts = capture('mount');
my ($bad_mount) = grep { /$ip_regex/ } grep { /$volume/ } @mounts;
if ($bad_mount) {
    system("umount -l $volume");
}
