#!/usr/bin/env perl

use Mojo::Lite;

get '/' => sub {
    my $controller = shift;
    $controller -> render(text => 'Hi!');
};
