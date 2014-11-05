use strict;
use warnings;

use 5.008001;

# This is going to be needed user-side
# We should check for this in @INC on author-side
use lib 'inc';
# Use this instead of ExtUtils::MakeMaker
use Inline::Module::MakeMaker;

my %WriteMakefileArgs = (
  "ABSTRACT" => "Math is HARD (faster)",
  "AUTHOR" => "Ingy d\x{f6}t Net <ingy\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0
  },
  "DISTNAME" => "Acme-Math-XS",
  "EXE_FILES" => [],
  # Need an INLINE section like this
  "INLINE" => {
      # This is the ILSM to ship. Need to allow for multiple.
      "ILSM" => "Inline::C",
      # This is the generated module. Need to allow for multiple.
      "module" => "Acme::Math::XS::Inline",
  },
  "LICENSE" => "perl",
  "MIN_PERL_VERSION" => "5.008001",
  "NAME" => "Acme::Math::XS",
  "VERSION" => "0.0.5",
  "test" => {
    "TESTS" => "t/*.t"
  }
);

# This is all dzil generated stuff:
#
# my %FallbackPrereqs = (
#   "ExtUtils::MakeMaker" => 0,
# );
# 
# unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
#   delete $WriteMakefileArgs{TEST_REQUIRES};
#   delete $WriteMakefileArgs{BUILD_REQUIRES};
#   $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
# }
# 
# delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
#   unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
