set dotenv-load

soroban := 'target/bin/soroban'
loam := 'target/bin/loam'


export PATH := './target/bin:' + env_var('PATH')

[private]
l:
    just --list

s +args='': 
    soroban {{args}}

r b +args='':
    {{b}} {{args}}

build_contract p:
    soroban contract build --profile contracts --package {{p}}

# build contracts
build:
    loam build --out-dir ./target/loam

invoke contract +args='--help':
    soroban contract invoke --source default --id $(cat ./target/loam/{{snakecase(contract)}}.txt) -- {{args}} 

deploy contract: build fund_default
    soroban contract deploy --source default --wasm ./target/loam/{{snakecase(contract)}}.wasm > ./target/loam/{{snakecase(contract)}}.txt


# Setup the project to use a pinned version of the CLI
setup:
    echo {{ if path_exists(soroban) == "true" { "" } else { `cargo install_soroban` } }}
    echo {{ if path_exists(loam) == "true" { "" } else { `cargo install_loam` } }}
    echo {{ if path_exists('.soroban/identity/default.toml') == "true" { "" } else { `just setup_default` } }}

[private]
setup_default:
   -soroban config identity generate default

@fund_default:
    soroban config identity fund default

network_start:
    docker run --rm -it \
        -p 8000:8000 \
        --name stellar \
        stellar/quickstart:soroban-dev@sha256:0ad51035cf7caba2fd99c7c1fad0945df6932be7d5c893e1520ccdef7d6a6ffe \
        --local \
        --enable-soroban-rpc