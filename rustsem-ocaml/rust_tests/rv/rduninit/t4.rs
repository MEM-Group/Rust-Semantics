
struct A{a:i32}

fn main(){

   let a0 = A{a:0};
   let a1 = A{a:1};
   let a2 = A{a:2};
   let a3 = A{a:3};
   let a4 = A{a:4};

   let v = [a0,a1,a2,a3,a4];

   let t = v[2];

   println!("{}",(v[2]).a);

}