#!/usr/bin/env perl
use strict;
use warnings;
use FindBin::libs;

use GREE::Like;

my $like = GREE::Like->new;
$like->title('GREE');
$like->url('http://gree.jp/');
$like->image('http://gree.jp/images/logo.jpg');
$like->type('website');

print $like->to_meta;
print $like->to_button('http://bloghackers.net/~naoya/sandbox/like.html');
