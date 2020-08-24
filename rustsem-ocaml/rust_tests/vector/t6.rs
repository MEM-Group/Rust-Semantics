
struct A{
       v: Vec<i32>
}

fn main(){

   let v = vec![1,2] ;
   let a = A {v:v};
   assert_eq!((a.v)[0],1);
   assert_eq!((a.v)[1],2);
}