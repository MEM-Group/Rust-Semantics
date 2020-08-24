
fn mutates(x : & mut i32) {
    
    * x = 45;
    
}


fn main() {

  let mut x = 34;
  
  mutates(& mut x);
  
  println!("{}",x);

}