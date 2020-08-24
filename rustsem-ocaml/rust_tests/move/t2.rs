

//This is for testing the semantics of moving for copable types
fn main() {
   let x = 8;
   let z = x ;
   println!("{}",x); //x can be print since i32 is a copyable type
}