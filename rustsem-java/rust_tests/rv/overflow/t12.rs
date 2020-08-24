
fn fa<'a>(x:& 'a [i32;3], i:i32) -> i32 {
   (*x)[i]
}

fn main() {
   let v = [1,2,3];

   fa(&v,0);
   fa(&v,1);
   fa(&v,2);
   fa(&v,3);
   fa(&v,4);
}