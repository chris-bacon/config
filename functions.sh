
reinstallStack(){
    rm -rf ~/.stack
    rm -rf /use/local/bin/stack
    curl -sSL https://get.haskellstack.org/ | sh
}

runTest(){
    if [ -z "$1" ]; then
        echo "I need a module name"
    else
        stack test --fast --test-arguments="-m $1"
    fi
}

makeGPGKey(){
   gpg --default-new-key-algo rsa4096 --gen-key 
}

encryptFile(){
    if [ -z "$1" ]; then
        echo "I need an email and a file name"
    else
        gpg -e -r $1 $2
    fi
}
