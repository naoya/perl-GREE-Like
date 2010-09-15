package GREE::Like;
use strict;
use warnings;
use base qw/Class::Accessor::Fast/;

use URI::Escape qw/uri_escape/;
use Template;

# TODO: GREE Name Support
my @Fields = qw/title url image type/;

__PACKAGE__->mk_accessors(@Fields);

sub to_meta {
    my $self = shift;
    my $tt = Template->new;
    $tt->process(\*DATA, { self => $self, fields => \@Fields }, \my $out)
        or die $tt->error;
    return $out;
}

sub to_button {
    my ($self, $u, $options) = @_;

    $options ||= {};
    $options->{height} ||= 20;
    $options->{type}   ||= 0;

    return sprintf '<iframe src="http://share.gree.jp/share?url=%s&amp;type=%d&amp;height=%d" scrolling="no" frameborder="0" marginwidth="0" marginheight="0" style="border:none; overflow:hidden; width:100px; height:20px;" allowTransparency="true"></iframe>', uri_escape($u), $options->{type}, $options->{height};
}

1;

__DATA__
[% FOREACH f IN fields -%]
[% IF self.$f %]<meta property="og:[% f %]" content="[% self.$f | html %]" />[% END %]
[% END -%]
