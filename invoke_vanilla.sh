set -e # base if there is an error
# Set the network to testnet for all commands in the script
export SOROBAN_NETWORK=testnet

soroban contract invoke --id $(cat contract_a.txt) --source default -- add --x 1 --y 2
soroban contract invoke --id $(cat contract_a.txt) --source default -- add --x 4294967295 --y 1