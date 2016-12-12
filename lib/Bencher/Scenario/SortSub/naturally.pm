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
    ],
    datasets => [
        { name=>'10items' , args=>{data=>[shuffle map { "track$_.mp3" } 1..10 ]} },
        { name=>'100items', args=>{data=>[shuffle map { "track$_.mp3" } 1..100]} },
    ],
};

1;
# ABSTRACT:

=head1 SEE ALSO
