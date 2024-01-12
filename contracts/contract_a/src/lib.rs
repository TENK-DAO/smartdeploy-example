#![no_std]
use soroban_sdk::{self, contract, contractimpl};

#[contract]
pub struct ContractA;

#[contractimpl]
impl ContractA {
    pub fn add(x: u32, y: u32) -> u32 {
        x + y
    }
}

// This ensures that the contract is redeployable.
smartdeploy_sdk::core_riff!();
