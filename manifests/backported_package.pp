define os::backported_package( $ensure, $responsefile='', $install=true) {
  fail 'Deprecated definition, use apt::preferences + package instead!'
}
