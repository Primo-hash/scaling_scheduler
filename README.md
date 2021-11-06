# scaling_scheduler

Use this command when cloning this repo for submodules to clone as well  
Clone in home directory of ubuntu user  
git clone --recurse-submodules https://git.gvk.idi.ntnu.no/Primo/scaling_scheduler.git 

* Edit scale_env.yaml with all necessary values from openstack
* Permissions might need to be changed on setup.sh to make it executable (chmod)
* Run setup.sh on a manager instance (Ubuntu) that is authenticated in the openstack cli (e.g run service user script)

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