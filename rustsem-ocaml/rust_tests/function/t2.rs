
struct point {
       x : i32,
       y : i32
}

fn print_number(x:point) {
   println!("point.x is: {}, point.y is: {}", x.x , x.y);
}

fn main() {

   let p = point{x: 23, y:32};

//   print_number(p);

   // The following statement cannot be execute,
   // since p is moved in the function print_number

   let z = p;

   let z = p;

}


