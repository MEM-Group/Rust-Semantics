
fn f<'a>(x: & 'a [i32;2]) -> & 'a [i32;2] {
   x
}

fn main() {

   let x = [1,2];

   let z = f(&x) ;

   let t = & mut x;

   let b = z;

}