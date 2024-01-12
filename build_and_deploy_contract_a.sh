#!/usr/bin/env bash

set -e # base if there is an error
# Set the network to testnet for all commands in the script
export SOROBAN_NETWORK=testnet
# Set source account for all commands in the script
export SOROBAN_SOURCE_ACCOUNT=default
#create a new identity called default which will be funded on testnet
soroban config identity generate default
# build the contract
soroban contract build --package contract-a
WASM=./target/wasm32-unknown-unknown/release/contract_a.wasm
# Install the contract
WASM_HASH=$(soroban contract install --wasm $WASM)
# Deploy the contract and write the contract id to a file
soroban contract deploy --wasm-hash "$WASM_HASH" --source default > contract_a.txt
# Set the owner so only the owner can redeploy
soroban contract invoke --id "$(cat contract_a.txt)" -- owner_set --new_owner default