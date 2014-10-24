use strict;
use warnings;
package Acme::Math::XS::Inline;

# TODO: Make sure this is latest version (self-check).
our $INLINE_VERSION = '0.0.2';

use File::Path;
BEGIN { File::Path::mkpath('./blib') unless -d './blib' }
use Inline Config => directory => './blib';

sub import {
    splice(@_, 0, 1, 'Inline');
    goto &Inline::import;
}

1;
