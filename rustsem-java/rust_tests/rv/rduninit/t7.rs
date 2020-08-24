
fn main(){

   let x = [1,2];

   let y = 5;

   match y {
   	     1 => { println!("1"); },
         5 => { let z = x ; } ,
         default => { println!("n"); }
   } ;

   let z = x;

}