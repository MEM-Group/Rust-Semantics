
//test early return

fn earlyreturn(x:i32) -> i32 {

   let mut z = 4;

   if(x == 2){
   	return 5;
   }else{
	z = 6;
   };

   return z;

}

fn main() {

   println!("{}", earlyreturn(2));

}