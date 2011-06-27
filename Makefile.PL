
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Perl interface to goo.gl',
  'AUTHOR' => 'Magnus Erixzon <magnus@erixzon.com>',
  'BUILD_REQUIRES' => {},
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'WWW-Shorten-Googl',
  'EXE_FILES' => [
    'bin/goo.gl'
  ],
  'LICENSE' => 'perl',
  'NAME' => 'WWW::Shorten::Googl',
  'PREREQ_PM' => {
    'JSON::Any' => '0',
    'LWP::Protocol::https' => '0',
    'LWP::UserAgent' => '0',
    'WWW::Shorten' => '1.98'
  },
  'VERSION' => '1.02',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



