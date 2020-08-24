
fn test(m:i32) -> i32 {
   match m {
       1 => 6,
       2 => 5,
       3 => 4,
       4 => 3,
       5 => 2,
       6 => 1,
       default => 0
   }
}

fn main(){

   assert_eq!(test(1),6);
   assert_eq!(test(2),5);
   assert_eq!(test(3),4);
   assert_eq!(test(4),3);
   assert_eq!(test(5),2);
   assert_eq!(test(6),1);
   assert_eq!(test(7),0);
}



