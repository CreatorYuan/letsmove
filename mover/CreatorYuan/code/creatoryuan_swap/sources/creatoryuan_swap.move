/// Module: creatoryuan_swap
module creatoryuan_swap::creatoryuan_swap;
use sui::balance;
use sui::balance::Balance;
use sui::coin;
use sui::coin::Coin;
use sui::transfer::{share_object, public_transfer};
use sui::tx_context::sender;

public struct AdminCap has key {
    id:UID,
}

public struct Bank<phantom T: key+store> has key{
    id:UID,
    bal:Balance<T>
}

fun init(ctx: &mut TxContext){
    let bank = Bank<Coin<>>{
        id: object::new(ctx),
        bal: balance::zero<>(),
    };
    share_object(bank);
    let admin = AdminCap{ id: object::new(ctx)};
    transfer(admin,sender(ctx));
}

public entry fun deposit_cyc(bank: &mut Bank,cyc:Coin<CREATORYUAN_COIN>){
    let cyc_balance = coin::into_balance(cyc);
    balance::join(&mut bank.cyc,cyc_balance);
}


public entry fun deposit_cycf(bank: &mut Bank,cycf:Coin<CREATORYUAN_COIN_FAUCET>){
    let cycf_balance = coin::into_balance(cycf);
    balance::join(&mut bank.cycf,cycf_balance);
}

public entry fun withdraw_rmb(_:&AdminCap,
                              bank: &mut Bank,amt:u64,ctx:&mut TxContext){
    let cyc_balance = balance::split(&mut bank.cyc,amt);
    let cyc = coin::from_balance(cyc_balance);
    public_transfer(cyc,sender(ctx))
}

