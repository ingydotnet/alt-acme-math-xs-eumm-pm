package Acme::Math::XS::Inline;

require Inline;

sub import {
    splice(@_, 0, 1, 'Inline');
    goto &Inline::import;
}

1;
