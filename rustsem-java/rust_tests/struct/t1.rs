
struct point{
       x:i32,
       y:i32
}

fn distance(p:point) -> i32 {
   p.x + p.y
}

fn main(){
   let p = point{x:3,y:4};
   println!("{}", distance(p));
   //let q = p; try to move p cannot be used.

}