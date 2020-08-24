
struct Point {
       x:i32,
       y:i32
}

fn main() {

   let p = Point{x:2,y:3};
   let t = p.x + p.y;

   println!("{}", t);

}