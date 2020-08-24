
struct A{
    fa: Vec<i32>
}

fn main(){
   let v = vec![1,2,3,4,5];
   let a = A{fa:v};

   let z = (a.fa)[5];
}