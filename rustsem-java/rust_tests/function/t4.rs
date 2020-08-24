
//test recursive function

fn sum(n:i32) {
   let ret:i32;
   if (n == 0) {
      ret = 0;
   }
   else {
      ret = n + (sum(n - 1));
   };
   ret
}

fn main() {
   let n = 100;
   println!( "{}" , sum(n));
}