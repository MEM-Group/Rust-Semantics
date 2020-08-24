
enum Coin {
    Penny(i32),
    Nickel,
    Dime,
    Quarter
}

fn value_in_cents(coin: Coin) -> i32 {
    match coin {
        Penny(a) => a,
        Nickel => 5,
        Dime => 10,
        Quarter => 25
    }
}

fn main(){
   let t = Coin::Penny(3);
   println!("{}", value_in_cents(t));


      let t = Coin::Nickel;
   println!("{}", value_in_cents(t));


   let t = Coin::Dime;
   println!("{}", value_in_cents(t));


   let t = Coin::Quarter;
   println!("{}", value_in_cents(t));
   

}