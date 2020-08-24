
struct A{
      a:i32
}

struct B {
     fa:A,
     fb:i32
}

fn main() {

   let a = A{a:2};
   let b = B{fa:a, fb:32} ;

   let c = & (b.fa);

   let t = & mut (b.fa.a) ;


   let z = c;

}