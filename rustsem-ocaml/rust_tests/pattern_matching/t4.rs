
enum Coin {
    Penny,
    Nickel,
    Dime,
    Quarter
}

fn value_in_cents(coin: Coin) -> i32 {
    match coin {
        Penny => 1,
        Nickel => 5,
        Dime => 10,
        Quarter => 25
    }
}

fn main(){
   let t = Coin::Penny;
   println!("{}", value_in_cents(t));

      let t = Coin::Nickel;
   println!("{}", value_in_cents(t));


   let t = Coin::Dime;
   println!("{}", value_in_cents(t));


   let t = Coin::Quarter;
   println!("{}", value_in_cents(t));

}