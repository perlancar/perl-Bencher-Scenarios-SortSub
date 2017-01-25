package Bencher::Scenario::SortSub::naturally;

# DATE
# VERSION

use strict;
use warnings;

use List::Util qw(shuffle);
use Sort::Sub qw($naturally);

our $scenario = {
    summary => 'Benchmark natural sorting',
    modules => {
        'Sort::Sub' => {version=>'0.05'},
    },
    participants => [
        {
            name => 'Sort::Sub::naturally',
            module => 'Sort::Sub',
            code_template => 'sort $Bencher::Scenario::SortSub::naturally::naturally @{<data>}',
            result_is_list => 1,
        },
        {
            fcall_template => 'Sort::Naturally::nsort(@{<data>})',
            result_is_list => 1,
        },
        {
            name => 'Sort::Naturally::ncmp',
            module => 'Sort::Naturally',
            code_template => 'sort {Sort::Naturally::ncmp($a, $b)} @{<data>}',
            result_is_list => 1,
        },
        {
            fcall_template => 'Sort::Naturally::XS::nsort(@{<data>})',
            result_is_list => 1,
        },
        {
            name => 'Sort::Naturally::XS::ncmp',
            module => 'Sort::Naturally::XS',
            code_template => 'sort {Sort::Naturally::XS::ncmp($a, $b)} @{<data>}',
            result_is_list => 1,
        },
    ],
    datasets => [
        { name=>'10items' , args=>{data=>[shuffle map { "track$_.mp3" } 1..10 ]} },
        { name=>'100items', args=>{data=>[shuffle map { "track$_.mp3" } 1..100]} },
    ],
};

1;
# ABSTRACT:

=head1 SEE ALSO
