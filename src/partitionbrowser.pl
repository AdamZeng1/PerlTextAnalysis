#!/usr/bin/perl
use strict;
use warnings;


my $number_of_arguments=@ARGV;

my @total_space;
my @used_space;
my $line_count;
my @free_space;
my @filesystem_type;
my @mount_point;


sub sumSpace {
  my $sumSpace=0;
  foreach $a (@_) {
    $sumSpace = $sumSpace + $a;
  }
  return $sumSpace;
}


my @line_number_contain_filesystem_type;
my $argument_number = @ARGV;
if ($argument_number==3) {
  my $filesystemType=$ARGV[1];
  open(DATA,"<$ARGV[2]") or die "file can not be read";
  while(<DATA>) {
    my $line = $_;

    #split one line with space
    my @line=split(/ /,$line);

    #push mount point into @mount_point
    push @mount_point,$line[0];

    #push filesystem type into @filesystem_type
    push @filesystem_type,$line[1];

    #push total space into @total_space
    push @total_space,$line[2];


    #push used space into @used_space
    push @used_space,$line[3];

  }

  for (my $var = 0; $var < @filesystem_type; $var++) {
    if ($filesystem_type[$var] eq $ARGV[1]) {
      push @line_number_contain_filesystem_type,$var;
    }
  }

  print "Mount points with filesystem type $ARGV[1]:\n";
  for (my $var = 0; $var < @line_number_contain_filesystem_type; $var++) {
    my $line_number = $line_number_contain_filesystem_type[$var];
    print "$mount_point[$line_number]\n";
  }

} elsif ($argument_number==2) {

  open(DATA,"<$ARGV[1]") or die "file can not be read";
  while(<DATA>) {
    my $line = $_;

    #split one line with space
    my @line=split(/ /,$line);
    #push mount point into @mount_point
    push @mount_point,$line[0];

    #push filesystem type into @filesystem_type
    push @filesystem_type,$line[1];

    #push total space into @total_space
    push @total_space,$line[2];

    #push used space into @used_space
    push @used_space,$line[3];

    #count the number of line
    $line_count++;
  }

  if ($ARGV[0] eq "-n" || $ARGV[0] eq "-u" || $ARGV[0] eq "-f" ||$ARGV[0] eq "-s") {

    if ($ARGV[0] eq"-n") {
      if($line_count==0) {
        print "No partitions found";
      } else {
      print "Number of partitions: $line_count";
      }
    }

    if ($ARGV[0] eq "-u") {
      my $usedSpace=sumSpace(@used_space);
      print "Used space: $usedSpace";
    }

    if ($ARGV[0] eq "-f") {
      my $usedSpace=sumSpace(@used_space);
      my $totalSpace=sumSpace(@total_space);
      my $freeSpace=$totalSpace-$usedSpace;
      print "Free space: $freeSpace";
    }

    if ($ARGV[0] eq "-s") {
      print "Weihan Zeng 13023128 2018-9-24";
    }


  }
  else {
    print "you should select -n -u -f -t mode";
  }
}
