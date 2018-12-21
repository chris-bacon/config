reinstallStack() {
    rm -rf ~/.stack
    rm -rf /use/local/bin/stack
    curl -sSL https://get.haskellstack.org/ | sh
}

runTest() {
    if [ -z "$1" ]; then
        echo "I need a module name"
    else
        stack test --fast --test-arguments="-m $1"
    fi
}

makeGPGKey() {
   gpg --default-new-key-algo rsa4096 --gen-key 
}

encryptFile() {
    if [ -z "$1" ]; then
        echo "I need an email and a file name"
    else
        gpg -e -r $1 $2
    fi
}

mkBackup() {
    if [ -z "$1" ]; then
        echo "I need a filename"
    else
        cp -r $1 $1.bk.$(date +%s)
    fi
}

swapFiles() {
    if [ -z "$1" ] && [ -z "$2" ]; then
        echo "I two files to swap"
    else
        mv $1 $1.tmp
        mv $2 $1
        mv $1.tmp $2
    fi
}
