
enum Coin {
    Penny(i32),
    Nickel(bool),
    Dime,
    Quarter
}

fn value_in_cents(coin: Coin) -> i32 {
    match coin {
        Penny(a) => a,
        Nickel(b) => 1 ,
        Dime => 10,
        Quarter => 25
    }
}

fn main(){
   let t = Coin::Penny(3);
   println!("{}", value_in_cents(t));


      let t = Coin::Nickel(true);
   println!("{}", value_in_cents(t));


   let t = Coin::Dime;
   println!("{}", value_in_cents(t));


   let t = Coin::Quarter;
   println!("{}", value_in_cents(t));
   

}