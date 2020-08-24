

fn main() {

   let x;
   {
	let v = [1,2];
	x = & v as * mut T;
   }

   unsafe{ #intrinsicDeallocate( * x) }

}