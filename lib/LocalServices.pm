package LocalServices;

use Mojo::Base 'Mojolicious';


sub startup {
    my $self = shift;
    my $router = $self->routes;

    $router->get(
	'/' => sub {
	    my $controller = shift;
	    
	    $controller->render(text => 'Hello, World!');
	});
}

1;
