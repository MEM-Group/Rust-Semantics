

fn main() {

   let x = [1,2];

   let y = & x as * mut T;

   let z = x;

   unsafe{ println!("{}", * y); }
   
}