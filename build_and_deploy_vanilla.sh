set -e # base if there is an error
# build the contract
soroban contract build --package vanilla-contract-a
# create a new identity called default which will be funded on testnet
soroban config identity generate default
# Set the network to testnet for all commands in the script
export SOROBAN_NETWORK=testnet
WASM=./target/wasm32-unknown-unknown/release/vanilla_contract_a.wasm
# Install the contract
WASM_HASH=$(soroban contract install --wasm $WASM)
echo $WASM_HASH
# Deploy the contract and write the contract id to a file
soroban contract deploy --wasm-hash $WASM_HASH --source default > vanilla_contract_a.txt
echo $(cat vanilla_contract_a.txt)