

fn main() {

   let mut x = 32;
   { 
     let mut z = & mut x;

     let mut t = & mut z;

     * * t = 23;
   }

   println!("{}", x);

}