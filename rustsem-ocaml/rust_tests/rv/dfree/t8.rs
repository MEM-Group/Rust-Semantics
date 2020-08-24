
struct A{i:i32}

struct B{a:A}

fn main(){

   let a = #rallocate(i32,3);
   unsafe{ #intrinsicDeallocate(a) };

}