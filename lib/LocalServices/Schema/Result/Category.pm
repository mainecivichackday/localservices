package LocalServices::Schema::Result::Category;

use warnings;
use strict;

use base 'DBIx::Class::Core';


__PACKAGE__->table('categories');
__PACKAGE__->add_columns( qw( id name ) );
__PACKAGE__->set_primary_key('id');

1;
