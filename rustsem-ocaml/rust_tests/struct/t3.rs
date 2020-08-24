
struct point{x:i32, y:i32}


fn main() {

   let x = point{x:2,y:3};

   let y = & x;

   let z = & x;

   println!("{}", (*y).x);
   println!("{}", (*z).y);

}