
fn f<'a>(x: & 'a [i32;2], y: & 'a [i32;2]) -> & 'a [i32;2] {
   y
}

fn main() {

   let x = [1,2];

   let y = [1,2];

   let z = f(& x, & y) ;

   let t = & mut x;

   let b = z;

}