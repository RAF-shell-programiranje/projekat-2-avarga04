# Terraform Azure VM

This folder contains a minimal Terraform configuration to deploy a single Linux VM on Azure.

Files added:
- `provider.tf` — provider configuration
- `variables.tf` — input variables and defaults
- `main.tf` — resources: resource group, vnet, subnet, nsg, public ip, nic, VM
- `outputs.tf` — useful outputs (public IP, vm name)

Quick start
1. Install Terraform 1.x and authenticate to Azure (e.g. `az login` or use a service principal).
2. Optionally update `variables.tf` defaults or pass variables via `-var` or a `terraform.tfvars` file.
3. Initialize and apply:

```bash
terraform init
terraform apply -var="admin_ssh_public_key_path=$HOME/.ssh/id_rsa.pub" -auto-approve
```

Notes
- The default SSH public key path is `~/.ssh/id_rsa.pub`. Replace with your public key path.
- Default location is `West Europe`. Change `var.location` if needed.
- This is intentionally minimal — add storage, extensions, tags, or bootstrapping as needed.

Security
- The example opens port 22 to the world. For production, restrict `source_address_prefix` in the NSG.
[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/32TZnzb7)
# Upustvo pokrentanja

Pokrecete ga pomocu: java -jar project2_dummy_service-1.0-SNAPSHOT.jar <log_location> <number_of_agents>

<log_location> - lokacija log fajla (default: logs/app.log)
<number_of_agents> - broj agenata koji se pokreću paralelno (default: 500)
