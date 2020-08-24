
struct A{a:i32}

fn main(){

   let a = A{a:1};
   unsafe{ #intrinsicDeallocate(a) }
}