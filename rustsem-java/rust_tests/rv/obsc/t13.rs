
fn main() {
   let v = [1,2];
   let b1 = & mut v;
   let b2 = & mut v;

   let z = (*b1)[0];
}