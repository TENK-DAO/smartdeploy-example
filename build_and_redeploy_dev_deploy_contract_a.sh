set -e # base if there is an error
# Set the network to testnet for all commands in the script
export SOROBAN_NETWORK=testnet
# Set source account for all commands in the script
export SOROBAN_SOURCE_ACCOUNT=default
# build the contract
soroban contract build --package contract-a
WASM=./target/wasm32-unknown-unknown/release/contract_a.wasm
ID=$(cat dev_deploy_contract_a.txt)
# Deploy the contract and write the contract id to a file
soroban contract invoke --id $ID -- \
        dev_deploy --wasm-file-path $WASM