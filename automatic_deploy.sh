#!/bin/bash

MODE=$1
SSH_KEY="/home/vboxuser/projekat2/projekat-2-avarga04/Projekat-2-VM_key.pem"
SSH_USER="anjav8824si"

if [[ -z "$MODE" ]]; then
    echo "Usage: $0 {provision|deploy|check-status|monitor|teardown}"
    exit 1
fi

echo "Odabrani mod: $MODE"

case "$MODE" in
    --provision)
        terraform plan -out=tfplan
        terraform apply -auto-approve tfplan
        echo "Ip adrese VM-ova:"
        echo "VM1:"
        echo "10.0.1.4"
        echo "VM2:"
        echo "10.0.1.8"
        echo "key za pristup VM-ovima se nalazi u fajlu 'projekat2.pub'"
        echo "Provisioning infrastructure..."

        ;;
    --deploy|-deploy|deploy)
        echo "Deploy modu: pokrecem Ansible playbook..."

        if ! command -v ansible-playbook >/dev/null 2>&1; then
            echo "Greska: ansible-playbook nije instaliran. Instalirajte Ansible i pokušajte ponovo."
            exit 2
        fi

        INVENTORY_FILE="ansible/inventory.ini"
        PLAYBOOK_FILE="ansible/deploy_app.yml"

        if [[ ! -f "$INVENTORY_FILE" ]]; then
            echo "Greska: inventory fajl '$INVENTORY_FILE' nije pronadjen."
            exit 3
        fi

        if [[ ! -f "$PLAYBOOK_FILE" ]]; then
            echo "Greska: playbook '$PLAYBOOK_FILE' nije pronadjen."
            exit 4
        fi

        ansible-playbook -i "$INVENTORY_FILE" "$PLAYBOOK_FILE" --private-key "$SSH_KEY" -u "$SSH_USER"
        RC=$?
        if [[ $RC -ne 0 ]]; then
            echo "Ansible playbook je zavrsio sa greskom (kod: $RC)."
            exit $RC
        fi

        echo "Deploy zavrsen uspesno."

        ;;
    --check-status)
        echo "Checking status..."
        ;;
    --monitor)
        echo "Monitoring application..."
        ;;
    --teardown)
       terraform destroy -auto-approve
       echo "Tearing down infrastructure..."
        ;;
    *)
        echo  "ERROR: Nepoznat mod"
        exit 1
        ;;
esac
