

fn main(){
   println!("{}", -1 & 31);
   assert_eq!(-1 & 31, 31);

   println!("{}", -1 mod 32);
   assert_eq!(-1 mod 32, 31);


}