

fn main (){
   let y = 4;
   let x = |x:i32| x + y;
   assert_eq!(x(5),9);
}