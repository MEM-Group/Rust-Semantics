

fn main() {

   let v;

   {
      v = [1,2];

   }

   unsafe{ #intrinsicDeallocate(v) }

}