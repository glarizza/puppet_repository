######                           ######
##  Configure Directory Environments ##
######                           ######

##  This manifest requires the puppetlabs/inifile module and will attempt to
##  configure puppet.conf according to the blog post on using R10k and
##  directory environments.  Beware!

# Default for ini_setting resources:
Ini_setting {
  ensure => present,
  path   => "${confdir}/puppet.conf",
  notify => Exec['trigger_r10k'],
}

ini_setting { 'Configure environmentpath':
  section => 'main',
  setting => 'environmentpath',
  value   => '$confdir/environments',
}

ini_setting { 'Configure basemodulepath':
  section => 'main',
  setting => 'basemodulepath',
  value   => '$confdir/modules:/opt/puppet/share/puppet/modules',
}

exec { 'trigger_r10k':
  command     => 'r10k deploy environment -p',
  path        => '/opt/puppet/bin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin',
  refreshonly => true,
}
