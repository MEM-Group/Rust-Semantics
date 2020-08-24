
fn sum(n:i32) -> i32 {
   let r ;
   if (n == 0) {
      r = 0;
   }
   else {
   	r = n + sum(n - 1);
   } ;
   return r;
}

fn main(){
   let n = 10;

   let s = sum(1000) ;
   println!("{}",s);
}