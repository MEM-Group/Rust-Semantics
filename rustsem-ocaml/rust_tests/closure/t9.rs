
struct point {
       x : i32,
       y : i32
}

fn main (){
   let p = point {x:2,y:3};
   let f = move |x:i32| {
       p.x + p.y + x
   };

   println!("{}", f(4));

}