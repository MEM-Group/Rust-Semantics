
fn main() {

   let plus_two = |x :i32| {
       let mut result = x;
       result = result + 1;
       result = result + 1;
       result
   } ;

   assert_eq!(4,plus_two(2));

}