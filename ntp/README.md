# puppet-ntp

Manage NTP client and server via Puppet

## Usage

### Client

#### Using ntp pool mirrors

```
    class { 'ntp': }
```

#### Using custom ntp mirrors

```
    class { 'ntp':
        server_list => [ 'yourLocalServer1', 'yourLocalServer2', ]
    }
```

### Server

#### Using ntp pool mirrors

```
    class { 'ntp':
        server_enabled => true,
    }
```

#### Using custom ntp mirrors

```
    class { 'ntp':
        server_list = [ 'yourLocalServer1', 'yourLocalServer2', ],
        server_enabled => true,
}
```

If you want some clients with unlimited access,
you can set $query_networks in the follwing way:

```
    class { 'ntp':
        server_list = [ 'yourLocalServer1', 'yourLocalServer2', ],
        server_enabled = true,
        query_networks = [ '192.168.0.0/255.255.255.0', '172.16.0.0/255.255.0.0', ],
    }
```

## Other class parameters
* interface_ignore: array, default: []
* interface_listen: array, default: []
* enable_statistics: true or false, default: false
* statsdir: string, default: undef
* ensure: present or absent, default: present
* autoupgrade: true or false, default: false
* package: string, default: OS specific. Set package name, if platform is not supported.
* config_file: string, default: OS specific. Set config_file, if platform is not supported. 
* config_file_replace: true or false, default: true
* driftfile: string, default: OS specific. Set driftfile, if platform is not supported. 
* service_ensure: running or stopped, default: running
* service_name: string, default: OS specific. Set service_name, if platform is not supported. 
* service_enable: true or false, default: true
* service_hasstatus: true or false, default: true
* service_hasrestart: true or false, default: true
