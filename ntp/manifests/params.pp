class ntp::params {
  # Common
  $package = 'ntp'
  $config_file = '/etc/ntp.conf'

  case $::osfamily {
    'Debian': {
      $service_name = 'ntp'
      $driftfile = '/var/lib/ntp/ntp.drift'
      $config_file_owner = 'root'
      $config_file_group = 'root'
      $config_file_mode  = '0644'
      $defaults_file = '/etc/default/ntp'
      $defaults_file_tpl = 'ntp.defaults.debian.erb'
      $ntpd_start_options = '-g'
    }
    'RedHat': {
      $service_name = 'ntpd'
      $driftfile = '/var/lib/ntp/drift'
      $config_file_owner = 'root'
      $config_file_group = 'root'
      $config_file_mode  = '0644'
      $defaults_file = '/etc/sysconfig/ntpd'
      $defaults_file_tpl = 'ntp.defaults.redhat.erb'
      $ntpd_start_options = '-u ntp:ntp -p /var/run/ntpd.pid -g'
    }
    'Suse': {
      $service_name = 'ntp'
      $driftfile = '/var/lib/ntp/drift/ntp.drift'
      $config_file_owner = 'root'
      $config_file_group = 'ntp'
      $config_file_mode  = '0640'
    }
    default: {
      fail("Unsupported platform: ${::osfamily}")
    }
  }
}
