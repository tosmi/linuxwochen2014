class linuxwochen2014 (
  $ensure = present
  ) {
  user { 'toni':
    ensure => $ensure,
    uid    => 4711,
    gid    => 4711,
  }

  package { 'emacs-nox':
    ensure => installed
  } ->
  package { 'vi':
    ensure => absent,
  }
}
