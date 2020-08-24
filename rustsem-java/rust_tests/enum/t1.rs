
enum Mix{
     integer(i32),
     boolean(bool)
}

fn main(){
   let x = Mix::integer(100);
   let z = match x {integer(z) => z, boolean(b) => 1};
   println!("{}",z);
}