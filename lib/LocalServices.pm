package LocalServices;

use Mojo::Base 'Mojolicious';


sub startup {
    my $self = shift;
    my $router = $self->routes;

    $router->get(
		'/' => sub {
	    my $controller = shift;	    
	    $controller->render(template => 'index', format => 'html');
	});
	
    $router->get(
        '/search' => sub {
	    my $controller = shift;
	    $controller->render(template => 'search', format => 'html');
	});
    
    $router->post(
	'/results' => sub {
            my $controller = shift;
	    my $resultslist = '';
	    $controller->stash(resultslist => $resultslist);
	    $controller->render(template => 'results', format => 'html');
	});
    
    $router->get(
        '/categories' => sub {
	    my $controller = shift;
	    my $categories = '';
	    $controller->stash(categorieslist => $categories);
	    $controller->render(template => 'categories', format => 'html');
    });

    $router->get(
        '/search' => sub {
	    my $controller = shift;
	    $controller->render(template => 'search', format => 'html');
	});
}

1;
