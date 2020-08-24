

fn example2() -> i32 {
   let closure;

   {
       let x = 3;
       closure = move | | x ;
   }

   return closure();
}

fn main(){
   assert_eq!(3,example2());
}