
struct point{
       x:i32,y:i32
}

fn main() {
   let p = point{x:34,y:4};

   let t = match p {
       point{x:3,y} => y,
       point{x,y:4} => x,
       point{x,y}   => x + y
   };

   println!("{}",t);

}