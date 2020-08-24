
struct B{
       fa:i32,
       fb:i32
}

fn main() {

   let x = B{fa:1,fb:2};

   let mut i = 0;

   let z1;
   let z2;

   while(i < 2) {
        if (i==0) {
	  z1 = & mut (x.fa); 
	};
	if(i==1) {
          z2 = & mut (x);
	};
	i = i + 1;
   }

   let t =  z1;

}