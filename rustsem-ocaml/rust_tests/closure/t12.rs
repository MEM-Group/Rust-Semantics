
fn example2() -> i32 {

   let x = 3;
   let closure = move | | x ;

   x = 4;

   return closure();
}

fn main (){
   println!("{}", example2());
}