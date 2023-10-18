pipeline{
    agent any
    tools {
      maven'Maven'
    }
    stages {

      stage("build jar") {
        steps {
          script {
            echo "building the app ..."
          }
        }
      }

      stage("build image") {
        steps {
          script {
            echo "building the docker image ..."
            withCredentials([usernamePassword(credentialsId: 'dockerhub-repo'), passwordVariable: 'PASS', usernameVariable: 'USER'])
              sh 'docker build -t pihix/taxi-app:1.0 .'
              sh "echo $PASS | docker login -u $USER --password-stdin"
              sh 'docker push pihix/taxi-app:1.0'
          }
        }
      }
    }
 }