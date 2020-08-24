
fn sum (v: & Vec < i32 >, n:i32 ) -> i32{

   let mut i : usize= 0;
   let mut sum = 0;
   while ( i < n ) {
         sum = sum + ((*v)[i]);
         i = i + 1;
   }
   sum
}

fn main(){

   let v = vec![1,3,4];

   println!("{}", sum(& v, 3));

}