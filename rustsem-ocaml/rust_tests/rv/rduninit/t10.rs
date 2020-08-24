
fn main() {

   let i = 0;
   let x = [1,2];

   let b = true;

   while (i < 10) {
      if (b) {
        b = false;
      } else {
      	 let z = x;
	 b = true;
      };
      i = i + 1;
   }

}