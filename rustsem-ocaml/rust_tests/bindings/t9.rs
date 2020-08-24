
struct point{
       x:i32,
       y:i32
}

fn main() {

   let mut p = point {x:5,y:6};

   let b = & mut p;

   (* b).x = 7;

   println!("x:{}, y:{}", (*b).x, (*b).y);

}