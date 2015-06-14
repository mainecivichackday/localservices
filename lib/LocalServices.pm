package LocalServices;

use Mojo::Base 'Mojolicious';


sub startup {
    my $self = shift;
    my $router = $self->routes;

    $router->get(
        '/' => sub {
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
	'/testdb' => sub {
	    my $controller = shift;
	    use Config::Any;
	    my $config = (Config::Any->load_files(
			      { files => ['config.json']}))->[0]->{'config.json'};

	    require 'LocalServices::Schema';
	    LocalServices->import;
	    my ($db, $user, $pass) = (
		$config->{'db'}->{'name'},
		$config->['db'}->{'username'},
		$config->{'db'}->{'password'},
		);
	    
	    my $schema = LocalServices::Schema->connect("dbi:mysql:dbname=$db", $user, $password);
	    my $category = $schema->resultset('Category')->find(0);
	    $controller->render(text => $category->name);
	});

}

1;
