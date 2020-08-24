
struct point {
       x:i32,
       y:i32
}

impl point{
     fn distance(&self) -> i32 {
     	(*self).x + (*self).y
     }
}

fn main(){

   let p = point{x:34, y:45};

   println!("{}", ((& p).distance)());

}