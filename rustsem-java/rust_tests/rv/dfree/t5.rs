

fn main() {

   let v;

   {
      v = 1;
   }

   unsafe{ #intrinsicDeallocate(v) }

}