# Vagrant with Ansible (local)

Deploys a basic Ubuntu Nginx server and exposes it over port 8080 to the localhost.

In this example Vagrant deploys a base box with Ubuntu Xenial (16.04 LTS), then installs defined Ansible roles from galaxy, and finishes up by running a defined playbook. This is all done locally without a need for Ansible on the host vagrant box or an Ansible target hosts file.

- Box is deployed with 1/4 of the memory of the host system (as an option, you can disable this for a set amount as well)
- Updates are performed once at the start of provisioning as part of the script block defined. Optional software can be installed here as well (commented out)
- Ansible galaxy roles are installed per the ansible-role-requirements.yml file. These get installed to provisioning/roles
- The Ansible playbook is run from provisioning/playbook.yml definition