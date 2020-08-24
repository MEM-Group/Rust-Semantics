
fn main(){

   let v = [1,2,3,4,5,6];

   let mut i = 0 ;

   let k = 2 ;

   while(k + i < 6) {
       println!("{}", v[k+i]);
       i = i + 1;
       k = k + 1;
   }

}