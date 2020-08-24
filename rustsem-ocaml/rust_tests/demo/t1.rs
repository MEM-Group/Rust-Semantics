

fn main() {
   let mut x=Box::new(1);
   let z = Box::new(2);
   let mut y = & x;
   y = & z; 
   let k = x;
}
