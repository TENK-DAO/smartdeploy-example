set -e # base if there is an error
# Set the network to testnet for all commands in the script
export SOROBAN_NETWORK=testnet
# Set source account for all commands in the script
export SOROBAN_SOURCE_ACCOUNT=default
# build the contract
soroban contract build --package contract-a
WASM=./target/wasm32-unknown-unknown/release/contract_a.wasm
# Install the contract
WASM_HASH=$(soroban contract install --wasm $WASM)
ID=$(cat contract_a.txt)
# Redeploy the contract
soroban contract invoke --id $ID -- redeploy --wasm-hash $WASM_HASH