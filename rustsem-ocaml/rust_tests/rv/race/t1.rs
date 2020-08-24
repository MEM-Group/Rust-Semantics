
struct JoinHandle {
       handle:i32
}

impl JoinHandle{
     fn join(&self) {
     	_Rust_await((* self).handle) ;
     }
}

struct Builder {
     name: &str
}

impl Builder {
     fn new() -> Builder {
     Builder {
           name : ""
	   }
     }
     fn spawn <F,T> (self,f:F) -> JoinHandle {
     	JoinHandle{ handle:#spawn( self . name, f)}
     }
}

struct thread {}

impl thread {
     fn spawn<T>(f:T) -> JoinHandle {
     let builder = Builder::new();
     	 (builder.spawn)(f)
     }
}

struct P{x:i32} 
struct ARC{p: * mut P}

impl Sync for P {}
impl Send for ARC {}
impl Sync for ARC {}

fn main() {

    let mut v = 1;
    let mut r = ARC{p: & mut v as * mut P};
    
    let t =  move | | {
        (* (r.p)) = 4;
     };
    let handle = thread::spawn(t);

    (& handle).join();

    let z = v;
}
