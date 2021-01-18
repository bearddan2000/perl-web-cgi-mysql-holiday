#!/usr/bin/perl -wT

use DBI;


print  "Content-type:text/html\n\n";
my $dsn = "DBI:mysql:database=holiday;host=maria";
my $dbh = DBI->connect($dsn, 'maria', 'pass', {
   RaiseError => 0,
   PrintError => 0,
});

if (!$dbh) {
   die($DBI::errstr);
}

sub select_holiday {
  # now retrieve data from the table.
  my $result = '';
  open my $fh, '<', 'querry-1.sql' or die "Can't open file $!";
  my $querry = do { local $/; <$fh> };
  close $fh;
  my $sth = $dbh->prepare($querry);
  $sth->execute();
  while (my $ref = $sth->fetchrow_hashref()) {
      $result .= "$ref->{'name'}";
  }
  $sth->finish;
  return $result;
}
sub select_tbl {
  # now retrieve data from the table.
  my $result = '';
  open my $fh, '<', 'querry-2.sql' or die "Can't open file $!";
  my $querry = do { local $/; <$fh> };
  close $fh;
  my $sth = $dbh->prepare($querry);
  $sth->execute();
  while (my $ref = $sth->fetchrow_hashref()) {
    my $datum = sprintf "%d/%d", $ref->{'mes'}, $ref->{'dia'};
    my $name = $ref->{'name'};
      $result .= sprintf "<tr><td>%s</td><td>%s</td></tr>", $datum, $name;
  }
  $sth->finish;
  return $result;
}
sub main {
  print  "<html><head><title>Holidays</title></head>\n\n";
  print  "<body>\n";
  print  "The next american holiday will be <b>";
  print  &select_holiday;
  print  "</b><br/>";
  print  "<table border=1><capion>Holidays</caption>";
  print "<tr><th>Date</th><th>Name</th></tr>";
  print &select_tbl;
  print  "</table></body></html>";
}
&main;

# Disconnect from the database.
$dbh->disconnect();
