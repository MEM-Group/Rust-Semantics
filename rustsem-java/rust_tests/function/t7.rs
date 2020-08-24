
//calculate the nth fib number

fn fib(n:i32) -> i32 {
   let ret:i32;
   if(n == 1) {
   	ret = 1;
   }
   else if (n == 2) {
   	ret = 1;
   }
   else {
   	ret = (fib(n - 1)) + (fib(n - 2));
   };
   ret
}

fn main() {

   println!("{}",fib(1));
   println!("{}",fib(2));
   println!("{}",fib(3));
   println!("{}",fib(4));
   println!("{}",fib(5));
   
}