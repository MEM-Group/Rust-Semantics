
fn sum(t:i32) -> i32 {
   let mut s = 0;
   let mut n = t;
   while ( n > 0 ){
   	 s = s + n;
	 n = n - 1;
   }
   s
}


fn main() {
   let n = 10 ;
   assert_eq!(sum(n), (n * (n + 1)) / 2 );

}