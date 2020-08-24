
struct Box <T> {
       d:T
}

impl Box <T> {

     fn new(x:T) -> Box<T> {
     	Box {d:x}
     }

}

struct A {
       a: Box < i32 >
}

fn main(){

   let a = A {a:Box::new(1)};
   match a {
      A {a} => {println!("{}", a.d);}
   };
   //after the match the filed a in A is moved

   let a = A {a:Box::new(2)};
   match a {
      A {ref a} => {println!("{}", (*a).d);}
   };
   //after the match the filed a in A is borrowed
   
}