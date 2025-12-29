#!/bin/bash

MODE=$1

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
    --deploy)
        echo "Deploying application..."
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
