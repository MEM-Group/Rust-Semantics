
fn main(){

   let v = [1,2,3];

   let mut i = 0 ;

   let k = 2 ;

   while(k + i < 5) {
       println!("{}", v[k+i]);
       i = i + 1;
       k = k + 1;
   }

}