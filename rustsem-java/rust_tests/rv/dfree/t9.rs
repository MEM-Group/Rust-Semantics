
struct A{a:i32}

struct B{b:A}

fn main(){

   let a = A{a:1};
   let b = B{b:a};
   unsafe{ #intrinsicDeallocate(b) };
   unsafe{ #intrinsicDeallocate(b) };
}