# smartdeploy-example

Requires [just](https://github.com/casey/just)

## Setup

```bash
just setup
```


## build contracts

```bash
just build
```

## deploy contracts

```
just deploy contract-a
```
Or snake_case
```
just deploy contract_a
```

## invoke contracts

```bash
just invoke contract-a --help
```

Currently the `.env` file has `SOROBAN_NETWORK=testnet`.

To use local first start the local docker `just network_start`. Then either change `.env`, use `export SOROBAN_NETWORK=local` or prefix your just commands with `SOROBAN_NETWORK=local`. e.g. `SOROBAN_NETWORK=local just deploy contract-a`
