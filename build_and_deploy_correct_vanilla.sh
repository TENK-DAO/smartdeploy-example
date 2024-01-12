set -e # bail if there is an error
# Set the network to testnet for all commands in the script
export SOROBAN_NETWORK=testnet
#create a new identity called default which will be funded on testnet
soroban config identity generate default
# build
soroban contract build --package correct-vanilla-contract-a
WASM=./target/wasm32-unknown-unknown/release/correct_vanilla_contract_a.wasm
# install
WASM_HASH=$(soroban contract install --wasm $WASM)
echo $WASM_HASH
# deploy
soroban contract deploy --wasm-hash $WASM_HASH --source default > correct_vanilla_contract_a.txt
echo $CONTRACT_A_ID