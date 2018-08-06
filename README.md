# Factotum
### Ansible playbooks & scripts for the installation & maintenance of a Slurm based cluster at MGHPCC hosted by UMass Amherst RC

After installing CentOS minimal on all machines and configuring the network appropriately:

Install Ansible on the head node.
Add ssh key to all managed machines from head node.
Edit /etc/ansible/hosts to reflect IPs of managed machines.
Clone git repo in /root of head node.
Edit 'files' which contain deployment specific configs.
Run the master playbook.

Follow instructions to completion.
