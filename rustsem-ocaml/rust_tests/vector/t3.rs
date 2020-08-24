

/* A recursive function */

fn Sum<'a> (x:& 'a Vec<i32>, i:i32, N:i32) -> i32 {

   if (i < N) {
      (*x)[i] + (Sum(x, i + 1, N))
   }else {
      0
   }

}

fn main() {
   let v = vec![1,2,3];
   println!("{}", Sum(& v, 0, 3));
   
}