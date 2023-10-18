def buildJar(){
    echo "building the app ..."
    sh 'mvn package'
}

def deployImage(){
    echo "deploy the image ..."
}

return this