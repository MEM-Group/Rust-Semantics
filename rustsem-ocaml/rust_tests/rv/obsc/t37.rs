
fn main() {

   let x = [1,2,3,4,5,6];

   let mut i = 0;

   let mut z;

   while (i < 6) {
       z = & (x[i]) ;
       i = i + 1;
   }

   
   let k = & mut x;
   let b = z;
}