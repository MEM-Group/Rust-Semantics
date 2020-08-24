
struct RV{
       ptr: * mut T,
       Cap:usize
}

impl RV{
     fn new() -> RV<T> {
       RV{
     	ptr: #rallocate(#TyUndef , 2),
	Cap: 0
	}
     }

     fn read(& self)  {
     	((* self).ptr) . 0 ;
     }
}



fn main() {

   let t = RV::new();

   (& t).read();

}