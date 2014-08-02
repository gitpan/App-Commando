package App::Commando;

use strict;
use warnings;

# ABSTRACT: Flexible library to build command-line apps

our $VERSION = '0.010'; # VERSION

use App::Commando::Program;

sub program {
    my ($name) = @_;

    my $program = App::Commando::Program->new($name);

    return $program;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

App::Commando - Flexible library to build command-line apps

=head1 VERSION

version 0.010

=head1 SYNOPSIS

    use App::Commando;

    my $program = App::Commando::program('example');
    $program->version('0.42');

    my $cmd_hello = $program->command('hello');
    $cmd_hello->syntax('hello TARGET');
    $cmd_hello->option('world', '-w', '--world', 'Say hello to the World');
    $cmd_hello->option('universe', '-u', '--universe', 'Say hello to the Universe');
    $cmd_hello->action(sub {
        my ($argv, $config) = @_;

        # Get the first argument or set the default value
        my $target = $argv->[0] || 'Everyone';
        $target = "World" if $config->{world};
        $target = "Universe" if $config->{universe};

        print "Hello, $target!\n";
    });

    my $cmd_bye = $program->command('bye');
    $cmd_bye->action(sub {
        print "Goodbye!\n";
    });

    $program->go;

=head1 SEE ALSO

=over 4

=item *

L<https://github.com/jekyll/mercenary> - Mercenary GitHub repository

=back

=for :stopwords cpan testmatrix url annocpan anno bugtracker rt cpants kwalitee diff irc mailto metadata placeholders metacpan

=head1 SUPPORT

=head2 Bugs / Feature Requests

Please report any bugs or feature requests through the issue tracker
at L<https://github.com/odyniec/p5-App-Commando/issues>.
You will be notified automatically of any progress on your issue.

=head2 Source Code

This is open source software.  The code repository is available for
public review and contribution under the terms of the license.

L<https://github.com/odyniec/p5-App-Commando>

  git clone https://github.com/odyniec/p5-App-Commando.git

=head1 AUTHOR

Michal Wojciechowski <odyniec@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Michal Wojciechowski.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
