
fn main() {

   assert_eq!(1 & 7,1);
   assert_eq!(2 & 7,2);
   assert_eq!(3 & 7,3);
   assert_eq!(4 & 7,4);
   assert_eq!(5 & 7,5);
   assert_eq!(6 & 7,6);
   assert_eq!(7 & 7,7);
   assert_eq!(8 & 7,0);
   
   assert_eq!(0 & 7,0);

   assert_eq!(-1 & 7,7);
   assert_eq!(-2 & 7,6);
   assert_eq!(-3 & 7,5);
   assert_eq!(-4 & 7,4);
   assert_eq!(-5 & 7,3);
   assert_eq!(-6 & 7,2);
   assert_eq!(-7 & 7,1);
   assert_eq!(-8 & 7,0);



}