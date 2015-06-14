package LocalServices::Schema::Result::Location;

use warnings;
use strict;

use DBIx::Class::Core;
use base 'DBIx::Class::Core';


__PACKAGE__->table('location');
__PACKAGE__->add_columns( qw( id name ) );
__PACKAGE__->set_primary_key('id');

1;
