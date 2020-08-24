
enum Coin {
    Penny(i32),
    Nickel(bool),
    Dime([i32;3]),
    Quarter(Vec<i32>)
}

fn value_in_cents(coin: Coin) -> i32 {
    match coin {
        Penny(a) => a,
        Nickel(b) => 1 ,
        Dime(c) => c[0],
        Quarter(v) => v[0]
    }
}

fn main(){
   let t = Coin::Penny(3);
   println!("{}", value_in_cents(t));


      let t = Coin::Nickel(true);
   println!("{}", value_in_cents(t));


   let t = Coin::Dime([3,22]);
   println!("{}", value_in_cents(t));


   let t = Coin::Quarter(vec![1,2,3]);
   println!("{}", value_in_cents(t));
   

}