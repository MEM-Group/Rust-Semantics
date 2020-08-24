
struct A{
       v: Vec<bool>
}

fn main(){

   let v = vec![true,false] ;
   let a = A {v:v};
   assert_eq!((a.v)[0],true);
   assert_eq!((a.v)[4],false);
}