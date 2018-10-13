Title: Partition information with Perl
In this assignment, you will write a Perl program that reads from a file similar to the Unix’ file
mtab (a file that contains information about the filesystem partitions). Your program will
process options and print the requested output to the standard output.
These are the specifications for your Perl program:
1. The file containing your program must be named partitionbrowser.pl
2. It must be invoked as:
  partitionbrowser.pl option partition_file
  The program must check that the partition_file argument is an existing and readable
  file. If not, it must print a message of your choice to the standard output and exit. The
  format for file partition_file and the values for the option argument are described
  below.
3. File partition_file can have any arbitrary name. It must be a file of text with the following
  format:
  a. The file consists of an arbitrary, yet reasonable, number of lines (including,
  possibly, zero lines). Each line corresponds to a partition.
  b. Each line must contain four fields separated by spaces.
  c. The four fields are: mount point, filesystem type, total space and used space.
  d. Field mount point is a Unix filename. Field filesystem type is a string of no more
  than 10 characters. Fields total space and used space are nonnegative integers
  represented as strings of no more than 10 characters.
  The following example is the reference specification for the format of file partition_file:
  / ext3 10317828 4439828
  /usr nfs 20635656 446188
  /home ext3 2885780 2265324
  /var ext4 2885780 1900002 
  Important note: your program does not need to verify that file partition_file complies with the
  specifications. You can simply assume that the file meets all the specifications given above.
  4. Your program can be invoked with option: -n. In this case, it must print the number of
  partitions in partition_file:
  Number of partitions: <number of partitions in
  partition_file>
  Example with the example partition_file given above:
  Command line:
  partitionbrowser.pl -n partition_file 
  4
  Output:
  Number of partitions: 4
  In the case in which file partition_file is empty, your program will print:
  No partitions found
  5. Your program can be invoked with option: -u. In this case, it must print the following
  string:
  Used space: <used space across all the partitions in
  partition_file>
  The used space across all the partitions in partition_file is the sum of the used space in each
  partition. 
  Example with the example partition_file given above:
  Command line:
  partitionbrowser.pl -u partition_file
  Output:
  Used space: 9051342
  6. Your program can be invoked with option: -f. In this case, it must print the following
  string:
  Free space: <free space across all the partitions in
  partition_file>
  The free space in a partition is computed as the difference between the total space and used
  space fields. The free space across all the partitions in partition_file is the sum of the free
  space in each partition.
  Example with the example partition_file given above:
  Command line:
  partitionbrowser.pl -f partition_file
  Output:
  Free space: 27673702
  7. Your program can be invoked with option: -t filesystem type. In this case, it must print all
  the mount points in file partition_file with that filesystem type. The format of filesystem
  type in the option is the same as the filesystem type field in the file. The output of your
  program must be: 
  Mount points with filesystem type <filesystem type>:
  <first mount point in appearance order>
  <second mount point in appearance order>
  …
  <last mount point in appearance order>
  Example with the example partition_file given above:
  Command line:
  partitionbrowser.pl -t ext3 partition_file
  Output:
  Mount points with filesystem type ext3:
  /
  /home
  In the case in which the requested filesystem type does not exist in partition_file, your
  program must print:
  No mount points with this filesystem type
  8. Your program can be invoked with option: -s. In this case, it must only print your name,
  surname, student ID and date of completion of your assignment, in a format of your choice.
  Please note that argument partition_file is still required.
  9. If your program is invoked with any other syntax than those specified above, it must print a
  message of your choice to the standard output and exit.
  Examples of incorrect syntax:
  partitionbrowser.pl -Z partition_file
  partitionbrowser.pl -u
  10. Zip your file partitionbrowser.pl into a file named
  USP_<yourSurname>_<yourStudentID>.zip and submit it with the modalities specified
  above. Several free zip utilities are available on the WWW. 
  
