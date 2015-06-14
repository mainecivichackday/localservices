package LocalServices::Schema::Result::Service;

use warnings;
use strict;

use DBIx::Class::Core;
use base 'DBIx::Class::Core';


__PACKAGE__->table('services');
__PACKAGE__->add_columns( qw( id name location category description contact) );
__PACKAGE__->set_primary_key('id');
__PACKAGE__->has_one('category' => 'LocalServices::Schema::Result::Category', 'id');

1;
