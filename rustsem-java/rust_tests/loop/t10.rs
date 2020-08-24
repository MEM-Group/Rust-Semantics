
fn main(){

   let s = 0;
   let n = 10;

   while (n > 0) {
   	 s = s + n;
	 n = n - 1;
	 	 if (s > 30) {
	    break;
	 };

   }

   println!("{}",s);
   
}