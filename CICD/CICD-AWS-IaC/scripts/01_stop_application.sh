#!/bin/bash
echo "Stopping any running Terraform processes..."
pkill -f terraform || echo "No Terraform process running to stop."
