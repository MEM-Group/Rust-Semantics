

fn main() {

   let v = #rallocate(i32, 3) ;
   unsafe{ #intrinsicDeallocate(v) };
   unsafe{ #intrinsicDeallocate(v) }

}