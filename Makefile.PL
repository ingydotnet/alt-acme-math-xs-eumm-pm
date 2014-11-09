use strict;
use warnings;

use 5.008001;

# This is going to be needed user-side
# We should check for this in @INC on author-side
use lib 'inc';
# Use this instead of ExtUtils::MakeMaker
use Inline::Module::MakeMaker;

WriteMakefile(
  NAME => 'Acme::Math::XS',
  VERSION => '0.0.6',
  ABSTRACT => 'Math is HARD (faster)',
  AUTHOR => 'Ingy döt Net <ingy@cpan.org>',

  # Need an INLINE section like this
  INLINE => {
      # This is the ILSM to ship. Can be array ref.
      ILSM => 'Inline::C',
      # This is the module with the inline code. Can be array ref.
      module => 'Acme::Math::XS',
      # This is the generated module. Can be array ref.
      inline => 'Acme::Math::XS::Inline',
  },

  CONFIGURE_REQUIRES => {
    'ExtUtils::MakeMaker' => 0
  },
  LICENSE => 'perl',
  MIN_PERL_VERSION => '5.008001',
  test => {
    TESTS => 't/*.t'
  }
);
