
fn main() {

   let x ;
   {
	let y = [1,2];
	x = & y as * mut i32;
   }

   assert_eq!((*x)[0],1);

}