
struct point {
       x : i32,
       y : i32
}

fn main (){

   let f = move | p:point | {
       p.x + p.y 
   };

   let p = point {x:2,y:3};

   println!("{}", f(p));

}