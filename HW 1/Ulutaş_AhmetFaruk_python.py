# This program examines scoping in python.
msg = "global scope msg"

# Since no global variable is defined in the static scope function, 
# it is looking for the msg variable in its scope.
def static_scope():
    msg = "local scope msg" # defining local variable
    print(msg) # prints local scope msg
    def inner_local_scope():
        print("from inner", msg) # prints from inner local scope msg
    inner_local_scope() 

# In the dynamic scope function, since msg is defined with the global keyword
# inside the inner function, the print statement looks at the global variable.
def dynammic_scope():
    msg = "local scope msg" # defining local variable
    print(msg) # prints local scope msg
    def inner_glb_scope():
        global msg
        print("from inner", msg) # prints from inner local scope msg
    inner_glb_scope() 

glb_msg = "global message" # defining global variable
def global_scope():
    print(glb_msg) # prints global message
    
# create global varibale in local scope by using global keyword
def global_keyword():
    global glb_msg
    glb_msg = "This is new global message from local"

static_scope()
dynammic_scope()
global_scope()
global_keyword()
print("In main:", glb_msg) # prints In main: This is new global message from local