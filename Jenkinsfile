def gv
pipeline {
    agent any
    tools {
        // Utilisation de l'outil Maven
        maven 'Maven'
    }
    stages {
        stage("init"){
            steps {
                script {
                  gv = load"script.groovy"
                }
            }
        }
        stage("build jar") {
            steps {
                script {
                    gv.buildJar()
                }
            }
        }

        stage("build image") {
            steps {
                script {
                    echo "building the docker image ..."
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-repo', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        sh 'docker build -t pihix/taxi-app:1.0 .'
                        sh "echo $PASS | docker login -u $USER --password-stdin"
                        sh 'docker push pihix/taxi-app:1.0'
                    }
                }
            }
        }
    }
}
