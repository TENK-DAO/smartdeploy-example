set -e # base if there is an error
# Set the network to testnet for all commands in the script
export SOROBAN_NETWORK=testnet
# Set source account for all commands in the script
export SOROBAN_SOURCE_ACCOUNT=default
#create a new identity called default which will be funded on testnet
soroban config identity generate default
# build the contract
soroban contract build --package dev-deploy-contract-a
WASM=./target/wasm32-unknown-unknown/release/dev_deploy_contract_a.wasm
# Install the contract
WASM_HASH=$(soroban contract install --wasm $WASM)
# Deploy the contract and write the contract id to a file
soroban contract deploy --wasm-hash $WASM_HASH --source default > dev_deploy_contract_a.txt
