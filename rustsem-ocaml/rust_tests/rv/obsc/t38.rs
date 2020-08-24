
fn main() {

   let mut x = [1,2,3,4,5,6];

   let mut i = 0;

   let mut z;

   while (i < 6) {
       z = & (x[i]) ;
       i = i + 1;
   }


   x[3] = 3;

   let k = z;
   
}