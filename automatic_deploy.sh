#!/bin/bash

MODE=$1

if [[ -z "$MODE" ]]; then
    exit 1
fi

case "$MODE" in
    provision)
        #terraform plan -out=tfplan
        #terraform apply -auto-approve tfplan
        echo "Provisioning infrastructure..."

        ;;
    deploy)
        echo "Deploying application..."
        ;;
    check-status)
        
        ;;
    monitor)
        
        ;;
    teardown)
        terraform destroy -auto-approve
        ;;
    *)
        #og_message "ERROR" "Nepoznat mod"
        exit 1
        ;;
esac
