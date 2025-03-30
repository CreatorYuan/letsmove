/// Module: creatoryuan_game
module creatoryuan_game::creatoryuan_game;
use sui::balance::Balance;
use sui::coin::Coin;

public struct Bank<phantom T:store>{
    id: UID,
    bal: Balance<T>
}

fun init () {

}


public entry fun run_game(money: Coin){

}
