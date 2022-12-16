# Cloud deployment and administration

This is a set of practical exercises around cloud deployment and administration.

This directory is composed as follows :

* `hosts.ini` : ansible inventory.

* `terraform` : directory containing the `main.tf` file which creates four openstack instances using terraform.

    To run the terraform script :

    ```
    terraform init
	terraform plan
	terraform apply
    ```

* `server_web_loadbalancer` : in this directory we create a simple Docker image (`web server`) allowing to display the hostname of the machine on which it runs, which we then deploy on the `webservers` machines of the inventory to then install a loadbalancer on the `loadbalancer` machine of the inventory.

* `docker` : directory containing a playbook to install docker on the remote machines of the inventory.

* `ufw` : directory containing a playbook allowing to install a firewall (Uncomplicated Firewall) on the remote machines of the inventory
then configure it so that it does not allow connections only on the ports of the services: HTTP, HTTP and SSH.

* `apache2` : directory containing a playbook that starts apache2 on the HTTP port.

To run the ansible playbook :

```
ansible-playbook [playbook file] -i [inventory file]
```