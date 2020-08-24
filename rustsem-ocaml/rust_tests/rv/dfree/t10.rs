
enum A{
    a(bool),
    b(i32)
}

fn main(){

   let x = A::a(true);

   unsafe{ #intrinsicDeallocate(x) };

}