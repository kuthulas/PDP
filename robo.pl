#!/usr/bin/perl
system("Jnanesh:date\n");
@list=("ammp","mcf","gcc");
@conf=("1 512 8 0");
@file=("base_A2");
system("rm rdd_summary.csv");
foreach $bench(@list){
$exe=$bench."00.peak.ev6";
print "Start for $exe\n";
system("cp runscripts/RUN$bench spec2000args/$bench\n");
for($i=0;$i<=$#conf;$i++){
$fname=$bench."_".$file[$i];
print "\n$file[$i] for $bench\n";
system("cd spec2000args/$bench;./RUN$bench ../../simplesim-3.0/sim-outorder ../../spec2000binaries/$exe -max:inst 50000000 -fastfwd 20000000 -redir:sim $fname -cache:dl1 dl1:128:32:4:p -bpred 2lev -bpred:2lev $conf[$i] -bpred:ras 8 -bpred:btb 64 2\n");
}
system("cp spec2000args/$bench/$fname .\n");
system("cp spec2000args/$bench/pdp.csv pdp_$bench.csv\n");
system("cp spec2000args/$bench/rdd.csv rdd_$bench.csv\n");
system("echo $bench >> rdd_summary.csv\n");
system("cat rdd_$bench.csv >> rdd_summary.csv\n");

print "\nComplete for $bench\n";
}
system("Jnanesh:date\n");
