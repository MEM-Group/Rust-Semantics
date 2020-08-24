
struct A{
       v: Vec<i32>
}

fn main(){

   let v = vec![1,2] ;
   let a = A {v:v};
   assert_eq!((a.v)[2],2);
   assert_eq!((a.v)[1],1);
}