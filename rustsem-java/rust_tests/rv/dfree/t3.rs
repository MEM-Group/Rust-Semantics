

fn main() {

   let v = [1,2];
   unsafe{ #intrinsicDeallocate(v) };
   unsafe{ #intrinsicDeallocate(v) }

}