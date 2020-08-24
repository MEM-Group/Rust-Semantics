
fun f() {
    #print("Hello, World! I am thread 1", )
}
;cl 
#forkcl(valcl("thread_1"), f) ;cl
#print("Hello, World! I am thread 2",)