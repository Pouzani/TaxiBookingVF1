def buildJar(){
    echo "building the app ..."
    sh 'mvn package'
}

return this