use strict;
use warnings;

my $running_count=`bjobs -r -q alignment | wc -l`; chomp $running_count;
my $alignment_pending=`bjobs -q alignment | grep PEND | wc -l`; chomp $alignment_pending;
my $apipe_pending=`bjobs -q apipe | grep PEND | wc -l`; chomp $apipe_pending;

my ($from, $to, $from_pending, $to_pending, $hg);
if ($alignment_pending == $apipe_pending) {
    print "Queues are already balanced.\n";
    exit;
}
elsif ($alignment_pending > $apipe_pending) {
    $from = 'alignment';
    $from_pending = $alignment_pending;
    $to = 'apipe';
    $to_pending = $apipe_pending;
    $hg = 'blades';
}
else {
    $from = 'apipe';
    $from_pending = $apipe_pending;
    $to = 'alignment';
    $to_pending = $alignment_pending;
    $hg = 'alignment';
}

print "Shifting jobs from $from to $to...\n";

while (($running_count > 0) && ($from_pending > $to_pending)) {
    system("bjobs -q $from | grep PEND | head -n 1 | awk '{print \$1}' | xargs -n 1 bmod -q $to -m $hg &> /dev/null");
    sleep(5);
    $running_count=`bjobs -r -q alignment | wc -l`; chomp $running_count;
    $from_pending=`bjobs -q $from | grep PEND | wc -l`; chomp $from_pending;
    $to_pending=`bjobs -q $to | grep PEND | wc -l`; chomp $to_pending;
}
