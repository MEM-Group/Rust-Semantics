
struct A{i:i32}

struct B{a:A}

fn main(){

   let a = A{a:1};
   let b = B{a:a};
   unsafe{ #intrinsicDeallocate(b) };
   unsafe{ #intrinsicDeallocate(b) };
}