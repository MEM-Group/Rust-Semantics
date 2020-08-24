
fn fa<'a> (x: & 'a Vec<i32>, i:i32) -> i32 {
   (*x)[i]
}

fn main() {
   let v = vec![1,2,3,4];


   fa(&v,1);
   fa(&v,2);
   fa(&v,3);
   fa(&v,4);
}