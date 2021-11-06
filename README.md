# scaling_scheduler

Use this command when cloning this repo for submodules to clone as well  
git clone --recurse-submodules repo_url  

* Edit scale_env.yaml with all necessary values from openstack
* Run setup.sh on a manager instance that is authenticated in the openstack cli (e.g run service user script)

Example environment variables
```
parameters:
  key: 'manager'
  image: 'Ubuntu Server 18.04 LTS (Bionic Beaver) amd64'
  flavor: 'm1.small'
  database_flavor: 'm1.small'
  external_network_id: 'internal'
  network: 'net1'
  subnet_id: 'subnet1'
  database_name: 'wordpress_db'
  database_user: 'wordpress_admin'
```