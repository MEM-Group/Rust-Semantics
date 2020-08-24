

fn printVec(n:i32, v:Vec< i32 >) {
   if (n == 0) {
      println!("{}", v[0]);   
   } else {
      println!("{}", v[n]);
      printVec(n- 1,v);
   }
   
}

fn main(){
   let v = vec![1,2,3,4,5];
   printVec(4,v);
}